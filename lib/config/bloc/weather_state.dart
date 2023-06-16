import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather_model/weather_model.dart';

@immutable
abstract class WeatherState extends Equatable {}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weather;
  WeatherLoadedState(this.weather);
  @override
  List<Object?> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  final String error;
  WeatherErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
