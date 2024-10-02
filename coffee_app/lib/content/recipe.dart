import 'package:coffee_app/content/ingredient.dart';
import 'package:coffee_app/content/utensil.dart';

class Recipe
{
  Recipe({required this.ingredients, required this.utensils, required this.steps});
  final List<Ingredient> ingredients;
  final List<Utensil> utensils;
  final List<String> steps;
}