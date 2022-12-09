import 'package:flutter/material.dart';
import 'package:flutter_assignment/dashboard.dart';
import 'package:flutter_assignment/todo/AddTodo.dart';
import 'package:flutter_assignment/todo/todo_edit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'todo/todo_list.dart';
import 'weather/weather_screen.dart';
import 'welcome/onboarding.dart';

main() async {
  //initialize Getstorage to save tasks
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // return GetMaterialApp to use GetX
    return GetMaterialApp(
        title: 'Flutter Assignment',
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //set routes to use named navigation
        routes: {
          '/': (BuildContext context) {
            return const OnBoarding();
          },
          '/dashboard': (BuildContext context) {
            return const Dashboard();
          },
          '/weather': (BuildContext context) {
            return WeatherScreen();
          },
          '/todo': (BuildContext context) {
            return TodoList();
          },
          '/addTodo': (BuildContext context) {
            return AddTodo();
          },
          '/editTodo': (BuildContext context) {
            return TodoEdit();
          },
        });
  }
}
