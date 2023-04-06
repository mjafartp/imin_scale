import 'package:flutter_test/flutter_test.dart';
import 'package:imin_scale/imin_scale.dart';
import 'package:imin_scale/imin_scale_platform_interface.dart';
import 'package:imin_scale/imin_scale_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIminScalePlatform
    with MockPlatformInterfaceMixin
    implements IminScalePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IminScalePlatform initialPlatform = IminScalePlatform.instance;

  test('$MethodChannelIminScale is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIminScale>());
  });

  test('getPlatformVersion', () async {
    IminScale iminScalePlugin = IminScale();
    MockIminScalePlatform fakePlatform = MockIminScalePlatform();
    IminScalePlatform.instance = fakePlatform;

    expect(await iminScalePlugin.getPlatformVersion(), '42');
  });
}
