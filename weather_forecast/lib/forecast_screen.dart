import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_provider.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('5-Day Forecast')),
      body: weatherProvider.forecast != null
          ? ListView.builder(
              itemCount: weatherProvider.forecast!.length,
              itemBuilder: (context, index) {
                final dayForecast = weatherProvider.forecast![index];
                return ListTile(
                  title: Text('${dayForecast['dt_txt']}'),
                  subtitle: Text('Temp: ${dayForecast['main']['temp']}°C'),
                );
              },
            )
          : const Center(child: Text('No forecast data available')),
    );
  }
}
