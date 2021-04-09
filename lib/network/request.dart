import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_task/constants/base_url.dart';
import 'package:tech_task/models/ingredient.dart';
import 'package:tech_task/models/recipe.dart';

class RequestService {
  Future<List<Ingredient>> getIngredients() async {
    List<Ingredient> ingredients = [];
    try {
      final res = await http.get("$url/ingredients");
      List resp = jsonDecode(res.body);
      resp.forEach((element) {
        ingredients.add(Ingredient.fromJson(element));
      });
      return ingredients;
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<List<Recipe>> getRecipes(List<String> params) async {
    List<Recipe> recipe = [];
    try {
      final res = await http.get("$url/recipe?ingredient=$params");
      List result = jsonDecode(res.body);
      result.forEach((element) {
        recipe.add(Recipe.fromJson(element));
      });
      return recipe;
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }
}
