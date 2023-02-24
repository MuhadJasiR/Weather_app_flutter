import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../models/api_key.dart';
import '../../models/weather.dart';
import 'package:http/http.dart' as http;

Future getWeather(contry, context) async {
  String? contr = contry;
  Weather? weather;
  try {
    var urlID =
        "http://api.weatherapi.com/v1/current.json?$APIkey=$contr&aqi=no";
    final resp = await http.get(Uri.parse(urlID));

    if (resp.statusCode == 200) {
      weather = Weather.fromJosn(jsonDecode(resp.body));
    } else {
      var snackBar = const SnackBar(
        content: Text('Please enter valide entry'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return weather;
  } catch (e) {
    var snackBar = const SnackBar(
      content: Text('Please check your data'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    log("$e");
  }
}
