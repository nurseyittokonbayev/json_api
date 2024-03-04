import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com$endpoint');

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          // Возвращаем данные, если они являются Map
          return response.data;
        } else if (response.data is List<dynamic>) {
          // Если данные являются List, возвращаем их в виде Map с ключом 'data'
          return {'data': response.data};
        } else {
          // В прочих случаях, когда данные не являются Map или List, кидаем ошибку
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server. Error: $e');
    }
  }
}
