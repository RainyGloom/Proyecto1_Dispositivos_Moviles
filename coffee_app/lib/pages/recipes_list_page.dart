import 'package:coffee_app/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipesListPage extends StatelessWidget {
  const RecipesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme(),
      home: Scaffold(
        backgroundColor: getBackgroundColor(),
        body: Center(
          child: Text('Hello World!'),
        ),
        floatingActionButton: 
            FloatingActionButton(onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.white,
              child: SizedBox(
                width: 25,
                height: 25,
                child: RotatedBox(quarterTurns: 2, 
                  child: SvgPicture.asset('assets/images/icons/arrow.svg')
                ),
              ),
        )
      ),
    );
  }
}