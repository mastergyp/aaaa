import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'aaaa_platform_interface.dart';

/// An implementation of [AaaaPlatform] that uses method channels.
class MethodChannelAaaa extends AaaaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('aaaa');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }


  @override
  Future<String?> installApk(String filePath, String appId) async {
    final Map<String, String> params = {'filePath': filePath, 'appId': appId};
    return await methodChannel.invokeMethod<String>('installApk', params);
  }

}
