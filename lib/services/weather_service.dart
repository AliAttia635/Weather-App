import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  String baseURL = 'http://api.weatherapi.com/v1';
  String apiKey = '30a6206e387843379d9190150241205';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=7');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel; // Return the parsed WeatherModel
    } on DioException catch (e) {
      final String errorMsg = e.response?.data['error']['message'] ??
          'oops there was an error message';
      throw Exception(errorMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , try later');
    }
  }
}
