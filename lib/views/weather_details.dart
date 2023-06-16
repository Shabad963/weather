import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/bloc/weather_bloc.dart';
import 'package:weather/config/bloc/weather_event.dart';
import 'package:weather/config/bloc/weather_state.dart';
import 'package:weather/model/weather_model/weather_model.dart';
import 'package:weather/service/api_service.dart';
import 'package:weather/views/constants.dart';
import 'package:weather/views/widgets/detail_widget.dart';

class WeatherDetails extends StatelessWidget {
  final String city;
  WeatherDetails({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          WeatherBloc(ApiService(), city)..add(LoadWeatherEvent()),
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WeatherErrorState) {
          return const Center(child: Text("Error"));
        }
        if (state is WeatherLoadedState) {
          var weather = state.weather;
          final weatherDetail = weather.list![0];
          final String climateDescription =
              weatherDetail.weather![0].description.toString();
          final String climate = weatherDetail.weather![0].main.toString();
          return Container(
                   decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange,
        whiteColor,
         whiteColor,
          whiteColor,
           whiteColor,

      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: WeatherDetailWidget(weather: weather, weatherDetail: weatherDetail),
          ));
        }
        return Container();
      }),
    ));
  }
}
