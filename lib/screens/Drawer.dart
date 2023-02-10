import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property/screens/recentlyViewedList.dart';
import 'package:property/tool.dart';

Drawer appDrawer(context){
  return Drawer(
    width: MediaQuery.of(context).size.width*.7,
    backgroundColor: Colors.blueGrey[200],
    // width: MediaQuery.of(context).size.width/2,
    child: ListView(
      children: [
        DrawerHeader(
            child:Container(
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('lib/images/bgd.jpg'),
                  fit: BoxFit.cover
                )
              ),//
            )
        ),
        ListTile(
          title: texts(text: 'My Account',clr: Colors.blueGrey[800]),
          leading: Icon(Icons.person_sharp,size: 30,color: Colors.blueGrey[600],),
        ),
        ListTile(
          title: texts(text: 'Home',clr: Colors.blueGrey[800]),
          leading: Icon(Icons.home,size: 30,color: Colors.blueGrey[600],),
        ),

        ListTile(
          title: texts(text: 'Recently Viewed',clr: Colors.blueGrey[800]),
          leading: Icon(Icons.history,size: 30,color: Colors.blueGrey[600],),
          onTap:() {
              Get.to(() => recentViewed());
            }),
        ListTile(
          title: texts(text: 'Settings',clr: Colors.blueGrey[800]),
          leading: Icon(Icons.settings,size: 30,color: Colors.blueGrey[600],),
        ),
      ],
    ),
  );
}