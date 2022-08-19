import 'package:flutter_test/flutter_test.dart';
import 'package:aaaa/aaaa.dart';
import 'package:aaaa/aaaa_platform_interface.dart';
import 'package:aaaa/aaaa_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAaaaPlatform 
    with MockPlatformInterfaceMixin
    implements AaaaPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AaaaPlatform initialPlatform = AaaaPlatform.instance;

  test('$MethodChannelAaaa is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAaaa>());
  });

  test('getPlatformVersion', () async {
    Aaaa aaaaPlugin = Aaaa();
    MockAaaaPlatform fakePlatform = MockAaaaPlatform();
    AaaaPlatform.instance = fakePlatform;
  
    expect(await aaaaPlugin.getPlatformVersion(), '42');
  });
}
