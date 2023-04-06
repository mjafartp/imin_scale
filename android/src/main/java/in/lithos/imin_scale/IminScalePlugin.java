package in.lithos.imin_scale;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import com.neostra.electronic.Electronic;
import com.neostra.electronic.ElectronicCallback;

/** IminScalePlugin */
public class IminScalePlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;
  private Electronic mElectronic;
  private ElectronicCallbackHandler electronicCallbackHandler;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "imin_scale");
    channel.setMethodCallHandler(this);
    electronicCallbackHandler = new ElectronicCallbackHandler(channel);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("initElectronic")) {
      mElectronic = new Electronic.Builder().setDevicePath("/dev/ttyS4").setReceiveCallback(electronicCallbackHandler).builder();
    } else {
      if (mElectronic == null) {
        throw new NullPointerException("The electronic scale has not been initialized, please use the initElectronic method to initialize");
      }
      switch (call.method) {
        case "turnZero":
          mElectronic.turnZero();
          break;
        case "removePeel":
          mElectronic.removePeel();
          break;
        case "manualPeel":
          mElectronic.manualPeel((int) call.arguments);
          break;
        case "closeElectronic":
          mElectronic.closeElectronic();
          break;
        default:
          result.notImplemented();
          break;
      }
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
