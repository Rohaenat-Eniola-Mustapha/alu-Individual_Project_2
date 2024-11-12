import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/home_screen.dart';
import 'details_screen.dart';
import 'forecast_screen.dart';
import 'weather_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => WeatherProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => const DetailsScreen(),
        '/forecast': (context) => const ForecastScreen(),
      },
    );
  }
}
