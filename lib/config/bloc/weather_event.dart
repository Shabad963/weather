import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class LoadWeatherEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}
