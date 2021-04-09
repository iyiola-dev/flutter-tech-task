import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/utils/providers.dart';
import 'package:tech_task/widgets/bodyBuilder.dart';
import 'package:tech_task/widgets/ingList.dart';

class IngridientView extends ConsumerWidget {
  final DateTime date;
  IngridientView({this.date});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final model = watch(ingredientVm);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          FlatButton(
              onPressed: () {
                context.read(ingredientVm).next(context);
              },
              child: Text("next"))
        ],
      ),
      body: BodyBuilder(
          error: model.error,
          initialWidget: Center(child: CircularProgressIndicator()),
          apiRequestStatus: model.status,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: model.ingredient.length == 0
                ? Center(
                    child: Text('soo empty'),
                  )
                : ListView.builder(
                    itemCount: model.ingredient.length,
                    itemBuilder: (context, i) {
                      /* to check if it has expired but tsince this test is old it has already expired  for (int i = 0; i < model.ingredient.length; i++) {
                    model.ingredient[i].isExpired =
                        DateTime.parse(model.ingredient[i].useBy)
                            .isBefore(date);
                  } */
                      return IngredientList(
                        title: model.ingredient[i].title,
                        subtitle: model.ingredient[i].useBy,
                        selected: model.ingredient[i].isSelected,
                        expired: model.ingredient[i].isExpired,
                        select: () => context
                            .read(ingredientVm)
                            .selectIngredient(model.ingredient[i]),
                      );
                    }),
          ),
          loadingWidget: Center(child: CircularProgressIndicator()),
          reload: () => context.read(ingredientVm).getIngredients()),
    );
  }
}
