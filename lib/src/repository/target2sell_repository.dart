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

  static String? get uuid => Target2SellPreferences.getUUID();
  static String get rank {
    final rank = Target2SellPreferences.getRank();

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

    if (uuid.isNullOrEmpty) {
      LogService.logger.e(
        'Target2SellRepository [retrieveAndStoreRank]: ${Target2SellUUIDMissingError.message}',
      );

      throw Target2SellUUIDMissingError();
    } else {
      try {
        final rank = await Target2SellApiService.getRank(
          rankRequest: RankRequest(
            customerId: customerId,
            userId: uuid!,
            pageId: pageId,
          ),
        );

        LogService.logger.d(
          'Target2SellRepository [retrieveAndStoreRank]: Request successful. Storing rank.',
        );

        Target2SellPreferences.setRank(rank);
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
  }

  static Future<String> sendTracking({
    required String customerId,
    required int pageId,
  }) async {
    LogService.logger.d(
      'Target2SellRepository [sendTracking]: Processing request.',
    );

    if (uuid.isNullOrEmpty) {
      LogService.logger.e(
        'Target2SellRepository [sendTracking]: ${Target2SellUUIDMissingError.message}',
      );
      throw Target2SellUUIDMissingError();
    } else {
      try {
        final tracking = await Target2SellApiService.sendTracking(
          trackingRequest: TrackingRequest(
            customerId: customerId,
            pageId: pageId,
            sessionId: uuid!,
          ),
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
}
