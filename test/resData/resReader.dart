import 'dart:io';

String resData(String name) => File('test/resData/$name').readAsStringSync();
