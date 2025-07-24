import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project2/additional_info_item.dart';
import 'package:project2/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:project2/secrets.dart';

class WeatherScreen extends StatefulWidget{
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
   double temp = 0;

@override
void initState(){
  super.initState();
  getCurrentWeather();
}

  Future getCurrentWeather() async {

    try {

      

      String cityName = 'London';
    final res = await 
    http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'
        )
      );

     
      

      final data = jsonDecode(res.body);

      if (data['cod'] != '200'){
        throw 'An unexpected error occured';
      }

       setState(() {
          temp = data['list'][0]['main']['temp']; 
      });


      
      
    } catch (e) {
      throw e.toString();
    }
    
   
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          'WeatherApp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        
        ),


        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body: temp == 0 ? 
      Center(child: const CircularProgressIndicator.adaptive()):
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            // main card
        
           SizedBox(
            width: double.infinity,
             child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child:  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          '$temp K',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                         
                        ),),
                        const SizedBox(height: 16),
                      Icon(Icons.cloud,
                      size: 64 ),
                     const  SizedBox(height: 16),
                    
                     const  Text('Rain',
                      style: TextStyle(fontSize: 20 ),)
                      ],
                    ),
                  ),
                ),
              ),
             ),

            

           ),
        
            const SizedBox(height: 20,),
 
              const Text('Weather Forecast',
            style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ) ,
            ),
        
            const SizedBox(height: 10),
            //weather forecast cards

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                   HourlyForecastItem(
                    time: '04.00',
                    icon: Icons.cloud,
                    temperature: '301.22 K',
                   ),
                    HourlyForecastItem(
                    time: '07.00',
                    icon: Icons.sunny,
                    temperature: '300.52 K',
                    ),
                     HourlyForecastItem(
                    time: '10.00',
                    icon: Icons.cloud,
                    temperature: '330 K',
                     ),
                      HourlyForecastItem(
                    time: '13.00',
                    icon: Icons.sunny,
                    temperature: '310 K',
                      ),
                       HourlyForecastItem(
                    time: '16.00',
                    icon: Icons.cloud,
                    temperature: '330 K',
                       ),
                    
                  
                ],
                
              
              ),
            ),

            const SizedBox(height: 20,),
        
           
            // additional information
            
        
            const SizedBox(height: 15),
            // additional information

              Text('Additional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),

                   const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: [
                  const AdditionalInfoItem(
                    icon: Icons.water_drop,
                    label: 'Humidity' ,
                    value: '91',
                  ),
                  const AdditionalInfoItem(
                      icon: Icons.air,
                      label: 'Wind Speed',
                      value: '7.5',
                  ),
                  const AdditionalInfoItem(
                    icon: Icons.beach_access,
                    label: 'Pressure',
                    value: '1000',

                  ),

                 
                  
                ],
              )
          ],
        ),
      ),

    );

    
  }
}


