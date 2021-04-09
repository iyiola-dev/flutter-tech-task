import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/screens/list_ingredient.dart';

class HomeVm extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  Future<void> getDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1995, 6, 16),
        lastDate: DateTime(2030, 6, 16));

    selectedDate = picked;
    notifyListeners();
  }

  void ops(BuildContext context, DateTime date) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => IngridientView(
                  date: date,
                )));
  }
}
