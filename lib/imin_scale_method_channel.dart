import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'imin_scale_platform_interface.dart';

/// An implementation of [IminScalePlatform] that uses method channels.
class MethodChannelIminScale extends IminScalePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('imin_scale');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
