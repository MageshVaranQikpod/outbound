import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'productscount_widget.dart' show ProductscountWidget;
import 'package:flutter/material.dart';

class ProductscountModel extends FlutterFlowModel<ProductscountWidget> {
  ///  Local state fields for this page.

  List<dynamic> initialdatas = [];
  void addToInitialdatas(dynamic item) => initialdatas.add(item);
  void removeFromInitialdatas(dynamic item) => initialdatas.remove(item);
  void removeAtIndexFromInitialdatas(int index) => initialdatas.removeAt(index);
  void insertAtIndexInInitialdatas(int index, dynamic item) =>
      initialdatas.insert(index, item);
  void updateInitialdatasAtIndex(int index, Function(dynamic) updateFn) =>
      initialdatas[index] = updateFn(initialdatas[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Getcart and orderdetails)] action in productscount widget.
  ApiCallResponse? apiResultjf6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
