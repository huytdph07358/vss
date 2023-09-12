import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:vss_card_reader/vss_card_reader_platform_interface.dart';
import 'package:vss_card_reader/vss_card_reader_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVssCardReaderPlatform
    with MockPlatformInterfaceMixin
    implements VssCardReaderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> decryptKey(String encryptData) {
    // TODO: implement decryptKey
    return Future.value(encryptData);
  }

  @override
  Future<Uint8List> getUdExternalKey(Uint8List data, Uint8List key) {
    // TODO: implement getUdExternalKey
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> encryptCBC(Uint8List data, Uint8List key) {
    // TODO: implement encryptCBC
    throw UnimplementedError();
  }
}

void main() {
  final VssCardReaderPlatform initialPlatform = VssCardReaderPlatform.instance;

  test('$MethodChannelVssCardReader is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVssCardReader>());
  });

  test('getPlatformVersion', () async {
    // VssCardReader VssCardReader = VssCardReader();
    // MockVssCardReaderPlatform fakePlatform = MockVssCardReaderPlatform();
    // VssCardReaderPlatform.instance = fakePlatform;
    //
    // expect(await VssCardReader.getPlatformVersion(), '42');
  });
}
