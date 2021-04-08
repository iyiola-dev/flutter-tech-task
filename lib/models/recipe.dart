import 'package:tech_task/models/ingredient.dart';

class Recipe {
  String title;
  List<Ingredient> ingredients;

  Recipe({this.title, this.ingredients});

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    ingredients = json['ingredients'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['ingredients'] = this.ingredients;
    return data;
  }
}
