import 'package:dio/dio.dart';
import 'package:taxi_driver_app/global/global.dart';

class LoginServices {

  static Future loginRequest(postData) async {
    final dio = Dio();

    var url = '$baseUrl/auth/login';

    String token = 'f7ca7863-0727-4d38-ba86-6e18596571f1';
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["token"] = token;

    try {
      final Response response = await dio.post(url, data: postData);
      return response;
    } on DioException catch (e) {
      // Handle DioError specifically
      final response = e.response;
      if (response != null) {
        // Request made and server responded with an error status code
        return response;
      } else {
        // Request failed due to timeout, network issue, etc.
        throw {e.message}; // Throw the error message
      }
    } catch (e) {
      // Handle other types of errors
      rethrow; // Throw the error
    }


  }
}

