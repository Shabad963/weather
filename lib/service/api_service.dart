import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/config/core/api_endpoints.dart';
import 'package:weather/model/weather_model/weather_model.dart';

class ApiService {
  Future<WeatherModel?> getWeather({required String place}) async {
    final Response response;
    response =
        await Dio().get(ApiEndpoints.weatherUrl, queryParameters: {'q': place});
    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = WeatherModel.fromJson(response.data);
      log(result.toString());
      print(response.data);
    } else {
      log(response.data);
    }
    return WeatherModel.fromJson(response.data);
  }
}
