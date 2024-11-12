import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter city name'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await weatherProvider.getCurrentWeather(_controller.text);
            },
            child: const Text('Get Weather'),
          ),
          weatherProvider.currentWeather != null
              ? Expanded(
                  child: Column(
                    children: [
                      Text('City: ${weatherProvider.currentWeather!['name']}'),
                      Text('Temperature: ${weatherProvider.currentWeather!['main']['temp']}°C'),
                      Text('Weather: ${weatherProvider.currentWeather!['weather'][0]['description']}'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/details');
                        },
                        child: const Text('See Details'),
                      ),
                    ],
                  ),
                )
              : const Center(child: Text('Enter a city to get weather')),
        ],
      ),
    );
  }
}
