import 'package:flutter/material.dart';
import 'package:property/tool.dart';

import '../Models/PropertyForSale.dart';
import 'PropertyTile.dart';

class PropertiesToRent extends StatefulWidget {
  const PropertiesToRent({Key? key}) : super(key: key);

  @override
  State<PropertiesToRent> createState() => _PropertiesToRentState();
}

class _PropertiesToRentState extends State<PropertiesToRent> {
  List<SellingProperties> forRent = [
    SellingProperties(260, ['lib/images/beige.jpg', 'lib/images/green.jpg'],
        'NouvelleVile', 'Hammou', 150, 3,6),
    SellingProperties(485, ['lib/images/red.jpg', 'lib/images/green.jpg'],
        'Kerkoura', 'Younes', 180, 2,5),
    SellingProperties(2500, ['lib/images/green.jpg', 'lib/images/green.jpg'],
        'El Khroub', 'Omar', 286, 2,4),
    SellingProperties(632, ['lib/images/yellow.jpg', 'lib/images/green.jpg'],
        'Touzouz', 'Moussa', 50, 5,4)
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: forRent.length,
            (context, index) {
      return PropertyTile(forRent[forRent.length-index-1]);
    }));
  }
}
