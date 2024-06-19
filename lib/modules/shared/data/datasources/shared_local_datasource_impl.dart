import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../errors/failure.dart';
import 'shared_local_datasource.dart';

class SharedLocalDatasourceImpl implements SharedLocalDatasource {
  SharedLocalDatasourceImpl({required this.deviceInfoPlugin});

  final DeviceInfoPlugin deviceInfoPlugin;

  @override
  Future<String> getDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceData = await deviceInfoPlugin.androidInfo;
      return androidDeviceData.id;
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceData = await deviceInfoPlugin.iosInfo;
      return iosDeviceData.identifierForVendor!;
    }

    throw const CustomError('Invalid Platform.');
  }
}
