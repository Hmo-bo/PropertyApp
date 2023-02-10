import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property/screens/recentlyViewedList.dart';
import 'package:property/tool.dart';

import 'MyProperties.dart';
import 'addProperty.dart';
import 'favorit List.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: texts(text: 'My Profile', clr: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: SizedBox(),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // margin:
                            // const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/images/bgd.jpg'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(height: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          texts(text: '@User_Name'),
                          texts(text: 'Email.address@gmail.com')
                        ],
                      )
                    ],
                  ),
                  Expanded(child: SizedBox(),),

                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width * .85,
                    child: Column(
                      children: [
                              ListTile(
                                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                  title: texts(text: 'Recently Viewed'),
                                  leading: const Icon(Icons.history,size: 30,),
                                  onTap: () {
                                    Get.to(() => const recentViewed());
                                  }),
                              const Divider(
                                thickness: 2,
                                color: Colors.white,
                                height: 2,
                              ),
                              ListTile(
                                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                title: texts(text: 'My Properties'),
                                leading: const Icon(MdiIcons.homeCityOutline,size: 30,),
                                onTap: ()=>Get.to(()=>MyProperties())
                              ),
                              const Divider(
                                thickness: 2,
                                color: Colors.white,
                                height: 2,
                              ),
                              ListTile(
                                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                  title: texts(text: 'Add Property'),
                                  leading: const Icon(MdiIcons.homePlusOutline,size: 30,),
                                  onTap: ()=>Get.to(()=>addProperty())
                              ),
                              const Divider(
                                thickness: 2,
                                color: Colors.white,
                                height: 2,
                              ),
                              ListTile(
                                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                title: texts(text: 'My Favorites'),
                                leading: const Icon(Icons.favorite,size: 30,),
                                  onTap:()=> Get.to(()=>const favorit_List())
                              ),
                              const Divider(
                                thickness: 2,
                                color: Colors.white,
                                height: 2,
                              ),
                              ListTile(
                                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                                title: texts(text: 'Settings'),
                                leading: const Icon(Icons.settings,size: 30,),
                              ),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox(),),
                  Expanded(child: SizedBox(),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
