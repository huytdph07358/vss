import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vss_card_reader/vss_card_reader_method_channel.dart';

void main() {
  MethodChannelVssCardReader platform = MethodChannelVssCardReader();
  const MethodChannel channel = MethodChannel('vss_card_reader');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
