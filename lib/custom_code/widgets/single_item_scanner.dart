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

import '/backend/api_requests/api_calls.dart';
import 'dart:async';
import 'package:qikpod_nanostore_outbound/productspage/productscount/productscount_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import '/custom_code/actions/index.dart' as actions;

class SingleItemScanner extends StatefulWidget {
  const SingleItemScanner({
    super.key,
    this.width,
    this.height,
    this.id,
    this.slotid,
    this.orderid,
  });

  final double? width;
  final double? height;
  final int? id;
  final String? slotid;
  final int? orderid;

  @override
  State<SingleItemScanner> createState() => _SingleItemScannerState();
}

class _SingleItemScannerState extends State<SingleItemScanner> {
  late ProductscountModel _model;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  bool _isProcessing = false; // Flag to indicate processing state

  @override
  void initState() {
    super.initState();
    soundPlayer1 = AudioPlayer();
    soundPlayer2 = AudioPlayer();
    _model = createModel(context, () => ProductscountModel());
  }

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
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
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

  Future<void> fetchLatestData() async {
    try {
      var apiResult = await NanoApiGroup.getcartAndOrderdetailsCall.call(
        orderId: widget.orderid,
        status: 'picking_started',
      );
      print(apiResult);

      if (apiResult.succeeded ?? false) {
        if (apiResult.jsonBody != null && apiResult.jsonBody.isNotEmpty) {
          setState(() {
            _model.initialdatas = NanoApiGroup.getcartAndOrderdetailsCall
                .info(apiResult.jsonBody!)!
                .toList()
                .cast<dynamic>();

            FFAppState().productcountlist = NanoApiGroup
                .getcartAndOrderdetailsCall
                .info(apiResult.jsonBody!)!
                .toList()
                .cast<dynamic>();
          });
          _isProcessing = false;
        }
      } else {
        setState(() {
          _model.initialdatas = []; // Assuming _model.initialdatas is a List

          FFAppState().productcountlist = [];
        });
        controller?.pauseCamera();
        context.goNamed(
          'itempackstation',
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
              duration: Duration(milliseconds: 500),
            ),
          },
        );
        // Debugging output
        print('Failed to fetch latest data');
      }
    } catch (e) {
      print('Error fetching latest data: $e');
    }
  }

  Future<void> _handleScannedValue(String scanValue) async {
    if (_isProcessing) return; // If already processing, exit
    _isProcessing = true; // Set the flag to indicate processing has started

    print('Scanned value: $scanValue'); // Debugging output
    // await Future.delayed(Duration(seconds: 2));

    if (scanValue == widget.slotid) {
      await actions.continuousVibration(0, 0, 0, 500);

      // API call to complete the order
      try {
        var apiResult = await OrderItemsPatchCall.call(
          recordId: widget.id,
          status: 'pickup_completed',
        );

        print('API call result: ${apiResult.jsonBody}'); // Debugging output
        if (apiResult.succeeded ?? false) {
          await _playSound1();
          // Call the fetchLatestData function to fetch new data
          await fetchLatestData();

          // Use setState to refresh the UI with the new data
          setState(() {
            // Refresh the UI or update the list
          });

          // Add a delay before allowing another scan action
          // await Future.delayed(Duration(seconds: 2));
        } else {
          print('OrderItemsPatchCall failed');
          // Handle the failure
        }
      } catch (e) {
        print('Error during API call: $e'); // Debugging output
      } finally {
        _isProcessing = false; // Reset the flag
      }
    } else {
      // await _playSound2();
      await actions.continuousVibration(500, 1000, 500, 1000);
      _isProcessing = false; // Reset the flag for invalid scan
    }
  }

  Future<void> _playSound1() async {
    if (soundPlayer1!.playing) {
      await soundPlayer1!.stop();
    }
    soundPlayer1!.setVolume(1);
    await soundPlayer1!.setAsset('assets/audios/click-124467.mp3');
    await soundPlayer1!.play();
  }

  Future<void> _playSound2() async {
    if (soundPlayer2!.playing) {
      await soundPlayer2!.stop();
    }
    soundPlayer2!.setVolume(1);
    await soundPlayer2!.setAsset('assets/audios/vib.mp3');
    await soundPlayer2!.play();
  }

  Future<void> _showWrongStoreDialog(
      BuildContext context, String scannedValue) async {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Failed to pickup re-scan'),
          content: Text('Scanned Value: $scannedValue'),
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
