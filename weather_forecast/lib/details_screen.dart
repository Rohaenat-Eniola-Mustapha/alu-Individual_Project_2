import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Weather Details')),
      body: weatherProvider.currentWeather != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City: ${weatherProvider.currentWeather!['name']}'),
                  Text('Temperature: ${weatherProvider.currentWeather!['main']['temp']}°C'),
                  Text('Humidity: ${weatherProvider.currentWeather!['main']['humidity']}%'),
                  Text('Wind Speed: ${weatherProvider.currentWeather!['wind']['speed']} m/s'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forecast');
                    },
                    child: const Text('See 5-Day Forecast'),
                  ),
                ],
              ),
            )
          : const Center(child: Text('No details available')),
    );
  }
}
