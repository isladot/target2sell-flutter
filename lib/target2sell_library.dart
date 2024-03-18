import 'package:shared_preferences/shared_preferences.dart';
import 'package:target2sell_flutter/src/errors/target2sell_errors.dart';
import 'package:target2sell_flutter/src/models/api/tracking_request.dart';
import 'package:target2sell_flutter/src/models/core/target2sell_config.dart';
import 'package:target2sell_flutter/src/repository/target2sell_repository.dart';
import 'package:target2sell_flutter/src/services/device_service.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/services/preferences_service.dart';

export 'package:target2sell_flutter/src/models/api/tracking_request.dart';
export 'package:target2sell_flutter/src/models/core/target2sell_config.dart';
export 'package:target2sell_flutter/src/models/core/target2sell_page_type.dart';

class Target2Sell {
  Target2Sell({
    required Target2SellConfiguration config,
  }) {
    customerId = config.customerId;
    isCMPEnabled = config.enableCMP;
    enableDebugLogs = config.enableDebugLogs;
    sharedPreferencesInstance = config.sharedPreferencesInstance;
  }

  late String customerId;
  late bool isCMPEnabled;
  late bool enableDebugLogs;
  late SharedPreferences? sharedPreferencesInstance;

  void disableCMP() {
    isCMPEnabled = false;
  }

  void enableCMP() {
    isCMPEnabled = true;
  }

  String? getUUID() => Target2SellRepository.uuid;
  String getRank() => Target2SellRepository.rank;

  Future<void> init() async {
    LogService.init(displayDebugLogs: enableDebugLogs);

    await DeviceService.init();
    await Target2SellPreferences.init(
      instance: sharedPreferencesInstance,
    );

    Target2SellPreferences.setUUIDIfNotSetInPreferences();
    await Target2SellRepository.retrieveAndStoreRank(
      customerId: customerId,
    );

    LogService.logger.d('Target2Sell [init]: Initialized');
  }

  Future<String> sendTracking({
    required Target2SellTrackingRequest trackingRequest,
  }) =>
      _executeApiCall<String>(
        call: () => Target2SellRepository.sendTracking(
          trackingRequest: trackingRequest
            ..customerID = customerId
            ..sessionID = getUUID()
            ..userRank = getRank(),
        ),
      );

  Future<T> _executeApiCall<T>({
    required Future<T> Function() call,
  }) async {
    if (isCMPEnabled) {
      return call();
    } else {
      LogService.logger.e(Target2SellCMPError.message);

      throw Target2SellCMPError();
    }
  }
}
