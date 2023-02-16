import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property/screens/profilePage.dart';
import 'package:property/tool.dart';
import 'Drawer.dart';
import 'PropertiesForSale.dart';
import 'RentProperties.dart';
import 'favorit List.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Color> activeColor = [Colors.black, Colors.white];
  List<Color> inactiveColor = [Colors.white, Colors.black];
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int currentIndex=0;

  Widget pageToDesplay = PropertiesForSale();

  bool buying = true;

  void changeType() {
    if (buying) {
      setState(() {
        buying = !buying;
        pageToDesplay = const PropertiesToRent();
      });
    } else {
      setState(() {
        buying = !buying;
        pageToDesplay = PropertiesForSale();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f5f9),
      key: _drawerKey,
      endDrawer: appDrawer(context),
      body: GestureDetector(
        onHorizontalDragEnd: ((details) => changeType()),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                Container(),
              ],
              // backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 2 - 50,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/images/bgd.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [Colors.transparent, Color(0xfff1f5f9)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                  ),
                   Positioned.fill(
                      child: Align(
                          alignment: Alignment.center,
                          child:arabtexts(text: 'أوجد بيت أحلامك',
                          size: 30,
                            fw: FontWeight.bold,
                            clr: Colors.white
                          ))
                    ),
                  Positioned.fill(
                    bottom: 75,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * .9,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(2, 2),
                                  color: Colors.black.withOpacity(.3),
                                  blurRadius: 2)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: buying
                                        ? activeColor[0]
                                        : inactiveColor[0],
                                    borderRadius: BorderRadius.circular(30)),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: arabtexts(
                                      text: 'شراء',
                                      size: 22,
                                      fw: FontWeight.bold,
                                      clr: buying
                                          ? activeColor[1]
                                          : inactiveColor[1]),
                                ),
                              ),
                              onTap: () => !buying ? changeType() : {},
                            ),
                            GestureDetector(
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: buying
                                        ? inactiveColor[0]
                                        : activeColor[0],
                                    borderRadius: BorderRadius.circular(30)),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child:arabtexts(
                                      text: 'كراء',
                                      size: 22,
                                      fw: FontWeight.bold,
                                      clr: buying
                                          ? inactiveColor[1]
                                          : activeColor[1]),
                                ),
                              ),
                              onTap: () => buying ? changeType() : {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            pageToDesplay
          ],
        ),
        // onHorizontalDragStart:((details) => buying?{}:changeType()),
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return SizedBox(
          height: 60,
          child:  BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: botmNavBar,
              backgroundColor: Colors.blueGrey[400],
              unselectedLabelStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontFamily: 'Almarai'
              ),
              selectedLabelStyle:  const TextStyle(
                color: Colors.red,
                  fontSize: 15,
                  fontFamily: 'Almarai'

              ),
              items: [
                BottomNavigationBarItem(
                  label: 'حسابي',
                  icon: Icon(
                    Icons.person,
                    // size: 30,
                    color: Colors.grey[800],
                  ),
                ),
                BottomNavigationBarItem(
                    label: 'المفضلات',
                    icon: Icon(
                      Icons.favorite,
                      // size: 30,
                      color: Colors.grey[800],
                    )),
                BottomNavigationBarItem(
                    label: 'التبويب',
                    icon: Icon(Icons.menu,
                        // size: 30,
                        color: Colors.grey[800]))
              ],
            ),
        );
      }),
    );
  }

  botmNavBar(index) {

    switch (index) {
      case 0:
        {
          Get.to(() => const Profile());
        }
        break;
      case 1:
        {
          Get.to(() => const favorit_List());
        }
        break;
      case 2:
        {
          _drawerKey.currentState?.openEndDrawer();
        }
        break;
    }
    setState(() {
      currentIndex=index;
    });
  }
}
