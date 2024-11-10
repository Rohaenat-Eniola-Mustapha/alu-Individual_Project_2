import 'package:flutter/material.dart';
import 'weather_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? _weatherData;

  // Fetch weather for the user's current location
  void _fetchWeather() async {
    try {
      var data = await WeatherService().getCurrentWeatherByLocation();
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      print("Error: $e");
      // Handle error (e.g., show a snackbar or error message)
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();  // Fetch weather for current location when the app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Forecast')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Get Current Weather'),
            ),
            _weatherData == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Text(
                        '${_weatherData!['main']['temp']}°C',
                        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _weatherData!['weather'][0]['description'],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
