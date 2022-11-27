import 'package:flutter/material.dart';
import 'package:flutter_assignment/weather/WeatherController.dart';
import 'package:get/get.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);
  final controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Location Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      Obx(() => Text(controller.data.value?.name ?? "N/A",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Weather",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      Obx(() => Text(
                          controller.data.value?.weather!.first.description ??
                              "N/A",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Temperature (Celsius)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      Obx(() => Text(
                          controller.data.value?.main?.temp.toString() ?? "N/A",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Feels Like (Celsius)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      Obx(() => Text(
                          controller.data.value?.main?.feelsLike.toString() ??
                              "N/A",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Max Temperature (Celsius)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      Obx(() => Text(
                          controller.data.value?.main?.tempMax.toString() ??
                              "N/A",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Min Temperature (Celsius)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      Obx(() => Text(
                          controller.data.value?.main?.tempMin.toString() ??
                              "N/A",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Humidity",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      Obx(() => Text(
                          controller.data.value?.main?.humidity.toString() ??
                              "N/A",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pressure",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      Obx(() => Text(
                          controller.data.value?.main?.pressure.toString() ??
                              "N/A",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w800))),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(onPressed: (){

                    controller.fetchWeather();


                  }, child: Text("Refresh", style: TextStyle(decoration: TextDecoration.underline),))

                ],
              ),
            ),



      ),
    );
  }
}
