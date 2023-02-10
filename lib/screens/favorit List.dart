import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property/screens/PropertyDetailles.dart';
import 'package:property/tool.dart';

import '../Models/PropertyForSale.dart';
import 'PropertiesForSale.dart';
import 'favoriteItemTile.dart';

class favorit_List extends StatefulWidget {
  const favorit_List({Key? key}) : super(key: key);

  @override
  State<favorit_List> createState() => _favorit_ListState();
}

class _favorit_ListState extends State<favorit_List> {
  List<SellingProperties> forSale = [
    SellingProperties(
        260,
        [
          'lib/images/beige.jpg',
          'lib/images/green.jpg',
        ],
        'Nouvelle Ville',
        'Hammou',
        150,
        2,
        5),
    SellingProperties(485, ['lib/images/red.jpg', 'lib/images/green.jpg'],
        'Kerkoura', 'Younes', 180, 1, 3),
    SellingProperties(2500, ['lib/images/green.jpg', 'lib/images/green.jpg'],
        'El Khroub', 'Omar', 286, 3, 6),
    SellingProperties(632, ['lib/images/yellow.jpg', 'lib/images/green.jpg'],
        'Touzouz', 'Moussa', 50, 4, 2)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: texts(text: 'Favorites List', clr: Colors.white, size: 25),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = forSale[index];
            return Center(
              child: GestureDetector(
                child: Dismissible(
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.endToStart) {
                      return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.blueGrey,
                              title: texts(
                                  text: 'Delete From Favorites?',
                                  clr: Colors.white),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      favorites.removeAt(index);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child:
                                      texts(text: 'Confirm', clr: Colors.white),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: texts(text: 'Cancel', clr: Colors.white),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  /*
                  return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog(


                  );*/
                  /* onDismissed: (direction) {
                        print('dleted ${forSale[index].district}');
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(

                              });
                      },*/
                  background: Container(
                  ),
                  secondaryBackground: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () => {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      texts(text: 'Remove from Favorites', clr: Colors.blueGrey[600])
                    ],
                  ),
                  key: ObjectKey(item),
                  child: favoriteTile(
                      favorites[index].Images,
                      favorites[index].district,
                      favorites[index].surface,
                      favorites[index].Price),
                ),
                onTap: ()=>Get.to(()=>PropertyDetailles(item)),
              ),
            );
          }, childCount: favorites.length),
        ),
      ]),
    );
  }
}
