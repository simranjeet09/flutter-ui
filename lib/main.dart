import 'package:flutter/material.dart';
import 'package:flutter_assignment/weather/WeatherController.dart';
import 'package:flutter_assignment/dashboard.dart';
import 'package:flutter_assignment/news/news_res.dart';
import 'package:flutter_assignment/notes/AddNote.dart';
import 'package:flutter_assignment/todo/Todo.dart';
import 'package:flutter_assignment/todo/AddTodo.dart';
import 'package:flutter_assignment/tools/CalWidget.dart';
import 'package:flutter_assignment/tools/news_details.dart';
import 'package:flutter_assignment/welcome/welcome.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Home.dart';
import 'news/NewsScreen.dart';
import 'notes/EditNote.dart';
import 'notes/NotesList.dart';
import 'todo/todo_list.dart';
import 'weather/weather_screen.dart';
import 'welcome/welcome_one.dart';

 main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext context) {
            return Home();
          },
          '/dashboard': (BuildContext context) {
            return Dashboard();
          },
          '/news': (BuildContext context) {
            return NewsScreen();
          },
          '/newsDetails': (BuildContext context) {
            return NewsDetails();
          },
          '/weather': (BuildContext context) {
            return WeatherScreen();
          },
          '/cal': (BuildContext context) {
            return CalWidget();
          },
          '/todo': (BuildContext context) {
            return TodoList();
          },'/addTodo': (BuildContext context) {
            return AddTodo();
          },'/notesList': (BuildContext context) {
            return NotesList();
          },'/addNote': (BuildContext context) {
            return AddNote();
          },'/editNotes': (BuildContext context) {
            return EditNote();
          },'/welcome': (BuildContext context) {
            return Welcome();
          },'/welcome_one': (BuildContext context) {
            return WelcomeOne();
          },
        });
  }
}
