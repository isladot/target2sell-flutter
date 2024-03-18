import 'package:target2sell_flutter/src/errors/target2sell_errors.dart';
import 'package:target2sell_flutter/src/models/api/rank_request.dart';
import 'package:target2sell_flutter/src/models/api/tracking_request.dart';
import 'package:target2sell_flutter/src/services/api_service.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/services/preferences_service.dart';
import 'package:target2sell_flutter/src/utils/const.dart';
import 'package:target2sell_flutter/src/utils/utils.dart';

class Target2SellRepository {
  Target2SellRepository._();

  static String get uuid {
    final uuid = Target2SellPreferences.getUUIDFromPreferences();

    if (uuid.isNullOrEmpty) {
      LogService.logger.e(
        'Target2SellRepository [uuid]: ${Target2SellUUIDMissingError.message}',
      );

      throw Target2SellUUIDMissingError();
    } else {
      LogService.logger.d(
        'Target2SellRepository [uuid]: UUID found in preferences. Returning $uuid.',
      );

      return uuid!;
    }
  }

  static String get rank {
    final rank = Target2SellPreferences.getRankFromPreferences();

    if (rank.isNullOrEmpty) {
      LogService.logger.d(
        'Target2SellRepository [rank]: Rank not found in preferences. Returning default rank.',
      );

      return defaultRank;
    } else {
      LogService.logger.d(
        'Target2SellRepository [rank]: Rank found in preferences. Returning $rank.',
      );

      return rank!;
    }
  }

  static Future<String> retrieveAndStoreRank({
    required String customerId,
    String? pageId,
  }) async {
    LogService.logger.d(
      'Target2SellRepository [retrieveAndStoreRank]: Processing request for UUID $uuid',
    );

    try {
      final rank = await Target2SellApiService.getRank(
        rankRequest: Target2SellRankRequest(
          customerId: customerId,
          userId: uuid,
          pageId: pageId,
        ),
      );

      Target2SellPreferences.setRankInPreferences(rank);

      LogService.logger.d(
        'Target2SellRepository [retrieveAndStoreRank]: Request successful. Rank $rank stored in preferences.',
      );

      return rank;
    } catch (error, stackTrace) {
      LogService.logger.e(
        'Target2SellRepository [retrieveAndStoreRank]: Error retrieving rank.',
        error: error,
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }

  static Future<String> sendTracking({
    required Target2SellTrackingRequest trackingRequest,
  }) async {
    LogService.logger.d(
      'Target2SellRepository [sendTracking]: Processing request for UUID $uuid.',
    );

    try {
      final tracking = await Target2SellApiService.sendTracking(
        trackingRequest: trackingRequest,
      );

      LogService.logger.d(
        'Target2SellRepository [sendTracking]: Request successful.',
      );

      return tracking;
    } catch (error, stackTrace) {
      LogService.logger.e(
        'Target2SellRepository [sendTracking]: Error sending tracking.',
        error: error,
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }
}
