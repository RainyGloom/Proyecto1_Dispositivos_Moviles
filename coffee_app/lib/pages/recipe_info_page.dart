import 'package:coffee_app/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coffee_app/content/recipe.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

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
      recipe = recipes[0];
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
    
    List<Widget> recipeWidget = recipe != null ? recipe!.buildDisplay() : [];
    recipeWidget.insert(0,
      Center(
        child: Image(image: widget.image),
      ),
    );
    return MaterialApp(
      theme: mainTheme(),
      home: Scaffold(
        backgroundColor: getBackgroundColor(),
        body: Column(
          children: recipeWidget,
        ),
        bottomNavigationBar: createBottomNB(context),
      ),
    );
  }
}