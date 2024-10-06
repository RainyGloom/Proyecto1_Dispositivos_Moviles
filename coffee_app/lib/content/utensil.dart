import 'package:flutter/material.dart';

class Utensil {
  Utensil({required this.name, required this.description});
  final String name;
  String? description;

    @override
  String toString()
  {
    String str = name;
    if(description != null && description != "")
    {
      str += ": " + description!;
    }

    return str;
  }
}