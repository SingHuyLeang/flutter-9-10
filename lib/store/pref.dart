import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  final String key = 'counter';
  late SharedPreferences preferences;
  Future<void> setInt(int value) async {
    preferences = await SharedPreferences.getInstance();
    await preferences.setInt(key, value);
  }

  Future<int> getInt() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key) ?? -0;
  }
}
