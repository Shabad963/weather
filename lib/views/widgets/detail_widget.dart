
import 'package:flutter/material.dart';
import 'package:weather/model/weather_model/weather_model.dart';
import 'package:weather/views/constants.dart';

class WeatherDetailWidget extends StatelessWidget {
  const WeatherDetailWidget({
    super.key,
    required this.weather,
    required this.weatherDetail,
  });

  final WeatherModel weather;
  final ListDatas weatherDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        sbHeight30,
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back)),
              Row(
                children: [
                  Text("C° "),
                  Text(" F°"),
                ],
              )
            ]),
        Divider(),
        sbHeight30,
        Text(weather.city!.name!),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${weather.list![0].main!.temp!.floor()}",
                    style: blackTxt150),
                Icon(Icons.light_mode_outlined)
              ],
            ),
            Column(
              children: [
                Text("sunny"),
                SizedBox(height: 70),
                Text("feels like 16")
              ],
            )
          ],
        ),
        Divider(),
        Row(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_upward),
                Text("24°"),
              ],
            ),
            sbWidth40,
            Row(
              children: [
                Icon(Icons.arrow_downward),
                Text("11°"),
              ],
            )
          ],
        ),
        sbHeight30,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text("humidity"), sbWidth40, Text("${weatherDetail.main!.humidity}%")],
                ),
                sbHeight30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text("uv index"), sbWidth30, Text("2")],
                ),
              ],
            ),
            sbWidth40,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text("wind"), sbWidth30, Text("${weatherDetail.wind!.speed} m/s")],
                ),
                sbHeight30,
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("pressure"),
                    sbWidth30,
                    Text("764 mmHg")
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Flexible(
          child: SizedBox(
            height: 80,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                      child: Row(
                    children: [
                      Column(children: [Text("now"), Text("17°")]),
                      sbWidth40,
                    ],
                  ));
                }),
          ),
        )
      ],
    );
  }
}
