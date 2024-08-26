import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(
                          context)
                      .weatherModel
                      ?.weatherStatus), // This will set the color for the entire app
                ),
                // Set your default color here
                // primaryColor: Colors.red,
                // scaffoldBackgroundColor: getThemeColor(
                //     BlocProvider.of<GetWeatherCubit>(context)
                //         .weatherModel
                //         ?.weatherStatus),
                // appBarTheme: AppBarTheme(
                //   backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(
                //           context)
                //       .weatherModel
                //       ?.weatherStatus), // Applies to the AppBar background color
                // ),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.yellow;
  } else if (condition == 'Sunny') {
    return Colors.orange;
  } else if (condition == "cloudy") {
    return Colors.grey;
  } else {
    return Colors.green;
  }
}
