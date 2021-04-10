import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tech_task/models/ingredient.dart';
import 'package:tech_task/network/request.dart';
import 'package:tech_task/constants/base_url.dart';

import 'resData/resReader.dart';

final ingridenturl = "$url/ingredients";

class MockClient extends Mock implements http.Client {}

main() {
  RequestService service = RequestService();

  group('getIngridients', () {
    test('returns Ingriedients', () async {
      final client = MockClient();
      when(client.get(ingridenturl)).thenAnswer(
          (_) async => http.Response(resData('ingridient_resp.json'), 200));
      expect(await service.getIngredients(), isA<List<Ingredient>>());
    });
  });
}
