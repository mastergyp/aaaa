import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'aaaa_method_channel.dart';

abstract class AaaaPlatform extends PlatformInterface {
  /// Constructs a AaaaPlatform.
  AaaaPlatform() : super(token: _token);

  static final Object _token = Object();

  static AaaaPlatform _instance = MethodChannelAaaa();

  /// The default instance of [AaaaPlatform] to use.
  ///
  /// Defaults to [MethodChannelAaaa].
  static AaaaPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AaaaPlatform] when
  /// they register themselves.
  static set instance(AaaaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> installApk(String filePath, String appId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

}
