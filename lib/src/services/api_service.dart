import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:target2sell_flutter/src/models/api/rank_request.dart';
import 'package:target2sell_flutter/src/models/api/tracking_request.dart';

class Target2SellApiService {
  Target2SellApiService._();

  static Future<String?> sendTracking({
    required TrackingRequest trackingRequest,
  }) async {
    try {
      http.Response resp = await http.post(
        Uri.parse(Uri.encodeFull(baseRankUrl)),
        headers: {},
        body: trackingRequest.toJson(),
      );

      return resp.body;
    } catch (e) {
      log('Target2SellApiService [sendTracking]: $e}');

      return null;
    }
  }

  static Future<String?> getRank({
    required RankRequest rankRequest,
  }) async {
    try {
      http.Response resp = await http.get(
        Uri.parse(Uri.encodeFull(baseRankUrl)),
        headers: rankRequest.toJson(),
      );

      return resp.body;
    } catch (e) {
      log('Target2SellApiService [getRank]: $e}');

      return null;
    }
  }

  static const String baseRankUrl = 'https://api.target2sell.com/user/indexes';
  static const String baseRecommendationUrl =
      'https://reco.target2sell.com/1.1/json/Q';
  static const String baseTrackingUrl =
      'https://serv-api.target2sell.com/1.1/json/T/t';
}
