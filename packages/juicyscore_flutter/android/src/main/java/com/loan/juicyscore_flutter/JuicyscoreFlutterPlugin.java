package com.loan.juicyscore_flutter;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import com.juicyscore.juicyscorekit.JuicyScore;
import com.juicyscore.juicyscorekit.JuicyScoreBuilder;
import com.juicyscore.juicyscorekit.JuicyScoreInstance;

import org.json.JSONException;
import org.json.JSONObject;

/** JuicyscoreFlutterPlugin */
public class JuicyscoreFlutterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;
  private JuicyScoreBuilder juicyScoreBuilder;
  private final String TAG = "JuicyScoreKit";
  private final String JsonObjectMainKey = "multiplatform";

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "juicyscore_flutter");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    switch (call.method) {
      case "initAndroid" : {
        initJuicyScore(context, call);
        break;
      }
      case "startJuicyScore": {
        startJuicyScore();
        break;
      }
      case "setSingleClick": {
        try {
          JSONObject jsonObject = new JSONObject();
          jsonObject.put("setSingleClick", "");
          setMultiplatform(jsonObject);
        } catch (JSONException ignore) {}
        break;
      }
      case "setDoubleClick": {
        try {
          JSONObject jsonObject = new JSONObject();
          jsonObject.put("setDoubleClick", "");
          setMultiplatform(jsonObject);
        } catch (Exception ignore) {}
        break;
      }
      case "setMouseSpeed": {
        try {
          if (!call.hasArgument("distance") || !call.hasArgument("time")) break;
          if (call.argument("distance") == null || call.argument("time") == null) break;

          JSONObject jsonObjectValue = new JSONObject();
          jsonObjectValue.put("distance", call.argument("distance"));
          jsonObjectValue.put("time", call.argument("time"));

          JSONObject jsonObject = new JSONObject();
          jsonObject.put("setMouseSpeed", jsonObjectValue);
          setMultiplatform(jsonObject);
        } catch (Exception ignore) {}
        break;
      }
      case "setTouchRadius": {
        try {
          if (!call.hasArgument("radius")) break;
          if (call.argument("radius") == null) break;

          JSONObject jsonObjectValue = new JSONObject();
          jsonObjectValue.put("radius", (Double) call.argument("radius"));

          JSONObject jsonObject = new JSONObject();
          jsonObject.put("setTouchRadius", jsonObjectValue);
          setMultiplatform(jsonObject);
        }catch (Exception ignore) {}
        break;
      }
      case "setButtonDispersion": {
        try {
          if (!call.hasArgument("deltaX") || !call.hasArgument("deltaY")) break;
          if (call.argument("deltaX") == null || call.argument("deltaY") == null) break;

          JSONObject jsonObjectValue = new JSONObject();
          jsonObjectValue.put("deltaX", call.argument("deltaX"));
          jsonObjectValue.put("deltaY", call.argument("deltaY"));

          JSONObject jsonObject = new JSONObject();
          jsonObject.put("setButtonDispersion", jsonObjectValue);
          setMultiplatform(jsonObject);
        }catch (Exception ignore) {}
        break;
      }
      case "setContextMenu": {
        try {
          JSONObject jsonObject = new JSONObject();
          jsonObject.put("setContextMenu", "");
          setMultiplatform(jsonObject);
        } catch (Exception ignore) {}
        break;
      }
      case "detectCopy": {
        try {
          JSONObject jsonObject = new JSONObject();
          jsonObject.put("detectCopy", "");
          setMultiplatform(jsonObject);
        } catch (Exception ignore) {}
        break;
      }
      case "detectPaste": {
        try {
          JSONObject jsonObject = new JSONObject();
          jsonObject.put("detectPaste", "");
          setMultiplatform(jsonObject);
        } catch (Exception ignore) {}
        break;
      }
      case "detectCut": {
        try {
          JSONObject jsonObject = new JSONObject();
          jsonObject.put("detectCut", "");
          setMultiplatform(jsonObject);
        } catch (Exception ignore) {}
        break;
      }
      case "setScrollDistance": {
        try {
          if (!call.hasArgument("distance") || !call.hasArgument("time")) break;
          if (call.argument("distance") == null || call.argument("time") == null) break;

          JSONObject jsonObjectValue = new JSONObject();
          jsonObjectValue.put("distance", call.argument("distance"));
          jsonObjectValue.put("time", call.argument("time"));

          JSONObject jsonObject = new JSONObject();
          jsonObject.put("setScrollDistance", jsonObjectValue);
          setMultiplatform(jsonObject);
        }catch (Exception ignore) {}
        break;
      }
      case "setQuarters": {
        try {
          if (!call.hasArgument("quarter")) break;
          if (call.argument("quarter") == null) break;
          JSONObject jsonObjectValue = new JSONObject();
          jsonObjectValue.put("quarter", call.argument("quarter"));

          JSONObject jsonObject = new JSONObject();
          jsonObject.put("setQuarters", jsonObjectValue);
          setMultiplatform(jsonObject);
        }catch (Exception ignore) {}
        break;
      }
      default: result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private void setMultiplatform(JSONObject value) throws JSONException {
    try {
      JSONObject jsonObjectMain = new JSONObject();
      jsonObjectMain.put(JsonObjectMainKey, value);
      JuicyScoreInstance.shared().setMultiplatform(jsonObjectMain);
    } catch (Exception ignore) {}
  }

  private void initJuicyScore(Context context, MethodCall call) {
    if (context == null) return;
    if (call == null) return;

    juicyScoreBuilder = new JuicyScoreBuilder(context);

    if (hasArgument(call, "setRawDataApiKeyToken")) {
      juicyScoreBuilder.setRawDataApiKeyToken(call.argument("setRawDataApiKeyToken"));
    }
    if (hasArgument(call, "setEnvironment")) {
      juicyScoreBuilder.setEnvironment(environment(call.argument("setEnvironment")));
    }
    if (hasArgument(call, "setRegionalDomain")) {
      juicyScoreBuilder.setRegionalDomain(regionalDomain(call.argument("setRegionalDomain")));
    }
    if (hasArgument(call, "setSendGeo")) {
      juicyScoreBuilder.setSendGeo(call.argument("setSendGeo"));
    }
    if (hasArgument(call, "setSendGeoWithoutGoogleServices")) {
      juicyScoreBuilder.setSendGeoWithoutGoogleServices(call.argument("setSendGeoWithoutGoogleServices"));
    }
    if (hasArgument(call, "setCollectDeviceId")) {
      juicyScoreBuilder.setCollectDeviceId(call.argument("setCollectDeviceId"));
    }
    if (hasArgument(call, "setCollectGDID")) {
      juicyScoreBuilder.setCollectGDID(call.argument("setCollectGDID"));
    }
    if (hasArgument(call, "setSendHostname")) {
      juicyScoreBuilder.setSendHostname(call.argument("setSendHostname"));
    }
    if (hasArgument(call, "setSendActiveCall")) {
      juicyScoreBuilder.setSendActiveCall(call.argument("setSendActiveCall"));
    }
    if (hasArgument(call, "setSendDns")) {
      juicyScoreBuilder.setSendDns(call.argument("setSendDns"));
    }
    if (hasArgument(call, "setDebugJs")) {
      juicyScoreBuilder.setDebugJs(call.argument("setDebugJs"));
    }
    if (hasArgument(call, "setUseHtmlFile")) {
      juicyScoreBuilder.setUseHtmlFile(call.argument("setUseHtmlFile"));
    }
    if (hasArgument(call, "setCollectAppsList")) {
      juicyScoreBuilder.setCollectAppsList(call.argument("setCollectAppsList"));
    }
    if (hasArgument(call, "setCollectFoldersList")) {
      juicyScoreBuilder.setCollectFoldersList(call.argument("setCollectFoldersList"));
    }
    if (hasArgument(call, "setDiskData")) {
      juicyScoreBuilder.setDiskData(call.argument("setDiskData"));
    }
    if (hasArgument(call, "setUpTime")) {
      juicyScoreBuilder.setUpTime(call.argument("setUpTime"));
    }
    if (hasArgument(call, "setBootTime")) {
      juicyScoreBuilder.setBootTime(call.argument("setBootTime"));
    }
    if (hasArgument(call, "setBonjour")) {
      juicyScoreBuilder.setBonjour(call.argument("setBonjour"));
    }
    if (hasArgument(call, "setSendFingerPrint")) {
      juicyScoreBuilder.setSendFingerPrint(call.argument("setSendFingerPrint"));
    }
  }

  private boolean hasArgument(MethodCall call, String nameArgument) {
    return call.hasArgument(nameArgument) && call.argument(nameArgument) != null;
  }

  private JuicyScoreBuilder.Environment environment(String env) {
    if (env == null) return JuicyScoreBuilder.Environment.test;

    switch (env) {
      case "prod": return JuicyScoreBuilder.Environment.prod;
      case "jcsc": return JuicyScoreBuilder.Environment.jcsc;
      case "dev": return JuicyScoreBuilder.Environment.dev;
      default: return JuicyScoreBuilder.Environment.test;
    }
  }

  private JuicyScoreBuilder.Region regionalDomain(String reg) {
    if (reg == null) return JuicyScoreBuilder.Region.auto;

    switch (reg) {
      case "amsterdam": return JuicyScoreBuilder.Region.amsterdam;
      case "singapore": return JuicyScoreBuilder.Region.singapore;
      case "saintpetersburg": return JuicyScoreBuilder.Region.saintpetersburg;
      case "northamerica": return JuicyScoreBuilder.Region.northamerica;
      case "mumbai": return JuicyScoreBuilder.Region.mumbai;
      case "abudhabi": return JuicyScoreBuilder.Region.abudhabi;
      case "hochiminh": return JuicyScoreBuilder.Region.hochiminh;
      case "jakarta": return JuicyScoreBuilder.Region.jakarta;
      default: return JuicyScoreBuilder.Region.auto;
    }
  }

  private void startJuicyScore() {
    if (juicyScoreBuilder == null) return;
    JuicyScoreInstance.shared().start(juicyScoreBuilder, juicyScoreHandler());
  }

  private JuicyScore.Handler juicyScoreHandler() {
    return new JuicyScore.Handler() {
      @Override
      public void initiated() {
        sendMessageInDart("initiated","JuicyScoreKit was initiated.");
      }

      @Override
      public void initializationError(String message) {
        sendMessageInDart("initError","JuicyScoreKit initialization error with message: " + message);
      }

      @Override
      public void completed(String message) {
        sendMessageInDart("completed", "JuicyScoreKit completed message: " + message);
      }

      @Override
      public void stopped() {
        sendMessageInDart("stopped", "JuicyScoreKit stopped");
      }

      @Override
      public void version(String id) {
        String arguments = "JuicyScoreKit sdk version: " + JuicyScoreInstance.shared().getSdkVersion() + "| js version: " + id;
        sendMessageInDart("version", arguments);
      }

      @Override
      public void session(String id) {
        sendMessageInDart("session", id);
      }

      @Override
      public void error(String message) {
        sendMessageInDart("error", "JuicyScoreKit error with message: " + message);
      }

      @Override
      public void log(String message) {
        sendMessageInDart("log", "JuicyScoreKit log: " + message);
      }

      @Override
      public void jsLog(String message) {
        sendMessageInDart("jsLog", "JuicyScoreKit jslog: " + message);
      }

      @Override
      public void warning(JuicyScore.Event event, String message) {
        String warning = "";
        switch (event) {
          case activeCall: {
            warning = "JuicyScoreKit: active call was detected.";
            break;
          }
          case juicyJsTampering: {
            warning = "JuicyScoreKit: local juicyscore script file was modified.";
            break;
          }
          default: {
            warning = "event: " + event + " message: " + message;
          }
        }
        sendMessageInDart("warning", warning);
      }
    };
  }

  private void sendMessageInDart(String method, String arguments) {
    new Handler(Looper.getMainLooper()).post(new Runnable() {
      @Override
      public void run() {
        channel.invokeMethod(method, arguments);
      }
    });
  }
}
