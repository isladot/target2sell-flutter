import 'package:target2sell_flutter/src/services/device_service.dart';

class Target2SellUserAgent {
  Target2SellUserAgent._();

  static String get userAgent =>
      '${DeviceService.appName} / ${DeviceService.appVersion}(${DeviceService.packageName}; build:${DeviceService.appBuildNumber}; ${DeviceService.platform} ${DeviceService.osVersion} / ${DeviceService.deviceName}';
}
