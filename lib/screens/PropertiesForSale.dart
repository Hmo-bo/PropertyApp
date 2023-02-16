import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/PropertyForSale.dart';
import 'PropertyDetailles.dart';
import 'PropertyTile.dart';

class PropertiesForSale extends StatefulWidget {
  @override
  State<PropertiesForSale> createState() => _PropertiesForSaleState();

  PropertiesForSale();
}

class _PropertiesForSaleState extends State<PropertiesForSale> {
  List<SellingProperties> forSale = [
    SellingProperties(
        260,
        [
          'lib/images/beige.jpg',
          'lib/images/green.jpg',
          'lib/images/bgd.jpg'
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
    return
     /* Container(
        height: MediaQuery.of(context).size.height,
        width: 200,
        color: Colors.blueGrey[600],
      ),*/
      SliverList(
          delegate: SliverChildBuilderDelegate(childCount: forSale.length,
              (context, index) {
        return GestureDetector(
          child: PropertyTile(forSale[index]),
          onTap: () {
            Get.to(() => PropertyDetailles(forSale[index]));
          },
        );
      })
      );
  }
}
