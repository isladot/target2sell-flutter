import 'package:http/http.dart' as http;
import 'package:target2sell_flutter/src/models/api/rank_request.dart';
import 'package:target2sell_flutter/src/models/api/target2sell_user_agent.dart';
import 'package:target2sell_flutter/src/models/api/tracking_request.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/utils/const.dart';

class Target2SellApiService {
  Target2SellApiService._();

  static Future<String> getRank({
    required RankRequest rankRequest,
  }) async {
    try {
      final resp = await http.get(
        Uri.parse(Uri.encodeFull(baseRankUrl)),
        headers: rankRequest.toJson(),
      );

      LogService.logger.d(
        'Target2SellApiService [getRank]: ${resp.statusCode} - ${resp.body}',
      );

      return resp.statusCode == 204 ? defaultRank : resp.body;
    } catch (e) {
      LogService.logger.e('Target2SellApiService [getRank]: $e');

      rethrow;
    }
  }

  static Future<String> sendTracking({
    required TrackingRequest trackingRequest,
  }) async {
    try {
      final resp = await http.post(
        Uri.parse(Uri.encodeFull(baseRankUrl)),
        headers: {
          'User-Agent': Target2SellUserAgent.userAgent,
        },
        body: trackingRequest.toJson(),
      );

      LogService.logger.d(
        'Target2SellApiService [sendTracking]: ${resp.statusCode} - ${resp.body}',
      );

      return resp.body;
    } catch (e) {
      LogService.logger.e('Target2SellApiService [sendTracking]: $e');

      rethrow;
    }
  }

  static const String baseRankUrl = 'https://api.target2sell.com/user/indexes';
  static const String baseTrackingUrl =
      'https://serv-api.target2sell.com/1.1/json/T/t';
  static const String baseRecommendationUrl =
      'https://reco.target2sell.com/1.1/json/Q';
}
