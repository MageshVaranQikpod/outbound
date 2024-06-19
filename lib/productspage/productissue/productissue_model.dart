import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'productissue_widget.dart' show ProductissueWidget;
import 'package:flutter/material.dart';

class ProductissueModel extends FlutterFlowModel<ProductissueWidget> {
  ///  Local state fields for this page.

  String? reasonsons;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (order items patch)] action in Container widget.
  ApiCallResponse? patchsub;
  var scanvalue = '';
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (order items patch)] action in Button widget.
  ApiCallResponse? patchsubmit;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
