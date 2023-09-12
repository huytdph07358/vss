import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'vss_card_reader_method_channel.dart';

abstract class VssCardReaderPlatform extends PlatformInterface {
  /// Constructs a VssCardReaderPlatform.
  VssCardReaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static VssCardReaderPlatform _instance = MethodChannelVssCardReader();

  /// The default instance of [VssCardReaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelVssCardReader].
  static VssCardReaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VssCardReaderPlatform] when
  /// they register themselves.
  static set instance(VssCardReaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> decryptKey(String encryptData) {
    throw UnimplementedError('decryptKey() has not been implemented.');
  }

  Future<Uint8List> getUdExternalKey(Uint8List data, Uint8List key) async {
    throw UnimplementedError('getUdExternalKey() has not been implemented.');
  }

  Future<Uint8List> encryptCBC(Uint8List data, Uint8List key) async {
    throw UnimplementedError('encryptCBC() has not been implemented.');
  }
}
