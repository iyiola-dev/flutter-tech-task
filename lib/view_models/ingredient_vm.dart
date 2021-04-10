import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/models/ingredient.dart';
import 'package:tech_task/network/request.dart';
import 'package:tech_task/network/response.dart';
import 'package:tech_task/screens/list_ingredient.dart';
import 'package:tech_task/screens/recipe_ingredients.dart';

class IngredientVm extends ChangeNotifier {
  RequestService service = RequestService();
  ApiRequestStatus status = ApiRequestStatus.uninitialized;
  List<Ingredient> ingredient = [];
  IngridientView view = IngridientView();
  List<String> pickedIngredients = [];
  String error = '';
  IngredientVm() {
    getIngredients();
  }
  Future getIngredients() async {
    try {
      status = ApiRequestStatus.loading;
      notifyListeners();
      ingredient = await service.getIngredients();
      status = ApiRequestStatus.loaded;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      status = ApiRequestStatus.error;
      error = e;
      notifyListeners();
    }
  }

  void selectIngredient(Ingredient ingredients) {
    bool picked;
    ingredient.forEach((element) {
      if (element.title == ingredients.title) {
        element.isSelected = !element.isSelected;
        picked = element.isSelected;
        print(picked.toString());
        notifyListeners();
      }
      if (picked = true) {
        pickedIngredients.add(ingredients.title);
        print(pickedIngredients);
      } else {
        pickedIngredients.remove(ingredients.title);
      }
    });

    notifyListeners();
  }

  void next(BuildContext context) {
    List<Ingredient> selectedIngredients =
        ingredient.where((ingredient) => ingredient.isSelected).toList();
    if (selectedIngredients != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RecipeView(
                    ingridient: pickedIngredients,
                  )));
    } else {
      var snackBar = SnackBar(
        content: Text('Please select ingredient'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}
