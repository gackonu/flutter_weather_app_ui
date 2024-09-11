import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_default/additional_info_item.dart';
import 'package:flutter_default/hourly_forcast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final dio = Dio();
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    final res = await http.get(Uri.parse('https://google.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              getCurrentWeather();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '23 Degrees',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 70,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Weather Forcast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForcastItem(time: '3:00', temprature: '20', icon: Icons.cloud,),
                  HourlyForcastItem(time: '6:00', temprature: '18', icon: Icons.sunny,),
                  HourlyForcastItem(time: '9:00', temprature: '17', icon: Icons.cloud,),
                  HourlyForcastItem(time: '12:00', temprature: '22', icon: Icons.sunny,),
                  HourlyForcastItem(time: '15:00', temprature: '19', icon: Icons.sunny,),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Additional Information',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(icon: Icons.water_drop, label: 'Humidity', value: '94',),
                AdditionalInfoItem(icon: Icons.air, label: 'Wind Speed', value: '7.5',),
                AdditionalInfoItem(icon: Icons.beach_access, label: 'Pressure', value: '1000',),
              ],
            )
          ],
        ),
      ),
    );
  }
}

