import 'package:hive_flutter/hive_flutter.dart';
import '../models/recipe.dart';

class HiveService {
  HiveService._();
  static final HiveService instance = HiveService._();

  static const String _recipeBoxName = 'recipeBox';

  // Başlatma fonksiyonu
  Future<void> init() async {
    await Hive.initFlutter("localdatabase");
    Hive.registerAdapter(RecipeAdapter());
    await Hive.openBox<Recipe>(_recipeBoxName);
  }

  // Recipe ekleme
  void addRecipe(Recipe recipe) {
    var box = Hive.box<Recipe>(_recipeBoxName);
    box.put(recipe.id, recipe);
  }

  // Birden fazla Recipe ekleme
  void addAllRecipes(List<Recipe> recipes) {
    var box = Hive.box<Recipe>(_recipeBoxName);
    var entries = {for (var recipe in recipes) recipe.id: recipe};
    box.putAll(entries);
  }

  // Recipe listeleme
  List<Recipe> getRecipes() {
    var box = Hive.box<Recipe>(_recipeBoxName);
    return box.values.toList();
  }

  // Recipe alma
  Recipe? getRecipe(int id) {
    var box = Hive.box<Recipe>(_recipeBoxName);
    return box.get(id);
  }

  // Recipe silme
  void deleteRecipe(int id) {
    var box = Hive.box<Recipe>(_recipeBoxName);
    box.delete(id);
  }

  // Birden fazla Recipe silme
  void deleteAllRecipes(List<int> ids) {
    var box = Hive.box<Recipe>(_recipeBoxName);
    for (var id in ids) {
      box.delete(id);
    }
  }

  // Recipe güncelleme
  void updateRecipe(int id, Recipe newRecipe) {
    var box = Hive.box<Recipe>(_recipeBoxName);
    box.put(id, newRecipe);
  }

  // Tarifin favori olup olmadığını kontrol etme
  bool isRecipeFavorite(int recipeId) {
    var box = Hive.box<Recipe>(_recipeBoxName);
    return box.get(recipeId) != null;
  }

  // Favorilerden bir tarifi çıkarma
  void removeRecipe(int recipeId) {
    var box = Hive.box<Recipe>(_recipeBoxName);
    box.delete(recipeId);
  }

  // Favori tarifleri listeleme
  List<Recipe> getFavoriteRecipes() {
    var box = Hive.box<Recipe>(_recipeBoxName);
    return box.values.toList();
  }
}
