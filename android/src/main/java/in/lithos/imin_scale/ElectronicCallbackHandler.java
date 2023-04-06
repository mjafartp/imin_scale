package in.lithos.imin_scale;

import com.neostra.electronic.ElectronicCallback;

import java.util.HashMap;

import io.flutter.plugin.common.MethodChannel;

class ElectronicCallbackHandler implements ElectronicCallback {
    private MethodChannel channel;

    public ElectronicCallbackHandler(MethodChannel channel) {
        channel = channel;
    }

    @Override
    public void electronicStatus(String s, String s1) {
        HashMap<String, String> weightInfo = new HashMap<String, String>();
        weightInfo.put("weight", s);
        weightInfo.put("weightStatus", s1);
        channel.invokeMethod("weightInfo", weightInfo);
    }
}