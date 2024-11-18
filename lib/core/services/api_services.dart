import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    required String apiKey,
    required String contentType,
  }) async {
    final fullUrl = '$url?key=$apiKey';

    var response = await dio.post(
      fullUrl,
      data: body,
      options: Options(
        headers: {
          "Content-Type": contentType,
        },
      ),
    );

    return response;
  }
}
