import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather/views/constants.dart';
import 'package:weather/views/home_list.dart';


class SplashScreen extends StatefulWidget {


 const SplashScreen({super.key,});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
   AnimationController? _animationController;
  Animation<Offset>? _animation;
 
  @override
  void initState() {
    
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
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
              HomeList())));
  }

  
  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: AnimatedBuilder(
          animation: _animationController!,
          builder: (BuildContext context, Widget? child) {
            return FractionalTranslation(
              translation: _animation!.value,
              child: Center(
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("What is the weather like Today",style: blackTxt50),
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
