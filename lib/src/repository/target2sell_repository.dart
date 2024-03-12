import 'package:target2sell_flutter/src/errors/target2sell_errors.dart';
import 'package:target2sell_flutter/src/models/api/rank_request.dart';
import 'package:target2sell_flutter/src/models/api/tracking_request.dart';
import 'package:target2sell_flutter/src/services/api_service.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/services/preferences_service.dart';
import 'package:target2sell_flutter/src/utils/utils.dart';
import 'package:target2sell_flutter/target2sell_config.dart';

class Target2SellRepository {
  final Target2SellConfiguration config;

  Target2SellRepository({
    required this.config,
  });

  static String? get _uuid => Target2SellPreferences.getUUID();
  static String? get _rank {
    String? rank = Target2SellPreferences.getRank();

    if (rank.isNullOrEmpty()) {
      LogService.logger.d('Rank not found in preferences. Using default rank.');
      return '{"rank": "rank1"}';
    } else {
      LogService.logger.d('Rank found in preferences: $rank');
      return rank;
    }
  }

  Future<String?> getRank() async {
    if (_uuid.isNullOrEmpty()) {
      throw Target2SellUUIDMissingError();
    } else {
      final String? rank = await Target2SellApiService.getRank(
        rankRequest: RankRequest(
          customerId: config.customerId,
          userId: _uuid!,
        ),
      );

      return rank;
    }
  }

  Future<String?> sendTracking({
    required int pageId,
  }) async {
    if (_uuid.isNullOrEmpty()) {
      throw Target2SellUUIDMissingError();
    } else {
      final String? tracking = await Target2SellApiService.sendTracking(
        trackingRequest: TrackingRequest(
          customerId: config.customerId,
          pageId: pageId,
          sessionId: _uuid!,
        ),
      );

      return tracking;
    }
  }
}
