import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

double longitude;
double latitude;
const apiKey = "d6ce33529d74483874716876697a2bc6";
const openWeatherURL = "https://api.openweathermap.org/data/2.5/weather?";

class WeatherModel {

  Future<dynamic> getLocationWeather() async{


    Location location = Location();

    await location.getCurrentPosition();

    latitude = location.latitude;
    longitude = location.longitude;

    var sourceUrl = "${openWeatherURL}lat=$latitude&lon=$longitude&APPID=$apiKey";
    NetworkHelper nets = NetworkHelper(sourceUrl);

    var weatherData = await nets.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
