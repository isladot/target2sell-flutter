import 'package:target2sell_flutter/src/errors/target2sell_errors.dart';
import 'package:target2sell_flutter/src/repository/target2sell_repository.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/services/preferences_service.dart';
import 'package:target2sell_flutter/target2sell_config.dart';
import 'package:uuid/uuid.dart';

class Target2Sell {
  Target2Sell({
    required Target2SellConfiguration config,
  }) {
    customerId = config.customerId;
    isCMPEnabled = config.enableCMP;
    enableDebugLogs = config.enableDebugLogs;
  }

  late String customerId;
  late bool isCMPEnabled;
  late bool enableDebugLogs;

  void disableCMP() {
    isCMPEnabled = false;
  }

  void enableCMP() {
    isCMPEnabled = true;
  }

  String? get uuid => Target2SellRepository.uuid;
  String? get rank => Target2SellRepository.rank;

  Future<void> init() async {
    LogService.init(displayDebugLogs: enableDebugLogs);

    await Target2SellPreferences.init().then((_) {
      Target2SellPreferences.setUUIDIfNotSet(const Uuid().v4());
    });

    await Target2SellRepository.retrieveAndStoreRank(
      customerId: customerId,
    );

    LogService.logger.d('Target2Sell [init]: Initialized');
  }

  Future<String> sendTracking({
    required int pageId,
  }) async {
    if (isCMPEnabled) {
      return Target2SellRepository.sendTracking(
        customerId: customerId,
        pageId: pageId,
      );
    } else {
      LogService.logger.e(Target2SellCMPError.message);

      throw Target2SellCMPError();
    }
  }
}
