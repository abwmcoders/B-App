import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import '../domain/model/model.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = 'Unknown';
  String version = 'Unknown';
  String identifier = 'Unknown';
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.androidId;
      name = build.version.codename;
    } else if (Platform.isIOS) {
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      identifier = build.identifierForVendor;
      name = build.systemVersion;
    }
  } on PlatformException {
    return DeviceInfo(
      name,
      version,
      identifier,
    );
  }
  return DeviceInfo(
    name,
    version,
    identifier,
  );
}
