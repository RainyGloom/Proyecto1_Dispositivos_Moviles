import 'package:coffee_app/pages/recipe_info_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/pages/common.dart';
import 'package:coffee_app/pages/profile_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:coffee_app/content/user.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});
  final User user;

  List<ElevatedButton> createOptions(BuildContext context)
  {
    return [
      ElevatedButton(onPressed: () => goingTo(context, ProfilePage(user: user)), 
        child: const Text('Ver perfil')
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemWidth = 200;
    return MaterialApp(
      title: 'Coffee Experience',
      theme: mainTheme(),
      home: Scaffold(
        backgroundColor: getBackgroundColor(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: MasonryGridView.count(
                  itemCount: 50,
                  mainAxisSpacing: 10,
                  crossAxisCount: (width/itemWidth).toInt(),
                  itemBuilder: (context, index) 
                  {
                    int randomHeight = Random().nextInt(6);
                    int imageIndex = Random().nextInt(7) + 1;
                    double itemHeight = (randomHeight % 5 + 2) * 100;
                    AssetImage asset = AssetImage('assets/images/menu/coffee' + imageIndex.toString() + '.jpg');
                    return UnconstrainedBox(
                      child: Container(
                        width: itemWidth,
                        height: itemHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: asset,
                          )
                        ),
                        child: 
                          TextButton(onPressed: () => goingTo(context, RecipesInfoPage(image: asset)),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states)
                              {
                                if (states.contains(WidgetState.pressed)) {
                                  return Theme.of(context).colorScheme.primary.withOpacity(0.05);
                                }
                                return null;
                              },
                            ),
                          ), 
                          child: Text(' '),
                        ),
                      ),
                    );
                  }
                )
              )
            ]
          ),
        ),
        bottomNavigationBar: createBottomNB(context),
        appBar: AppBar(
          leading: Builder(builder: (context)
          {
            return IconButton(onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            );
          },
          ),
        ),
        drawer: Drawer(
          child: ListView(children: createOptions(context)),
        ),
      ),
    );
  }
}