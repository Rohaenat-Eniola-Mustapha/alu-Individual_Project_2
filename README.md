# Weather Forecast App 🌤️

A simple Flutter application that provides current weather data and a 5-day forecast using the OpenWeatherMap API. This project shoes how  I implemented HTTP requests and handled responses from RESTful APIs, implement navigation, and managed app state.

## Features

- **Home Screen**: Search for a city and view the current weather.
- **Details Screen**: View more detailed information like temperature, humidity, and wind speed.
- **Forecast Screen**: Check the 5-day forecast for the selected city.

## Screenshots
<!-- Add screenshots of your app here -->

## Getting Started

### Prerequisites

- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **OpenWeatherMap API Key**: Sign up at [OpenWeatherMap](https://openweathermap.org/) and get a free API key.

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/weather_app.git
   cd weather_app
   ```

2. Installing Dependencies

    In creating the flutter application, I used over 4 dependencies. And they are:

    - **http**: Used it to make http requests. [http package](https://pub.dev/packages/http)
    - **provider**: Used it for state management. [provider package](https://pub.dev/packages/provider)
    - **flutter_bloc**: Used it to implement the BLoC (Business Logic Component) design pattern. [bloc package](https://pub.dev/packages/flutter_bloc)
    - **geolocator**: Because I was creating a weather forecast app, I needed it for easy access to platform specific location services. I also noticed it had these features:
        - Gets the last known location
        - Gets the current location of the device
        - Gets continuous location updates

    So make sure to run:

    ```bash
    flutter pub get
    ```

3. Run the App

```bash
flutter run
```

### API Usage

The flutter app interacts with the **OpenWeatherMap API** to fetch weather data. Here are the endpoints used:

- **Current Weather:** Retrieves current weather data for a specific city.

```bash
https://api.openweathermap.org/data/2.5/weather?q={city_name}&appid={API_KEY}&units=metric
```

- **5-Day Forecast:** Provides a 5-day weather forecast for a specific city.

```bash
https://api.openweathermap.org/data/2.5/forecast?q={city_name}&appid={API_KEY}&units=metric
```

### State Management

The app uses the Provider package to manage state. The `WeatherProvider` class handles the current weather and forecast data, making it accessible across different screens.

### Challenges and Solutions

- **Error Handling:** Implemented error handling to manage API request failures and invalid city names.
- **Navigation:** Used Flutter’s `Navigator` for seamless navigation between screens.
- State Management: Managed app state effectively using `Provider`, ensuring a responsive and efficient UI.

### Future Improvement

- **User Location**: Use geolocation to display weather data for the user’s current location.
- **Favorites**: Allow users to save favorite cities for easy access.
- **UI Enhancements**: Improve the UI design for a more visually appealing experience.

