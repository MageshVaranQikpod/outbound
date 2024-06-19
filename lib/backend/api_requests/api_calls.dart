import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start NanoApi Group Code

class NanoApiGroup {
  static String getBaseUrl() => 'https://dev.qikpod.com:8983/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
    'accept': 'application/json',
  };
  static PatchforspacificproductCall patchforspacificproductCall =
      PatchforspacificproductCall();
  static OrderBagAndStatusPatchCall orderBagAndStatusPatchCall =
      OrderBagAndStatusPatchCall();
  static PackingDispatchQcApiCall packingDispatchQcApiCall =
      PackingDispatchQcApiCall();
  static OrderReadyForPickupApiCall orderReadyForPickupApiCall =
      OrderReadyForPickupApiCall();
  static GetSpacificItemDetailCall getSpacificItemDetailCall =
      GetSpacificItemDetailCall();
  static StoredetailapiCall storedetailapiCall = StoredetailapiCall();
  static GetcartAndOrderdetailsCall getcartAndOrderdetailsCall =
      GetcartAndOrderdetailsCall();
  static OrderDetailCall orderDetailCall = OrderDetailCall();
  static UseridByNumberCall useridByNumberCall = UseridByNumberCall();
  static CustomersdetailsCall customersdetailsCall = CustomersdetailsCall();
}

class PatchforspacificproductCall {
  Future<ApiCallResponse> call({
    String? itemId = '',
    String? status = '',
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'patchforspacificproduct',
      apiUrl:
          '${baseUrl}nanostore/order_item/status/$itemId/?status=$status',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrderBagAndStatusPatchCall {
  Future<ApiCallResponse> call({
    String? recordId = '',
    String? dispatchBagId = '',
    String? orderStatus = '',
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "dispatch_bag_id": "$dispatchBagId",
  "order_status": "$orderStatus"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'order bag and status patch',
      apiUrl: '${baseUrl}nanostore/order/?record_id=$recordId',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PackingDispatchQcApiCall {
  Future<ApiCallResponse> call({
    int? recordId,
    String? status = '',
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'packing dispatch qc api',
      apiUrl: '${baseUrl}nanostore/order',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'record_id': recordId,
        'status': status,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  String? dispatchstation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].order_dispatch_station_name''',
      ));
  String? packingstation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].order_pack_station_name''',
      ));
  String? bagsize(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].dispatch_bag_size''',
      ));
  String? bagid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].dispatch_bag_id''',
      ));
  int? bagqty(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].dispatch_bag_qty''',
      ));
  String? totalitemscount(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].sku_order_number''',
      ));
}

class OrderReadyForPickupApiCall {
  Future<ApiCallResponse> call({
    String? status = '',
    String? selectedDate = '',
    String? storeId = '',
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'order ready for pickup api',
      apiUrl: '${baseUrl}nanostore/order/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'store_id': storeId,
        'status': status,
        'selected_date': selectedDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  int? totalcount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List<String>? orderstatus(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].order_status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? orderid(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetSpacificItemDetailCall {
  Future<ApiCallResponse> call({
    int? recordId,
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get spacific item detail',
      apiUrl: '${baseUrl}nanostore/order_items/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'record_id': recordId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? orderstatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].status''',
      ));
  String? discription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].qty_description''',
      ));
  String? itemname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_name''',
      ));
  String? slotid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].slot_id''',
      ));
  String? pickstatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_pick_status''',
      ));
  int? qty(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].item_order_qty''',
      ));
  String? img(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_images''',
      ));
}

class StoredetailapiCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'storedetailapi',
      apiUrl: '${baseUrl}nanostore/stores/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? storename(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].store_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? storeid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
}

class GetcartAndOrderdetailsCall {
  Future<ApiCallResponse> call({
    int? orderId,
    String? status = '',
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Getcart and orderdetails',
      apiUrl: '${baseUrl}nanostore/order_items',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'order_id': orderId,
        'status': status,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? itemindexids(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
  List? info(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  int? totalamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_amount''',
      ));
  int? tquantity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_quantity''',
      ));
  int? itemprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].item_price''',
      ));
  String? itemimage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_images''',
      ));
  String? itemname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_name''',
      ));
  String? itemstatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_pick_status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List<String>? slotid(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].slot_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itemtrayid(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].tray_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itempickedstatus(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].item_is_pickable''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class OrderDetailCall {
  Future<ApiCallResponse> call({
    int? orderId,
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'order detail ',
      apiUrl: '${baseUrl}nanostore/order_items',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'order_id': orderId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? itemindexids(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
  List? info(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  int? totalamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_amount''',
      ));
  int? tquantity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_quantity''',
      ));
  int? itemprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].item_price''',
      ));
  String? itemimage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_images''',
      ));
  String? itemname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_name''',
      ));
  String? itemstatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].item_pick_status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List<String>? slotid(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].slot_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itemtrayid(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].tray_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? itempickedstatus(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].item_is_pickable''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UseridByNumberCall {
  Future<ApiCallResponse> call({
    String? phone = '',
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'userid by number',
      apiUrl: '${baseUrl}nanostore/users/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'user_phone': phone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? consumerid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].address''',
      ));
  String? storeid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].store_id''',
      ));
  String? storename(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].store_name''',
      ));
  String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].user_name''',
      ));
  String? usertype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].user_type''',
      ));
}

class CustomersdetailsCall {
  Future<ApiCallResponse> call({
    int? fieldValue,
  }) async {
    final baseUrl = NanoApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'customersdetails',
      apiUrl: '${baseUrl}dbcall/?table_name=customers&field_name=id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'field_value': fieldValue,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  int? recordId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
  String? customername(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].name''',
      ));
  String? customeremail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].email''',
      ));
  String? customerphone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].phone''',
      ));
  dynamic customeraddress(dynamic response) => getJsonField(
        response,
        r'''$.records[:].address''',
      );
}

/// End NanoApi Group Code

/// Start logingroup Group Code

class LogingroupGroup {
  static String getBaseUrl() => 'https://dev.qikpod.com:8983/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
    'accept': 'application/json',
  };
  static ConsumerPostCall consumerPostCall = ConsumerPostCall();
  static GenrateOtpOCall genrateOtpOCall = GenrateOtpOCall();
  static ValidateOtpOCall validateOtpOCall = ValidateOtpOCall();
}

class ConsumerPostCall {
  Future<ApiCallResponse> call({
    int? customerId,
    int? storeId,
  }) async {
    final baseUrl = LogingroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": $customerId,
  "store_id": $storeId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'consumer post',
      apiUrl: '${baseUrl}nanostore/consumer/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenrateOtpOCall {
  Future<ApiCallResponse> call({
    String? userPhone = '',
  }) async {
    final baseUrl = LogingroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GenrateOtp o',
      apiUrl: '${baseUrl}auth/generate_mock_otp/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'user_phone': userPhone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? otp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.otp''',
      ));
  String? success(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  int? ok(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status_code''',
      ));
}

class ValidateOtpOCall {
  Future<ApiCallResponse> call({
    String? userPhone = '',
    String? otpText = '',
  }) async {
    final baseUrl = LogingroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ValidateOtp o',
      apiUrl: '${baseUrl}auth/validate_mock_otp/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'user_phone': userPhone,
        'otp_text': otpText,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? ok(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status_code''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
  String? accesstoken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  int? tokenexpiry(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expiry''',
      ));
}

/// End logingroup Group Code

class OrderItemsPatchCall {
  static Future<ApiCallResponse> call({
    int? recordId,
    String? status = '',
    String? itemPickedComment = '',
    String? itemPickStatus = '',
  }) async {
    final ffApiRequestBody = '''
{
  "item_pick_status": "$itemPickStatus",
  "item_picked_comment": "$itemPickedComment"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'order items patch',
      apiUrl:
          'https://dev.qikpod.com:8983/nanostore/order_item/status/$recordId/?status=$status',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrderpatchCall {
  static Future<ApiCallResponse> call({
    int? orderId,
    String? status = '',
  }) async {
    final ffApiRequestBody = '''
{
  "status": "$status"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'orderpatch',
      apiUrl:
          'https://dev.qikpod.com:8983/nanostore/order/status/$orderId/?status=$status',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
