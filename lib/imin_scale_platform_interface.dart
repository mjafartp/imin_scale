import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'imin_scale_method_channel.dart';

abstract class IminScalePlatform extends PlatformInterface {
  /// Constructs a IminScalePlatform.
  IminScalePlatform() : super(token: _token);

  static final Object _token = Object();

  static IminScalePlatform _instance = MethodChannelIminScale();

  /// The default instance of [IminScalePlatform] to use.
  ///
  /// Defaults to [MethodChannelIminScale].
  static IminScalePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IminScalePlatform] when
  /// they register themselves.
  static set instance(IminScalePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
