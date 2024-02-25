import 'package:breaking_bad_app/data/models/characters_model.dart';
import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options;
    options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(options);
  }


  Future<List<dynamic>> getAllCharactersFromAPI() async {
    try {
      Response response = await dio.get(charactersEP);
      return response.data['results'];
    } catch (e) {
      print('##ERROR:'+e.toString());
      return [];
    }
  }
}
