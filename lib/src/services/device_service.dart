import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:target2sell_flutter/src/services/log_service.dart';
import 'package:target2sell_flutter/src/utils/utils.dart';

class DeviceService {
  DeviceService._();

  static late final AndroidDeviceInfo _androidDeviceInfo;
  static late final IosDeviceInfo _iosDeviceInfo;
  static late final PackageInfo _packageInfo;

  static Future<void> init() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      _androidDeviceInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      _iosDeviceInfo = await deviceInfo.iosInfo;
    } else {
      throw UnsupportedError('Unsupported Platform');
    }

    _packageInfo = await PackageInfo.fromPlatform();

    LogService.logger.d('DeviceService: Initialized.');
  }

  static String get platform => Platform.operatingSystem.capitalize();

  static String get deviceName {
    if (Platform.isAndroid) {
      return '${_androidDeviceInfo.manufacturer} ${_androidDeviceInfo.model}';
    } else {
      return 'Apple ${_iosDeviceInfo.model}';
    }
  }

  static String get osVersion {
    if (Platform.isAndroid) {
      return _androidDeviceInfo.version.sdkInt.toString();
    } else {
      return '${_iosDeviceInfo.systemName} ${_iosDeviceInfo.systemVersion}';
    }
  }

  static String get appName => _packageInfo.appName;
  static String get packageName => _packageInfo.packageName;
  static String get appVersion => _packageInfo.version;
  static String get appBuildNumber => _packageInfo.buildNumber;
}
