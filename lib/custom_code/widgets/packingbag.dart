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

class Packingbag extends StatefulWidget {
  const Packingbag({
    super.key,
    this.width,
    this.height,
    this.orderid,
  });

  final double? width;
  final double? height;
  final int? orderid;

  @override
  State<Packingbag> createState() => _PackingbagState();
}

class _PackingbagState extends State<Packingbag> {
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

    await actions.continuousVibration(0, 0, 0, 500);
    controller?.pauseCamera(); // Pause the camera before navigating
    context.pushNamed(
      'dispatch',
      queryParameters: {
        'orderid': serializeParam(widget.orderid, ParamType.int),
        'bagid': serializeParam(scanValue, ParamType.String),
      }.withoutNulls,
      extra: <String, dynamic>{
        kTransitionInfoKey: TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 300),
        ),
      },
    );
    await _playSound1();
    HapticFeedback.vibrate();

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

  @override
  void dispose() {
    controller?.dispose();
    soundPlayer1?.dispose();
    soundPlayer2?.dispose();
    super.dispose();
  }
}
