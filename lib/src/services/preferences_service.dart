import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class Target2SellPreferences {
  Target2SellPreferences._();

  static late final SharedPreferences _preferences;

  static const String t2sPreferencesPrefix = 'target2sell:';
  static const String t2sUUID = '${t2sPreferencesPrefix}UUID';
  static const String t2sRank = '${t2sPreferencesPrefix}Rank';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getUUID() => _preferences.getString(t2sUUID);

  static void setUUIDIfNotSet(String value) {
    String? uuid = getUUID();
    if (uuid == null || uuid.isEmpty) {
      log('Storing UUID: $value');
      _preferences.setString(t2sUUID, value);
    }
  }

  static String? getRank() => _preferences.getString(t2sRank);

  static void setRank(String value) {
    log('Storing Rank: $value');
    _preferences.setString(t2sRank, value);
  }
}
