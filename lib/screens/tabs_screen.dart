import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../components/main_drawer.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Widget>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': Text('Lista de Categorias'),
        'screen': CategoriesScreen(),
      },
      {
        'title': Text('Meus Favoritos'),
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals)
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _screens[_selectedScreenIndex]['title'],
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categotias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
