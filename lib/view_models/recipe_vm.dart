import 'package:flutter/cupertino.dart';
import 'package:tech_task/models/ingredient.dart';
import 'package:tech_task/models/recipe.dart';
import 'package:tech_task/network/request.dart';
import 'package:tech_task/network/response.dart';

class RecipeVm extends ChangeNotifier {
  ApiRequestStatus status = ApiRequestStatus.uninitialized;
  RequestService service = RequestService();
  String error = '';
  List<Recipe> recipe = [];
  Future getRecipe(List<String> params) async {
    try {
      status = ApiRequestStatus.loading;
      notifyListeners();

      recipe = await service.getRecipes(params);
      status = ApiRequestStatus.loaded;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      status = ApiRequestStatus.error;
      error = e.toString();
      notifyListeners();
    }
  }
}
