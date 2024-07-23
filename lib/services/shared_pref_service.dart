import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static final SharedPrefService _instance = SharedPrefService._internal();
  factory SharedPrefService() {
    return _instance;
  }

  SharedPrefService._internal();

  late SharedPreferences _preferences;
  String keyPoint = 'KEY_POINT';
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> savePoint(int value) async {
    return await _preferences.setInt(keyPoint, value);
  }

  int? getPoint() {
    return _preferences.getInt(keyPoint);
  }
}
