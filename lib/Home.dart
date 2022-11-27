import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Homescreen"),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Row(
            children: [  Container(
              width:  MediaQuery.of(context).size.width / 2,
              height:MediaQuery.of(context).size.width / 2,
              child: InkWell(
                onTap: (){
                  Get.toNamed("/news");
                  
                },
                child: Card(
                  elevation: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Icon(Icons.newspaper, color: Colors.blue,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("News", style: TextStyle(fontSize: 16, color: Colors.blue),),
                    )],
                    
                  ),
                  


                ),
              ),
            ),
              SizedBox(
                width:  MediaQuery.of(context).size.width / 2,
                height:MediaQuery.of(context).size.width / 2,
                child:  InkWell(
                  onTap: (){
                    Get.toNamed("/notesList");


                  },
                  child: Card(
                    elevation: 20,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.notes, color: Colors.blue),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Notes", style: TextStyle(fontSize: 16, color: Colors.blue),),
                        )],

                    ),



                  ),
                ),
              )],

          ),


          ],

        ),

      ),

    );
  }
}
