import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/view_models/home_vm.dart';

final homevm = ChangeNotifierProvider((ref) => HomeVm());
