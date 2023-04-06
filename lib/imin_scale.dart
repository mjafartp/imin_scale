
import 'imin_scale_platform_interface.dart';

class IminScale {
  Future<String?> getPlatformVersion() {
    return IminScalePlatform.instance.getPlatformVersion();
  }
}
