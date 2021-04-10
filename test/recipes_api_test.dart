import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tech_task/constants/base_url.dart';
import 'package:tech_task/network/request.dart';

import 'resData/resReader.dart';

class MockClient extends Mock implements http.Client {}

main() {
  RequestService service = RequestService();
  group('getRecipes', () {
    test('returns a list of recipes', () async {
      final params = ["Ham", "Butter"];
      final recipeUrl = '$url/recipes?ingredients=$params';
      when(MockClient().get(recipeUrl)).thenAnswer((_) async =>
          http.Response('resData(test/resData/recipes_res.json)', 200));
      expect(await service.getRecipes(params), isA<List>());
    });
  });
}
