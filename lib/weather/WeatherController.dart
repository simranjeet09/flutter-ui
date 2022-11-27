import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../network/ApiAdapter.dart';
import 'WeatherResponse.dart';

class WeatherController extends GetxController{
  Rx<WeatherResponse?>data = WeatherResponse().obs;
  RxBool isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchWeather();
    super.onInit();
  }

  void fetchWeather() async {
    isLoading(true);
    http.Response res = await ApiProvider().makeHttpGetRequest(
        "https://api.openweathermap.org/data/2.5/weather?lat=44.410469&lon=-79.669321&appid=5a8d943f54b84c4ea5d47800828f2814&units=metric");
        print(jsonEncode(res.body));
        WeatherResponse response = WeatherResponse.fromJson(jsonDecode(res.body));
        data(response);
    isLoading(false);



  }




}