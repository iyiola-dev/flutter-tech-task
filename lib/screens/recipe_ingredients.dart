import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/models/ingredient.dart';
import 'package:tech_task/utils/providers.dart';
import 'package:tech_task/widgets/bodyBuilder.dart';

class RecipeView extends ConsumerWidget {
  final List<String> ingridient;
  RecipeView({this.ingridient});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final model = watch(recipevm);
    return Scaffold(
        body: BodyBuilder(
            error: model.error,
            initialWidget: FlatButton(
              color: Colors.greenAccent,
              onPressed: () => model.getRecipe(ingridient),
              child: Center(child: Text('Get Recipes')),
            ),
            apiRequestStatus: model.status,
            child: model.recipe.length == 0
                ? Center(
                    child: Text('empty'),
                  )
                : ListView.builder(
                    itemCount: model?.recipe?.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              model.recipe[i].title,
                            ),
                            subtitle: Row(
                              children: model.recipe[i].ingredients
                                  .map((e) => Text(e))
                                  .toList(),
                            ),
                          ),
                          Divider()
                        ],
                      );
                    }),
            loadingWidget: Center(child: CircularProgressIndicator()),
            reload: () => model.getRecipe(ingridient)));
  }
}
