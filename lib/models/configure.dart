part of background_service_provider;

class BackgroundServiceConfiguration {
  String backgroundChannel;
  String retainChannel;
  String startService;
  String stopService;

  BackgroundServiceConfiguration({
    this.backgroundChannel,
    this.retainChannel,
    this.startService,
    this.stopService,
  });
}