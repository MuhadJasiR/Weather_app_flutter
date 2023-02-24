import 'package:flutter/material.dart';
import 'package:weather/screen/weather_screen.dart';
import 'package:weather/screen/widget/weather_get.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controllers,
  }) : super(key: key);

  final TextEditingController controllers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: const Color.fromARGB(163, 205, 204, 204),
        child: Container(
          padding: const EdgeInsets.only(left: 12),
          child: TextFormField(
            controller: controllers,
            decoration: const InputDecoration(
              hintText: "Location",
              border: InputBorder.none,
              fillColor: Colors.white,
            ),
            onEditingComplete: () async {
              var weatherTemp = await getWeather(controllers.text, context);
              if (weatherTemp != null) {
                weatherData.value = weatherTemp;
              }
            },
          ),
        ),
      ),
    );
  }
}
