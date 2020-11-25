part of background_service_provider;

class BackgroundServiceProvider {
  static BackgroundServiceConfiguration _configuration;
  MethodChannel _channel;
  MethodChannel _retainChannel;

  static final BackgroundServiceProvider _singleton = BackgroundServiceProvider._();
  BackgroundServiceProvider._();

  static BackgroundServiceProvider get instance => _singleton;

  initialize(BackgroundServiceConfiguration configuration) {
    _configuration = configuration;
    _channel = MethodChannel(configuration.backgroundChannel);
    _retainChannel = MethodChannel(configuration.retainChannel);
  }

  registerFunction(function) {
    var callbackHandle = PluginUtilities.getCallbackHandle(function);
    _channel.invokeMethod(_configuration.startService, callbackHandle.toRawHandle());
  }

  stopFunction() {
    _channel.invokeMethod(_configuration.stopService);
  }

  sendToBackground() {
    _retainChannel.invokeMethod("sendToBackground");
  }
}