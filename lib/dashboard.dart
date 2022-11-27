import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height:MediaQuery.of(context).size.height / 3,
                child: InkWell(
                  onTap: (){
                    Get.toNamed("/weather");

                  },
                  child: Card(
                    elevation: 20,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.newspaper, color: Colors.blue,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Weather", style: TextStyle(fontSize: 16, color: Colors.blue),),
                        )],

                    ),



                  ),
                ),
              ),
              SizedBox(
                width:  double.infinity,
                height:MediaQuery.of(context).size.height / 3,
                child:  InkWell(
                  onTap: (){
                    Get.toNamed("/todo");
                  },
                  child: Card(
                    elevation: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.today_outlined, color: Colors.blue),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Todo", style: TextStyle(fontSize: 16, color: Colors.blue),),
                        )],

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
