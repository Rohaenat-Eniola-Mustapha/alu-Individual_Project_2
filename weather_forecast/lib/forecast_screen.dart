import 'package:flutter/material.dart';
import 'weather_service.dart';

class ForecastScreen extends StatefulWidget {
  final String city;
  const ForecastScreen({super.key, required this.city});

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  Map<String, dynamic>? _forecastData;

  void _fetchForecast() async {
    try {
      var data = await WeatherService().getForecast(widget.city);
      setState(() {
        _forecastData = data;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('7-Day Forecast')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _forecastData == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _forecastData!['list'].length,
                itemBuilder: (context, index) {
                  var day = _forecastData!['list'][index];
                  return ListTile(
                    title: Text('${day['main']['temp']}°C'),
                    subtitle: Text(day['weather'][0]['description']),
                  );
                },
              ),
      ),
    );
  }
}
