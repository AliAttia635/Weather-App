import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/search_view.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  // initial state when first loaded state
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;
  getWeather({required String Cityname}) async {
    try {
      log(Cityname);
      // dh el weather model elly feh kol el weather data w momken access l data 3n tarek el cubit dah
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: Cityname);
      emit(WeatherLoadedState(weatherModel!));
      log("inside try");
      log(Cityname);
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
