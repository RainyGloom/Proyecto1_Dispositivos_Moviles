import 'package:flutter/material.dart';
import 'package:coffee_app/pages/home_page.dart';
import 'package:coffee_app/pages/profile_page.dart';
import 'package:coffee_app/content/user.dart';

User? currentUser;
Color getBackgroundColor() => Color.fromARGB(255, 232, 196, 166);

ThemeData mainTheme()
{
  return ThemeData(
    fontFamily:'seaweed', 
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 21,
          //fontWeight: FontWeight.bold,
      ),
      titleLarge:  TextStyle( 
        fontFamily: 'seaweed',
        fontSize: 21,
          //fontStyle: FontStyle.italic,
      ),
    ),
  );
}

void goingTo(BuildContext context, Widget page)
{
  Navigator.pop(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

BottomNavigationBar createBottomNB(BuildContext context)
{
  return BottomNavigationBar(
    items: 
    [
      BottomNavigationBarItem
      (
        icon: ElevatedButton(onPressed: () => goingTo(context, HomePage(user: currentUser!)), 
          child: const Icon(Icons.home)
        ),
        label: 'Home'
      ),
            BottomNavigationBarItem
      (
        icon: ElevatedButton(onPressed: () => goingTo(context, ProfilePage(user: currentUser!)), 
          child: const Icon(Icons.person)
        ),
        label: 'Perfil'
      ),
    ],
  );
}