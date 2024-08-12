import 'package:api2/detail_screen.dart';
import 'package:api2/models/hive_service.dart';
import 'package:api2/services.dart';
import 'package:flutter/material.dart';

import '../favoriekranı.dart';
import '../models/recipe.dart';


 // Hive'ı kullanabilmek için

class RecipesHomeScreen extends StatefulWidget {
  const RecipesHomeScreen({super.key});

  @override
  State<RecipesHomeScreen> createState() => _RecipesHomeScreenState();
}

class _RecipesHomeScreenState extends State<RecipesHomeScreen> {
  List<Recipe> recipesModel = [];
 final HiveService _hiveService = HiveService.instance;


  Future<void> myRecipes() async {
    recipesItem().then((value) {
      setState(() {
        recipesModel = value;
      });
    });
  }

  @override
  void initState() {
    myRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes App From Api"), actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriEkrani(), // FavoriEkranı sayfasına yönlendirin
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: recipesModel.length,
        itemBuilder: (context, index) {
          final recipes = recipesModel[index];
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [ 
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(recipe: recipes),
                      ),
                    );
                  },
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(recipes.image),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(-5, 7),
                        ),
                      ],
                    ),
                  ),
                ),
                
               Positioned(
  top: 10,
  right: 10,
  child: IconButton(
    icon: Icon(
      Icons.favorite_border,
      color: Colors.white,
    ),
    onPressed: () async {
      try {
        // Tarifin favori olup olmadığını kontrol et
        bool isFavorite = _hiveService.isRecipeFavorite(recipes.id);

        if (isFavorite) {
          // Eğer favoriyse, favorilerden çıkar
          _hiveService.removeRecipe(recipes.id);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${recipes.name} favorilerden çıkarıldı!'),
            ),
          );
        } else {
          // Eğer favori değilse, favorilere ekle
          _hiveService.addRecipe(recipes);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${recipes.name} favorilere eklendi!'),
            ),
          );
        }

        // Durumu güncellemek için setState çağırmak isteyebilirsiniz
        setState(() {});
      } catch (e) {
        // Hata durumunu yakalayın ve bir hata mesajı gösterin
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bir hata oluştu: $e'),
          ),
        );
      }
    },
  ),
),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              recipes.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          recipes.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          recipes.cookTimeMinutes.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "min",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      
    );
  }
}
