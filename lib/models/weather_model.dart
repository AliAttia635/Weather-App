class WeatherModel {
  final String cityName;
  final DateTime timeUpdate;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStatus;

  WeatherModel(
      {required this.cityName,
      required this.timeUpdate,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatus});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      timeUpdate: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]?['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]?['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]?['day']['mintemp_c'],
      weatherStatus: json['forecast']['forecastday'][0]?['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]?['day']['condition']['icon'],
    );
  }
}
