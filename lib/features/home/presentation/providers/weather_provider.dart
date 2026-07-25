import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class WeatherData {
  final double temperature;
  final String description;

  WeatherData({required this.temperature, required this.description});
}

final weatherProvider = FutureProvider<WeatherData?>((ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return null;
  } 

  final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.low));

  final dio = Dio();
  try {
    final response = await dio.get(
        'https://api.open-meteo.com/v1/forecast?latitude=${position.latitude}&longitude=${position.longitude}&current_weather=true');
    
    if (response.statusCode == 200) {
      final current = response.data['current_weather'];
      final temp = (current['temperature'] as num).toDouble();
      final code = current['weathercode'] as int;
      final desc = _getWeatherDescription(code);
      return WeatherData(temperature: temp, description: desc);
    }
  } catch (e) {
    return null;
  }
  return null;
});

String _getWeatherDescription(int code) {
  if (code == 0) return 'Clear sky';
  if (code == 1) return 'Mainly clear';
  if (code == 2) return 'Partly cloudy';
  if (code == 3) return 'Overcast';
  if (code >= 45 && code <= 48) return 'Fog';
  if (code >= 51 && code <= 57) return 'Drizzle';
  if (code >= 61 && code <= 67) return 'Rain';
  if (code >= 71 && code <= 77) return 'Snow';
  if (code >= 80 && code <= 82) return 'Rain showers';
  if (code >= 95) return 'Thunderstorm';
  return 'Good farming day';
}
