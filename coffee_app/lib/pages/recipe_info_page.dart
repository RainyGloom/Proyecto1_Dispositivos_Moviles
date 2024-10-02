import 'package:coffee_app/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coffee_app/content/recipe.dart';

class RecipesInfoPage extends StatelessWidget {
  const RecipesInfoPage({super.key, required this.image});
  //final Recipe content;
  final AssetImage image;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme(),
      home: Scaffold(
        backgroundColor: getBackgroundColor(),
        body: Column(
          children: [
            Center(
              child: Image(image: image),
            )
          ] 
        ),
        bottomNavigationBar: createBottomNB(context),
      ),
    );
  }
}