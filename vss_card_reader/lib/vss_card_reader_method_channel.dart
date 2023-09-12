import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'vss_card_reader_platform_interface.dart';

/// An implementation of [VssCardReaderPlatform] that uses method channels.
class MethodChannelVssCardReader extends VssCardReaderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('vss_card_reader');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> decryptKey(String encryptData) async {
    final dataKey = await methodChannel.invokeMethod<String>(
        'VssCardReader#decryptKey', encryptData);
    return dataKey;
  }

  @override
  Future<Uint8List> getUdExternalKey(Uint8List data, Uint8List key) async {
    final Uint8List dataEncrypt =
        await methodChannel.invokeMethod('VssCardReader#getUdExternalKey', [
      {"data": data, "key": key}
    ]);
    return dataEncrypt;
  }

  @override
  Future<Uint8List> encryptCBC(Uint8List data, Uint8List key) async {
    final Uint8List dataEncrypt =
        await methodChannel.invokeMethod('VssCardReader#encryptCBC', [
      {"data": data, "key": key}
    ]);
    return dataEncrypt;
  }
}
