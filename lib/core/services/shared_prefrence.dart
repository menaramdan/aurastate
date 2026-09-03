import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  final SharedPreferenceService _sharedPreferenceService =
      SharedPreferenceService();
  late final SharedPreferences prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveOnboarding(String Key, bool value) async {
    await prefs.setBool(Key, value);
  }

  Future<bool> getOnboarding(String Key) async {
    return await prefs.getBool(Key) ?? false;
  }
}
