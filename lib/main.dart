import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/bloc/weather_bloc.dart';
import 'package:weather/model/weather_model/weather_model.dart';
import 'package:weather/service/api_service.dart';
import 'package:weather/views/home_list.dart';
import 'package:weather/views/splash/splash_screen.dart';
import 'package:weather/views/weather_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen()

    );
  }
}
