// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:just_audio/just_audio.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class Dispatchqr extends StatefulWidget {
  const Dispatchqr({
    super.key,
    this.width,
    this.height,
    this.orderid,
    this.dispatchvalue,
  });

  final double? width;
  final double? height;
  final int? orderid;
  final String? dispatchvalue;

  @override
  State<Dispatchqr> createState() => _DispatchqrState();
}

class _DispatchqrState extends State<Dispatchqr> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  bool _isProcessing = false; // Flag to indicate processing state

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code != null) {
        await _handleScannedValue(scanData.code!);
      }
    });
  }

  Future<void> _handleScannedValue(String scanValue) async {
    if (_isProcessing) return; // If already processing, exit
    _isProcessing = true; // Set the flag to indicate processing has started

    if (scanValue == widget.dispatchvalue) {
      await _playSound1();
      await actions.continuousVibration(0, 0, 0, 500);
      controller?.pauseCamera(); // Pause the camera before navigating
      context.pushNamed(
        'ordercompleted',
        queryParameters: {
          'orderid': serializeParam(
            widget.orderid,
            ParamType.int,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 400),
          ),
        },
      );
      HapticFeedback.vibrate();
    } else {
      await actions.continuousVibration(500, 1000, 500, 1000);
      // await _showWrongDispatchDialog(context, scanValue);
    }

    _isProcessing = false; // Reset the flag after processing
  }

  Future<void> _playSound1() async {
    soundPlayer1 ??= AudioPlayer();
    if (soundPlayer1!.playing) {
      await soundPlayer1!.stop();
    }
    soundPlayer1!.setVolume(1);
    await soundPlayer1!.setAsset('assets/audios/click-124467.mp3');
    await soundPlayer1!.play();
  }

  Future<void> _playSound2() async {
    soundPlayer2 ??= AudioPlayer();
    if (soundPlayer2!.playing) {
      await soundPlayer2!.stop();
    }
    soundPlayer2!.setVolume(1);
    await soundPlayer2!.setAsset('assets/audios/vib.mp3');
    await soundPlayer2!.play();
  }

  Future<void> _showWrongDispatchDialog(
      BuildContext context, String scannedValue) async {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Wrong Dispatch Station'),
          content: Text('Scanned Dispatch: $scannedValue'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    soundPlayer1?.dispose();
    soundPlayer2?.dispose();
    super.dispose();
  }
}
