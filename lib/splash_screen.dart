import 'package:flutter/material.dart';
import 'package:music_player/home.dart';


class Splash extends StatefulWidget {
  static String id = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState()
  {
    super.initState();
    _navigatetohome();
  }
_navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
           children:[
               Image.asset('assets/icon.jpg',
                 width:200,
                 height: 200,),
                 Text('Music Player',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,),
                ),
        ],
    ),
      ),
    );

  }
}
