import 'package:coffee_app/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coffee_app/content/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme(),
      home: Scaffold(
        backgroundColor: getBackgroundColor(),
        body: Center(
          child: Column(
            children: [
              Text(' '),
              Icon(Icons.person),
              Text('Username: ' + currentUser!.name, textScaler: TextScaler.linear(1.5)),
              Text('Email: ' + currentUser!.email, textScaler: TextScaler.linear(1.5)),
            ]
          ),
        ),
        bottomNavigationBar: createBottomNB(context),
      ),
    );
  }
}