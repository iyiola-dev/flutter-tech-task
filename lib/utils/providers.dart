import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/view_models/home_vm.dart';
import 'package:tech_task/view_models/ingredient_vm.dart';

final homevm = ChangeNotifierProvider((ref) => HomeVm());
final ingredientVm = ChangeNotifierProvider((ref) => IngredientVm());
