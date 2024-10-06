import 'package:coffee_app/content/comment.dart';
import 'package:coffee_app/content/ingredient.dart';
import 'package:coffee_app/content/utensil.dart';
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';

class Recipe
{
  Recipe({required this.title, required this.ingredients, required this.utensils, required this.steps});
  final String title;
  final List<Ingredient> ingredients;
  final List<Utensil> utensils;
  final List<String> steps;

  final List<int> ratings = [];
  final List<Comment> comments = <Comment>[];
  
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

  void _addComment(int rating, String comment)
  {
    comments.add(Comment(rating: rating, content: comment)); 
  }

  List<Widget> buildDisplay(BuildContext context)
  {

    
    void rebuildAllChildren(BuildContext context) {
      void rebuild(Element el) {
        el.markNeedsBuild();
        el.visitChildren(rebuild);
      }
      (context as Element).visitChildren(rebuild);
    }
    String string = "";
    TextStyle titleStyle = TextStyle(
      fontSize: 30
    );
    List<Widget> display =
    [
        Text(title, textScaler: TextScaler.linear(2)),
        Text('Ingredientes: ', textScaler: TextScaler.linear(1.5)),
    ];

    for(int i = 0; i < ingredients.length; i++)
    {
      display.add(Text((i + 1).toString() + ". " + ingredients[i].toString()));
    }

    display.add(Text("\nUtensilios: ", textScaler: TextScaler.linear(1.5)));

    for(int i = 0; i < utensils.length; i++)
    {
      display.add(Text((i + 1).toString() + ". " + utensils[i].toString()));
    }

    display.add(Text("\nPasos a seguir: ", textScaler: TextScaler.linear(1.5)));

    for(int i = 0; i < steps.length; i++)
    {
      display.add(Text((i + 1).toString() + ". " + steps[i].toString() + "\n"));
    }

    InputDecoration deco = InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(202, 212, 142, 49),
          hintText: 'Añadir comentario',
          hoverColor:Color.fromARGB(255, 255, 255, 255),
          contentPadding: const EdgeInsets.only(
            left: 14.0, bottom: 8.0, top: 8.0),
    );

    display.addAll([
      Text("Comentarios: \n", textScaler: TextScaler.linear(2)),
      TextField(style: TextStyle(color:  Color.fromARGB(255, 255, 255, 255)),
        decoration: deco,
        onSubmitted: (value) {
          string = value;
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(onPressed: () 
            { 
              if(string != "")
              {
                _addComment(0, string);
                string = "";
              }

              rebuildAllChildren(context);
            }, 
            child: Text("Subir")
          ),
          ElevatedButton(onPressed: () => {}, child: Text("Cancelar")),
        ],
      ),
    ]);

    for(int i = 0; i < comments.length; i++)
    {
      display.add(Text((i + 1).toString() + ". " + comments[i].toString() + "\n"));
    }

    return display;
  }
}