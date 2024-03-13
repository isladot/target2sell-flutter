import 'package:shared_preferences/shared_preferences.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/utils/utils.dart';

class Target2SellPreferences {
  Target2SellPreferences._();

  static late final SharedPreferences _preferences;

  static const String t2sPreferencesPrefix = 'target2sell:';
  static const String t2sUUID = '${t2sPreferencesPrefix}UUID';
  static const String t2sRank = '${t2sPreferencesPrefix}Rank';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    LogService.logger.d('PreferencesService: Initialized.');
  }

  static String? getUUID() => _preferences.getString(t2sUUID);

  static void setUUIDIfNotSet(String value) {
    if (getUUID().isNullOrEmpty) {
      _preferences.setString(t2sUUID, value);
      LogService.logger.d(
        'PreferencesService: UUID $value stored.',
      );
    }
  }

  static String? getRank() => _preferences.getString(t2sRank);

  static void setRank(String value) {
    _preferences.setString(t2sRank, value);
    LogService.logger.d('PreferencesService: Rank $value stored.');
  }
}
