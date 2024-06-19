import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'qccheck_widget.dart' show QccheckWidget;
import 'package:flutter/material.dart';

class QccheckModel extends FlutterFlowModel<QccheckWidget> {
  ///  Local state fields for this page.

  String productsearch = '';

  List<String> productname = [];
  void addToProductname(String item) => productname.add(item);
  void removeFromProductname(String item) => productname.remove(item);
  void removeAtIndexFromProductname(int index) => productname.removeAt(index);
  void insertAtIndexInProductname(int index, String item) =>
      productname.insert(index, item);
  void updateProductnameAtIndex(int index, Function(String) updateFn) =>
      productname[index] = updateFn(productname[index]);

  int? zeroquantity = 0;

  int? zeroquantity1 = 0;

  int quantity = 1;

  int quantity1 = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var packingresult = '';
  // Stores action output result for [Backend Call - API (orderpatch)] action in Button widget.
  ApiCallResponse? packingstationresult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
