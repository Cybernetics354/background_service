part of background_service_provider;

class AppRetainWidget extends StatelessWidget {
  const AppRetainWidget({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          if (Navigator.of(context).canPop()) {
            return true;
          } else {
            BackgroundServiceProvider.instance.sendToBackground();
            return false;
          }
        } else {
          return true;
        }
      },
      child: child,
    );
  }
}