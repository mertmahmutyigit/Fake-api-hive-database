// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      id: fields[0] as int,
      name: fields[1] as String,
      ingredients: (fields[2] as List).cast<String>(),
      instructions: (fields[3] as List).cast<String>(),
      prepTimeMinutes: fields[4] as int,
      cookTimeMinutes: fields[5] as int,
      servings: fields[6] as int,
      // difficulty: fields[7] as Difficulty, // Bu satırı kaldırdık
      cuisine: fields[8] as String,
      caloriesPerServing: fields[9] as int,
      tags: (fields[10] as List).cast<String>(),
      userId: fields[11] as int,
      image: fields[12] as String,
      rating: fields[13] as double,
      reviewCount: fields[14] as int,
      mealType: (fields[15] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.instructions)
      ..writeByte(4)
      ..write(obj.prepTimeMinutes)
      ..writeByte(5)
      ..write(obj.cookTimeMinutes)
      ..writeByte(6)
      ..write(obj.servings)
      // ..write(obj.difficulty) // Bu satırı kaldırdık
      ..writeByte(7)
      ..write(obj.cuisine)
      ..writeByte(8)
      ..write(obj.caloriesPerServing)
      ..writeByte(9)
      ..write(obj.tags)
      ..writeByte(10)
      ..write(obj.userId)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.rating)
      ..writeByte(13)
      ..write(obj.reviewCount)
      ..writeByte(14)
      ..write(obj.mealType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}