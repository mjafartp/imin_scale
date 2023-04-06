import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imin_scale/imin_scale_method_channel.dart';

void main() {
  MethodChannelIminScale platform = MethodChannelIminScale();
  const MethodChannel channel = MethodChannel('imin_scale');

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
