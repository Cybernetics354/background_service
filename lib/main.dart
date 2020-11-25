import 'package:background_service/background_service_provider.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "background service",
      home: AppRetainWidget(
        child: HomeTestingMainView(),
      )
    );
  }
}

class HomeTestingMainView extends StatefulWidget {
  @override
  _HomeTestingMainViewState createState() => _HomeTestingMainViewState();
}

class _HomeTestingMainViewState extends State<HomeTestingMainView> {
  registerFunction() {
    BackgroundServiceProvider.instance.registerFunction(backgroundFunction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              registerFunction();
            },
          ),
          SizedBox(width: 20.0,),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              BackgroundServiceProvider.instance.stopFunction();
            },
          )
        ],
      ),
    );
  }
}

void backgroundFunction() {
  WidgetsFlutterBinding.ensureInitialized();
  FunctionBackground.instance.callback();
}

class FunctionBackground {
  static final FunctionBackground _singleton = FunctionBackground._();

  FunctionBackground._();
  static FunctionBackground get instance => _singleton;

  callback() {
    Stream.periodic(Duration(seconds: 1)).listen((event) {
      print("This is value :: $event");
    });
  }
}
