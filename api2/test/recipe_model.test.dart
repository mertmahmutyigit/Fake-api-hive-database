import 'package:flutter_test/flutter_test.dart';
import 'package:api2/models/recipe.dart'; // Doğru yolu buraya yazın

void main() {
  test('Recipe model fromJson and toJson', () {
    final json = {
      "id": 1,
      "name": "Test Recipe",
      "ingredients": ["Flour", "Sugar"],
      "instructions": ["Mix ingredients", "Bake"],
      "prepTimeMinutes": 10,
      "cookTimeMinutes": 20,
      "servings": 4,
      "cuisine": "American",
      "caloriesPerServing": 200,
      "tags": ["Dessert"],
      "userId": 1,
      "image": "path/to/image",
      "rating": 4.5,
      "reviewCount": 10,
      "mealType": ["Breakfast"],
    };

    final recipe = Recipe.fromJson(json);
    final recipeJson = recipe.toJson();

    expect(recipe.id, 1);
    expect(recipe.name, 'Test Recipe');
    expect(recipe.ingredients, ['Flour', 'Sugar']);
    expect(recipe.instructions, ['Mix ingredients', 'Bake']);
    expect(recipe.prepTimeMinutes, 10);
    expect(recipe.cookTimeMinutes, 20);
    expect(recipe.servings, 4);
    expect(recipe.cuisine, 'American');
    expect(recipe.caloriesPerServing, 200);
    expect(recipe.tags, ['Dessert']);
    expect(recipe.userId, 1);
    expect(recipe.image, 'path/to/image');
    expect(recipe.rating, 4.5);
    expect(recipe.reviewCount, 10);
    expect(recipe.mealType, ['Breakfast']);

    expect(recipeJson, json);
  });
}
