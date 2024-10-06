import 'package:flutter/material.dart';
import 'package:coffee_app/pages/home_page.dart';
import 'package:coffee_app/pages/common.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:coffee_app/content/user.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(_CoffeeApp());
}
class _CoffeeApp extends StatefulWidget
{
  @override
  _CoffeeAppState createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<_CoffeeApp>
{
  @override
  void initState() {
    super.initState();
    currentUser = User('Developer', 'Developer@dev.com');
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      home: HomePage(),
    );
  }
}

