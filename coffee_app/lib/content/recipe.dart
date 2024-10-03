import 'package:coffee_app/content/ingredient.dart';
import 'package:coffee_app/content/utensil.dart';
import 'package:flutter/material.dart';

class Recipe
{
  Recipe({required this.title, required this.ingredients, required this.utensils, required this.steps});
  final String title;
  final List<Ingredient> ingredients;
  final List<Utensil> utensils;
  final List<String> steps;
  
  factory Recipe.fromJson(Map<String, dynamic> json)
  {
    List<Ingredient> ingredients = (json['ingredients'] as List).map((ingredient)
      {
        return Ingredient(
          name: ingredient['name'], 
          portion: ingredient['portion'], 
          measure: ingredient['measure'],
        );
      },
    ).toList();
    print(ingredients.length);
    List<Utensil> utensils = (json['utensils'] as List).map((utensil)
    {
        return Utensil(
          name: utensil['name'], 
          description: utensil['description']
        );
    }).toList();
    print('d: ' + utensils.length.toString());

    List<String> steps = (json["steps"] as List).map((step)
    {
      return step["step"].toString();
    }).toList();
    print(steps.length);
    return Recipe(
      title: json['title'],
      ingredients: ingredients,
      utensils: utensils,
      steps: steps,
    );
  }

  List<Widget> buildDisplay()
  {
    return [
        Text(title),
        Text('Ingredientes: '),
        /*ListView.builder(
          itemCount: ingredients.length,
          itemBuilder: (context, index) 
          {
            return Text(index.toString() + '. ' + ingredients[index].toString());
          },
        ),*/
        Text('Utensilios: '),
        /*ListView.builder(
          itemCount: utensils.length,
          itemBuilder: (context, index)
          {
            return Text(index.toString() + '. ' + utensils[index].toString());
          },
        ),*/
      ];
  }
}