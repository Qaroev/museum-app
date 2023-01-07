import 'package:shared_preferences/shared_preferences.dart';


class LocalStorageService {
  Future<SharedPreferences>? _ps;

  LocalStorageService() {
    _ps = SharedPreferences.getInstance();
  }

  Future saveData(String key, String data) async {
    await _ps!.then((value) => value.setString(key, data));
  }
  Future saveDataList(String key, List<String> data) async {
    await _ps!.then((value) => value.setStringList(key, data));
  }

  Future<String?> getData(String key) async {
    return _ps!.then((value) => value.getString(key));
  }

  Future removeData(String key) async {
    await _ps!.then((value) => value.remove(key));
  }
}
