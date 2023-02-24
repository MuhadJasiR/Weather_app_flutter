import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weather.dart';

import 'widget/search.dart';

final ValueNotifier<Weather?> weatherData = ValueNotifier(null);

// ignore: must_be_immutable
class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  TextEditingController controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SearchBar(controllers: controllers),
            Lottie.asset('assets/77045-good-weather.json'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ValueListenableBuilder(
                valueListenable: weatherData,
                builder: (context, weathers, _) {
                  if (weathers != null) {
                    return weather(weathers);
                  } else {
                    return const Text(
                      'Enter a location',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//////////////////////////////////////weaether display widget//////////////////////////////////////////////
  Widget weather(Weather weather) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            "${weather.feel}🌡C",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 50,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            "${weather.name}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            "${weather.cloud}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            """Low:${weather.high}🌡C \n High:${weather.low}🌡C""",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
