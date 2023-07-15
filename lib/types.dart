import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'types.g.dart';

@immutable
@JsonSerializable()
class Ingredient {
  const Ingredient({
    required this.name,
    this.amount,
    this.scale,
  });

  final String name;
  final int? amount;
  final String? scale;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@immutable
@JsonSerializable()
class Recipe {
  const Recipe({
    required this.name,
    required this.ingredients,
    required this.steps,
  });

  final String name;
  final List<Ingredient> ingredients;
  final List<String> steps;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
