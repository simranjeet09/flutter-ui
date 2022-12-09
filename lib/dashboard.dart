import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed("/weather");
                },
                child: Card(
                  elevation: 20,
                  child: Stack(
                    children: [
                      /*<a href="https://www.freepik.com/free-vector/flat-style-clouds-blue-shades-background_6864897.htm#query=weather&position=39&from_view=search&track=sph">Image by starline</a> on Freepik
                      * */

                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset("assets/weather.jpg",
                              fit: BoxFit.fill)),
                      const Positioned(
                        bottom: 1,
                        left: 1,
                        right: 1,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Today's weather",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                child: InkWell(
                  onTap: () {
                    Get.toNamed("/todo");
                  },
                  child: Card(
                    elevation: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/todo.jpg",
                            height: MediaQuery.of(context).size.height / 4,
                            fit: BoxFit.fitWidth),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "TODO",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
