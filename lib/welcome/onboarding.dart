import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /*<a href="https://www.freepik.com/free-vector/people-hugging-each-other-with-welcoming-greeting_5481499.htm#query=welcome&position=32&from_view=search&track=sph">Image by pikisuperstar</a> on Freepik*/
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/welcome_one.jpg"),
              SizedBox(height: 18,),
              const Text("Welcome to the flutter assignment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,),)
            ],
          )),
          SizedBox(height: 30,),
          Positioned(
              left: 1,
              right: 1,
              bottom: 1,
              child: Container(
                  margin: EdgeInsets.only(bottom: 100),
                  child: FloatingActionButton(
                    backgroundColor: PRIMARY_COLOR,
                    onPressed: (){

                    Get.toNamed("/dashboard");

                  }, child: Icon(Icons.navigate_next),)))


        ],

      ),

    );
  }
}
