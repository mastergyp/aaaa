
import 'aaaa_platform_interface.dart';

class Aaaa {
  Future<String?> getPlatformVersion() {
    return AaaaPlatform.instance.getPlatformVersion();
  }

  static Future<String?> installApk(String filePath, String appId) async {
    return AaaaPlatform.instance.installApk(filePath, appId);
  }



}
