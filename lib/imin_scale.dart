
import 'imin_scale_platform_interface.dart';
import 'package:flutter/services.dart';

typedef WeightInfoCallback = void Function(String weight, String weightStatus);

class IminScale {
  MethodChannel _channel;
  WeightInfoCallback? _weightInfoCallback;
  String _weight = '';
  String _weightStatus = '';

  IminScale()
      : _channel = MethodChannel('imin_scale');

  Future<void> initElectronic() async {
    _channel.setMethodCallHandler(_callback);
    await _channel.invokeMethod('initElectronic');
  }

  void setWeightInfoCallback(WeightInfoCallback? callback) {
    _weightInfoCallback = callback;
  }

  List<String?> getWeight() {
    return [_weight, _weightStatus];
  }

  Future<void> turnZero() async {
    await _channel.invokeMethod('turnZero');
  }

  Future<void> removePeel() async {
    await _channel.invokeMethod('removePeel');
  }

  //Manually peeled {peelWeight}g
  Future<void> manualPeel(int peelWeight) async {
    await _channel.invokeMethod('turnZero', peelWeight);
  }

  Future<void> closeElectronic() async {
    await _channel.invokeMethod('closeElectronic');
  }

  Future<dynamic> _callback(MethodCall call) {
    if (call.method == 'weightInfo') {
      if (_weightInfoCallback != null) {
        final result = call.arguments as Map<String, String>;
        _weight = result['weight'].toString();
        _weightStatus = result['weightStatus'].toString();
        _weightInfoCallback!(_weight, _weightStatus);
      }
    }
    return Future.value(true);
  }

  void dispose() {
    _weightInfoCallback = null;
    _channel.setMethodCallHandler(null);
  }
}
