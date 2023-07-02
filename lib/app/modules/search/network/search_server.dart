import 'package:dio/dio.dart';
import 'package:zetaton/app/data/constants.dart';

class SearchServer {
  Future<Map<String, dynamic>> search(String apiLink) async {
    try {
      Dio dio = Dio();
      final response = await dio.get(apiLink,
          options: Options(headers: {"Authorization": Constants.token}));
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
