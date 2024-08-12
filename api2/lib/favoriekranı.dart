import 'package:flutter/material.dart';
import 'package:api2/models/recipe.dart';
import 'package:api2/models/hive_service.dart';

class FavoriEkrani extends StatefulWidget {
  @override
  _FavoriEkraniState createState() => _FavoriEkraniState();
}

class _FavoriEkraniState extends State<FavoriEkrani> {
  final HiveService _hiveService = HiveService.instance;
  List<Recipe> favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    List<Recipe> favorites = await _hiveService.getFavoriteRecipes();
    setState(() {
      favoriteRecipes = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorilerim"),
      ),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text("Henüz favori tarif yok."))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return ListTile(
                  leading: Image.network(recipe.image),
                  title: Text(recipe.name),
                  subtitle: Text("${recipe.cookTimeMinutes} min"),
                );
              },
            ),
    );
  }
}
