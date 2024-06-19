import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'productscategorymainpage_widget.dart'
    show ProductscategorymainpageWidget;
import 'package:flutter/material.dart';

class ProductscategorymainpageModel
    extends FlutterFlowModel<ProductscategorymainpageWidget> {
  ///  Local state fields for this page.

  int? readytopick = 0;

  int? completed = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (userid by number)] action in productscategorymainpage widget.
  ApiCallResponse? customeridbynumber;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (order ready for pickup api)] action in productscategorymainpage widget.
  ApiCallResponse? apiResultm5y;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
  }
}
