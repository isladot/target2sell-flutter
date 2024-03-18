import 'package:shared_preferences/shared_preferences.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/utils/utils.dart';
import 'package:uuid/uuid.dart';

class Target2SellPreferences {
  Target2SellPreferences._();

  static late final SharedPreferences _preferences;

  static const String t2sPreferencesPrefix = 'target2sell:';
  static const String t2sUUID = '${t2sPreferencesPrefix}UUID';
  static const String t2sRank = '${t2sPreferencesPrefix}Rank';

  static Future<void> init({
    SharedPreferences? instance,
  }) async {
    _preferences = instance ?? await SharedPreferences.getInstance();

    LogService.logger.d('PreferencesService: Initialized.');
  }

  static String? getUUIDFromPreferences() => _preferences.getString(t2sUUID);

  static void setUUIDIfNotSetInPreferences() {
    final localUUID = getUUIDFromPreferences();

    if (localUUID.isNullOrEmpty) {
      final uuid = const Uuid().v4();
      _preferences.setString(t2sUUID, uuid);

      LogService.logger.d(
        'PreferencesService: UUID $uuid stored.',
      );
    } else {
      LogService.logger.d(
        'PreferencesService: UUID $localUUID already stored.',
      );
    }
  }

  static String? getRankFromPreferences() => _preferences.getString(t2sRank);

  static void setRankInPreferences(String rank) {
    _preferences.setString(t2sRank, rank);

    LogService.logger.d(
      'PreferencesService: Rank $rank stored.',
    );
  }
}
