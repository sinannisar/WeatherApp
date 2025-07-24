import 'package:flutter/material.dart';


class HourlyForecastItem extends StatelessWidget {
final String time;
final IconData icon;
final String  temperature;


   HourlyForecastItem({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
    });

  @override
  Widget build(BuildContext context) {
    return Card(
              
                      elevation: 6,
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                time,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                            
                           )),
                             SizedBox(height: 8),
                          
                            Icon(
                              icon
                            ),
                             SizedBox(height: 8),
                          
                            //temp
                            Text(
                              temperature
                            ),
                            
                          
                          
                            ],
                          ),
                        ),
                      ),
                    );
              
  }
}