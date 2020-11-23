part of background_service_provider;

class BackgroundServiceProvider {
  static String _backgroundChannel = "com.example/background_service";
  static String _startService = "startService";
  static String _stopService = "stopService";
  final _channel = MethodChannel(_backgroundChannel);
  final _retainChannel = const MethodChannel('com.example/app_retain');

  static final BackgroundServiceProvider _singleton = BackgroundServiceProvider._();
  BackgroundServiceProvider._();

  static BackgroundServiceProvider get instance => _singleton;

  registerFunction(function) {
    var callbackHandle = PluginUtilities.getCallbackHandle(function);
    _channel.invokeMethod(_startService, callbackHandle.toRawHandle());
  }

  stopFunction() {
    _channel.invokeMethod(_stopService);
  }

  sendToBackground() {
    _retainChannel.invokeMethod("sendToBackground");
  }
}