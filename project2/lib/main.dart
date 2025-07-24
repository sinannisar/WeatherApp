import 'package:flutter/material.dart';
import 'package:project2/weather_screen.dart';

void main (){
  runApp(const WeatherApp());
}



class WeatherApp extends StatelessWidget{
  const WeatherApp({super.key});



@override
Widget build(BuildContext context) {
  return  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(useMaterial3: true,),
  
    home: WeatherScreen(),
  
  );
}
}