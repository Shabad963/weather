import 'package:flutter/material.dart';
import 'package:weather/views/constants.dart';
import 'package:weather/views/weather_details.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  List<String> city = ["prague","riga", "miami","new york", "london", "sydney"];
    List<String> country = ["czech republic","latvia", "ft usa","ny, usa", "uk", "australia"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: AnimatedBuilder(
          animation: _animationController!,
          builder: (BuildContext context, Widget? child) {
            return FractionalTranslation(
              translation: _animation!.value,
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    sbHeight30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Today",style: blackTxt50), Icon(Icons.add)],
                    ),
                    Divider(),
                    sbHeight30,
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        WeatherDetails(city: city[index],)));
                              },
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(country[index]),
                                        Text(city[index],style : blackTxt25)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("9:13 am"),
                                        Row(
                                          children: [
                                            Text("17°"),
                                            Icon(Icons.light_mode_outlined)
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: 6),
                    )
                  ],
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}
