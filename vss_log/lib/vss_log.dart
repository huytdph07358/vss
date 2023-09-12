import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:vss_ivt_api/api_consumer.dart';
import 'package:vss_ivt_api/api_result_model.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/log_model.dart';
import 'package:device_info_plus/device_info_plus.dart';

class VssLog {
  static List<LogModel> _allLogContent = [];
  static List<LogModel> get allLogContent => _allLogContent;
  static const String _logDataKey = 'vxb_ticket_push.TicketPush._LogDataKey';
  static bool isRunning = false;
  static const timerSecondsNumber = 300;

  static void create(String content) {}
  static void push(String actionContent, String appCode, String version,
      {DateTime? time,
      String module = '',
      String screen = '',
      String customerCode = '00000',
      String user = ''}) async {
    DateTime createTime = time ?? DateTime.now();
    String deviceInfo = getStringAsync(_logDataKey);
    if (deviceInfo.isEmpty) {
      var deviceData = <String, dynamic>{};
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else if (defaultTargetPlatform == TargetPlatform.android) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      } else {
        deviceData = <String, dynamic>{'Error:': 'Platform isn\'t supported'};
      }
      deviceInfo = deviceData.toString();
      setValue(_logDataKey, deviceInfo);
    }

    _allLogContent.add(LogModel()
      ..Action = actionContent
      ..Module = module
      ..Screen = screen
      ..CreateTime = createTime
      ..Key = const Uuid().v1()
      ..CustomerCode = customerCode
      ..User = user
      ..Version = version
      ..ApplicationCode = appCode
      ..DeviceInfo = deviceInfo);
  }

  static Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
          ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  static Future<bool> startTimer() async {
    bool success = false;
    if (isRunning) {
      log('VssLog is running, isRunning=$isRunning');
      return true;
    }

    Timer.periodic(const Duration(seconds: timerSecondsNumber),
        (Timer timer) async {
      try {
        isRunning = true;
        log('VssLog startTimer running, isRunning=$isRunning');
        List<LogModel> logModels = _allLogContent;
        logModels = logModels.isNotEmpty
            ? logModels.where((element) => element.Key != null).toList()
            : logModels;
        var logContents = [];
        if (logModels.isNotEmpty) {
          DateTime createTime = DateTime.now();
          for (var log in logModels) {
            logContents.add({
              "THỜI_GIAN_TẠO": '${convertDateTimeToString(createTime)}',
              "THỜI_GIAN_SỬA": '${convertDateTimeToString(createTime)}',
              "NGƯỜI_TẠO": "System",
              "NGƯỜI_SỬA": "System",
              'MÃ_PHẦN_MỀM': '${log.ApplicationCode}',
              'PHIÊN_BẢN': '${log.Version}',
              'MÃ_KHÁCH_HÀNG': '${log.CustomerCode}',
              'MODULE': '${log.Module}',
              'SCREEN': '${log.Screen}',
              'THỜI_GIAN': '${convertDateTimeToString(log.CreateTime)}',
              'ACTION': '${log.Action}',
              'TÀI_KHOẢN': '${log.User}',
              'THÔNG_TIN_ĐIỆN_THOẠI': '${log.DeviceInfo}'
            });
          }
          //TODO comment tạm do server log đã ngắt
          // final Map<String, dynamic> dataBody = {"ApiData": logContents};
          // try {
          //   ApiConsumer.dotNetApi.postUnsafe(
          //       'https://log.vietsens.vn/api/LogModuleActivity/CreateList',
          //       body: dataBody);
          // } catch (exx) {
          //   log(exx);
          // }
          var listKey = logModels.map((e) => e.Key).toList();
          _allLogContent = _allLogContent
              .where((element) => !listKey.contains(element.Key))
              .toList();
          isRunning = false;
          success = true;
          log('call api https://log.vietsens.vn/api/LogModuleActivity/CreateList, data count = ${logModels.length}');
        } else {
          isRunning = false;
        }
      } catch (e) {
        isRunning = false;
        log(e);
      }
    });
    return success;
  }

  static String convertDateTimeToString(DateTime? dt) {
    String dateTimeString = '';
    dateTimeString = (dt != null)
        ? '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}T${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}'
        : '';
    return dateTimeString;
  }
}
