import 'package:flutter/material.dart';

class Ingredient {
  Ingredient({required this.name, required this.portion, required this.measure});
  final String name;
  final String portion;
  final String measure;
  
  @override
  String toString()
  {
    return name + ": " + portion + ' ' + measure.toString();
  }

  factory Ingredient.fromJson(Map<String, dynamic> json)
  {
    return Ingredient(name: json['name'], portion: json['portion'], measure: json['measure']);
  }
}