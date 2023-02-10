import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'test.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  Color activeElement=Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/images/bgd.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent,Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
    )
                    ),
                  ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2,
                  color: Colors.white,
                  child: ListView.builder(itemBuilder: (BuildContext context,int index){
                    return Container(
                      height: 50,width: 200,
                      color: Colors.blue,margin: EdgeInsets.all(10),);
                  }
                  )
                )
              ],
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height/2-100,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width:MediaQuery.of(context).size.width*.8,
                  height: 50,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    GestureDetector(
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text('Buy',style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),),
                        ),
                      ),
                      onTap: ()=>Get.to(()=>Test()),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text('Rent',style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)
                      ),
                    )
                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
