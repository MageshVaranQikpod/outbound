import '/flutter_flow/flutter_flow_util.dart';
import 'qrcodemainpage_widget.dart' show QrcodemainpageWidget;
import 'package:flutter/material.dart';

class QrcodemainpageModel extends FlutterFlowModel<QrcodemainpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
