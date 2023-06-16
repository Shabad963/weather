
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/bloc/weather_event.dart';
import 'package:weather/config/bloc/weather_state.dart';
import 'package:weather/service/api_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiService weatherRepo;
  final String city;

  WeatherBloc(this.weatherRepo, this.city) : super(WeatherLoadingState()) {
    on<LoadWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final users = await weatherRepo.getWeather(place: city);
        emit(WeatherLoadedState(users!));
      } catch (e) {
        emit(WeatherErrorState(e.toString()));
      }
    });
  }
}