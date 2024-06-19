import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _categorytype =
          await secureStorage.getString('ff_categorytype') ?? _categorytype;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _categorytype = 'Gorecies';
  String get categorytype => _categorytype;
  set categorytype(String value) {
    _categorytype = value;
    secureStorage.setString('ff_categorytype', value);
  }

  void deleteCategorytype() {
    secureStorage.delete(key: 'ff_categorytype');
  }

  bool _demoswitch = false;
  bool get demoswitch => _demoswitch;
  set demoswitch(bool value) {
    _demoswitch = value;
  }

  int _ordertimer = 0;
  int get ordertimer => _ordertimer;
  set ordertimer(int value) {
    _ordertimer = value;
  }

  String _storeqrcode = '';
  String get storeqrcode => _storeqrcode;
  set storeqrcode(String value) {
    _storeqrcode = value;
  }

  String _scanResult = '';
  String get scanResult => _scanResult;
  set scanResult(String value) {
    _scanResult = value;
  }

  String _wrongscanresult = '';
  String get wrongscanresult => _wrongscanresult;
  set wrongscanresult(String value) {
    _wrongscanresult = value;
  }

  String _loginscanimage = '';
  String get loginscanimage => _loginscanimage;
  set loginscanimage(String value) {
    _loginscanimage = value;
  }

  List<dynamic> _productcountlist = [];
  List<dynamic> get productcountlist => _productcountlist;
  set productcountlist(List<dynamic> value) {
    _productcountlist = value;
  }

  void addToProductcountlist(dynamic value) {
    productcountlist.add(value);
  }

  void removeFromProductcountlist(dynamic value) {
    productcountlist.remove(value);
  }

  void removeAtIndexFromProductcountlist(int index) {
    productcountlist.removeAt(index);
  }

  void updateProductcountlistAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    productcountlist[index] = updateFn(_productcountlist[index]);
  }

  void insertAtIndexInProductcountlist(int index, dynamic value) {
    productcountlist.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
