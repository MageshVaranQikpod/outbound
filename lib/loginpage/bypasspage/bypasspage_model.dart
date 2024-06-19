import '/flutter_flow/flutter_flow_util.dart';
import 'bypasspage_widget.dart' show BypasspageWidget;
import 'package:flutter/material.dart';

class BypasspageModel extends FlutterFlowModel<BypasspageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
