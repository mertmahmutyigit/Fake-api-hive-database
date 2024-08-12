import 'package:flutter_test/flutter_test.dart';
import 'package:api2/models/recipe.dart';

void main() {
  test('Recipe to/from JSON', () {
    // Test JSON verisi
    final json = {
      'id': 1,
      'name': 'Spaghetti Bolognese',
      'ingredients': ['spaghetti', 'minced meat', 'tomato sauce'],
      'instructions': ['Cook pasta', 'Prepare sauce', 'Mix together'],
      'prepTimeMinutes': 15,
      'cookTimeMinutes': 30,
      'servings': 4,
      'cuisine': 'Italian',
      'caloriesPerServing': 600,
      'tags': ['pasta', 'Italian'],
      'userId': 123,
      'image': 'image_url',
      'rating': 4.5,
      'reviewCount': 10,
      'mealType': ['lunch', 'dinner']
    };

    // JSON'dan Recipe nesnesi oluştur
    final recipe = Recipe.fromJson(json);

    // Recipe nesnesinin özelliklerini doğrula
    expect(recipe.id, 1);
    expect(recipe.name, 'Spaghetti Bolognese');
    expect(recipe.ingredients, ['spaghetti', 'minced meat', 'tomato sauce']);
    expect(recipe.instructions, ['Cook pasta', 'Prepare sauce', 'Mix together']);
    expect(recipe.prepTimeMinutes, 15);
    expect(recipe.cookTimeMinutes, 30);
    expect(recipe.servings, 4);
    expect(recipe.cuisine, 'Italian');
    expect(recipe.caloriesPerServing, 600);
    expect(recipe.tags, ['pasta', 'Italian']);
    expect(recipe.userId, 123);
    expect(recipe.image, 'image_url');
    expect(recipe.rating, 4.5);
    expect(recipe.reviewCount, 10);
    expect(recipe.mealType, ['lunch', 'dinner']);

    // Recipe nesnesinden JSON oluştur
    final recipeJson = recipe.toJson();

    // JSON'un doğru olduğunu doğrula
    expect(recipeJson['id'], 1);
    expect(recipeJson['name'], 'Spaghetti Bolognese');
    expect(recipeJson['ingredients'], ['spaghetti', 'minced meat', 'tomato sauce']);
    expect(recipeJson['instructions'], ['Cook pasta', 'Prepare sauce', 'Mix together']);
    expect(recipeJson['prepTimeMinutes'], 15);
    expect(recipeJson['cookTimeMinutes'], 30);
    expect(recipeJson['servings'], 4);
    expect(recipeJson['cuisine'], 'Italian');
    expect(recipeJson['caloriesPerServing'], 600);
    expect(recipeJson['tags'], ['pasta', 'Italian']);
    expect(recipeJson['userId'], 123);
    expect(recipeJson['image'], 'image_url');
    expect(recipeJson['rating'], 4.5);
    expect(recipeJson['reviewCount'], 10);
    expect(recipeJson['mealType'], ['lunch', 'dinner']);
  });
}
