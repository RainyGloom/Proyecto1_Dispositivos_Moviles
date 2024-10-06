import 'package:coffee_app/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coffee_app/content/recipe.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:math';

class RecipesInfoPage extends StatefulWidget {
  const RecipesInfoPage({super.key, required this.image});
  
  final AssetImage image;
  @override
  _RIPState createState() => _RIPState(); 
  //final Recipe content;
}

class _RIPState extends State<RecipesInfoPage>
{
  Recipe? recipe;

  Future<void> loadFromJson() async
  {
    final String response = await rootBundle.loadString('assets/saves/recipes.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      List<Recipe> recipes = data.map((recipe) => Recipe.fromJson(recipe)).toList();
      int i = Random().nextInt(recipes.length);
      recipe = recipes[i];
    });
  }
  @override
  void initState()
  {
    super.initState();
    loadFromJson();
  }
  @override
  Widget build(BuildContext context) {
    
    List<Widget> recipeWidget = [];
    recipeWidget.add(
      Center(
        child: Image(image: widget.image),
      ),
    );
    recipeWidget.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: recipe != null ? recipe!.buildDisplay(context) : [],
      ),
    );
    return MaterialApp(
      theme: mainTheme(),
      home: Scaffold(
        backgroundColor: getBackgroundColor(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: recipeWidget,
          ),
        ),
        bottomNavigationBar: createBottomNB(context),
      ),
    );
  }
}