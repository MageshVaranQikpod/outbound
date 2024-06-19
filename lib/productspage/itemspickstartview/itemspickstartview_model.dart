import '/backend/api_requests/api_calls.dart';
import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'itemspickstartview_widget.dart' show ItemspickstartviewWidget;
import 'package:flutter/material.dart';

class ItemspickstartviewModel
    extends FlutterFlowModel<ItemspickstartviewWidget> {
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
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (orderpatch)] action in Button widget.
  ApiCallResponse? pickingstated;
  // Model for DRAWER component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
