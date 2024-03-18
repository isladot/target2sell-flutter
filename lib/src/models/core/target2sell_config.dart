import 'package:shared_preferences/shared_preferences.dart';

class Target2SellConfiguration {
  Target2SellConfiguration({
    required this.customerId,
    this.enableCMP = false,
    this.enableDebugLogs = true,
    this.sharedPreferencesInstance,
  });

  final String customerId;
  final bool enableCMP;
  final bool enableDebugLogs;
  final SharedPreferences? sharedPreferencesInstance;
}
