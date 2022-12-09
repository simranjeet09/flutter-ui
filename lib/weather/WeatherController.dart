import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../network/ApiAdapter.dart';
import 'WeatherResponse.dart';

class WeatherController extends GetxController{
  //reactive object to hold weather data
  Rx<WeatherResponse?>data = WeatherResponse().obs;
  //reactive object to hold loading state
  RxBool isLoading=false.obs;
  @override
  void onInit() {
    //call api when screen is initialized
    fetchWeather();
    super.onInit();
  }

  Future<void> fetchWeather() async {
    isLoading(true);
    //make an http api call to get data in the form of JSON
    http.Response res = await ApiProvider().makeHttpGetRequest(
        "https://api.openweathermap.org/data/2.5/weather?lat=44.410469&lon=-79.669321&appid=5a8d943f54b84c4ea5d47800828f2814&units=metric");
        print(jsonEncode(res.body));
        //Pars json response
        WeatherResponse response = WeatherResponse.fromJson(jsonDecode(res.body));
        //set data to variable.
        data(response);
    isLoading(false);



  }




}