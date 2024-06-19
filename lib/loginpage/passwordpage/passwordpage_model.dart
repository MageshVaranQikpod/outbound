import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'passwordpage_widget.dart' show PasswordpageWidget;
import 'package:flutter/material.dart';

class PasswordpageModel extends FlutterFlowModel<PasswordpageWidget> {
  ///  Local state fields for this page.

  int logincondition = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (ValidateOtp o)] action in PinCode widget.
  ApiCallResponse? apiResultub2Copy;
  // Stores action output result for [Backend Call - API (userid by number)] action in PinCode widget.
  ApiCallResponse? apiResultjpiCopy;
  // Stores action output result for [Backend Call - API (ValidateOtp o)] action in Button widget.
  ApiCallResponse? apiResultub2;
  // Stores action output result for [Backend Call - API (userid by number)] action in Button widget.
  ApiCallResponse? apiResultjpi;
  // Stores action output result for [Backend Call - API (GenrateOtp o)] action in Button widget.
  ApiCallResponse? apiResult9;
  // State field(s) for phonetext widget.
  FocusNode? phonetextFocusNode;
  TextEditingController? phonetextTextController;
  String? Function(BuildContext, String?)? phonetextTextControllerValidator;
  // Stores action output result for [Backend Call - API (GenrateOtp o)] action in phonetext widget.
  ApiCallResponse? apiResult9toCopy;
  // Stores action output result for [Backend Call - API (GenrateOtp o)] action in Button widget.
  ApiCallResponse? apiResult9to;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
    phonetextFocusNode?.dispose();
    phonetextTextController?.dispose();
  }
}
