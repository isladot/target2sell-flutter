library target2sell_flutter;

import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/services/preferences_service.dart';
import 'package:target2sell_flutter/target2sell_config.dart';
import 'package:uuid/uuid.dart';

class Target2Sell {
  Target2Sell({
    required Target2SellConfiguration config,
  }) {
    isCMPEnabled = config.enableCMP;
    enableDebugLogs = config.enableDebugLogs;
    customerId = config.customerId;
  }

  late bool isCMPEnabled, enableDebugLogs;
  late String customerId;

  Future<void> init() async {
    await Target2SellPreferences.init();

    Target2SellPreferences.setUUIDIfNotSet(const Uuid().v4());

    LogService.init(displayDebugLogs: enableDebugLogs);
  }

  void enableCMP() {
    isCMPEnabled = true;
  }

  void disableCMP() {
    isCMPEnabled = false;
  }
}
