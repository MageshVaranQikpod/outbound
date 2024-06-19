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

import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart' as actions;
import 'package:just_audio/just_audio.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({
    super.key,
    this.width,
    this.height,
    this.storelist,
  });

  final double? width;
  final double? height;
  final List<String>? storelist;

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  bool isProcessing = false; // Variable to prevent multiple scans at once

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
      body: Stack(
        children: [
          Column(
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
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      // Ensure the scan is not currently processing
      // if (!isProcessing) {
      //   setState(() {
      //     isProcessing =
      //         true; // Set isProcessing to true to prevent multiple scans
      //   });

      if (widget.storelist != null &&
          widget.storelist!.contains(scanData.code)) {
        print(widget.storelist);
        await actions.continuousVibration(0, 0, 0, 500);
        context.goNamed(
          'Passwordpage',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 400),
            ),
          },
        );
        await _playSound1();
        FFAppState().wrongscanresult = '';
        FFAppState().storeqrcode = scanData.code!;
        HapticFeedback.vibrate();
      } else {
        print(widget.storelist);
        await actions.continuousVibration(500, 1000, 500, 1000);
        // await _playSound2();
        // await _showWrongStoreDialog(context, scanData.code ?? 'Unknown code');
        FFAppState().wrongscanresult = 'Wrong store please scan Again !';
      }

      // Reset isProcessing after a short delay
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          isProcessing = false; // Reset isProcessing to allow next scan
        });
      });
    });
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

  // Future<void> _playSound2() async {
  //   soundPlayer2 ??= AudioPlayer();
  //   if (soundPlayer2!.playing) {
  //     await soundPlayer2!.stop();
  //   }
  //   soundPlayer2!.setVolume(1);
  //   await soundPlayer2!.setAsset('assets/audios/vib.mp3');
  //   await soundPlayer2!.play();
  // }

  Future<void> _showWrongStoreDialog(
      BuildContext context, String scannedValue) async {
    String storeListString =
        widget.storelist?.join(', ') ?? 'No stores available';
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Wrong store please scan again'),
          content: Text(
              'Scanned Store Name: $scannedValue\nAvailable Stores: $storeListString'), // Show the scanned value and the list of stores
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
    super.dispose();
  }
}
