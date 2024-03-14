import 'package:http/http.dart' as http;
import 'package:target2sell_flutter/src/models/api/rank_request.dart';
import 'package:target2sell_flutter/src/models/api/tracking_request.dart';
import 'package:target2sell_flutter/src/services/device_service.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/utils/const.dart';

class Target2SellApiService {
  Target2SellApiService._();

  static String get _userAgent =>
      '${DeviceService.appName} / ${DeviceService.appVersion}(${DeviceService.packageName}; build:${DeviceService.appBuildNumber}; ${DeviceService.platform} ${DeviceService.osVersion} / ${DeviceService.deviceName}';

  static Future<String> getRank({
    required RankRequest rankRequest,
  }) async {
    try {
      var uri = '$baseRankUrl?userCookie=${rankRequest.userId}';
      if (rankRequest.pageId != null) {
        uri += '&setId=${rankRequest.pageId}';
      }

      final resp = await http.get(
        Uri.parse(Uri.encodeFull(uri)),
        headers: {
          't2s-customer-id': rankRequest.customerId,
        },
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
          'Content-Type': 'application/x-www-form-urlencoded',
          'User-Agent': _userAgent,
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
