import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aaaa/aaaa_method_channel.dart';

void main() {
  MethodChannelAaaa platform = MethodChannelAaaa();
  const MethodChannel channel = MethodChannel('aaaa');

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
