import 'package:flutter/material.dart';
import '../Models/PropertyForSale.dart';
import 'recentlyViewedTile.dart';
class MyProperties extends StatelessWidget {
  const MyProperties({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<SellingProperties> MyProperties = [
      SellingProperties(260, ['lib/images/beige.jpg', 'lib/images/green.jpg',],
          'Nouvelle Ville', 'Hammou', 150,2,5),
      SellingProperties(485, ['lib/images/red.jpg', 'lib/images/green.jpg'],
          'Kerkoura', 'Younes', 180,1,3),
      SellingProperties(2500, ['lib/images/green.jpg', 'lib/images/green.jpg'],
          'El Khroub', 'Omar', 286,3,6),
      SellingProperties(632, ['lib/images/yellow.jpg', 'lib/images/green.jpg'],
          'Touzouz', 'Moussa', 50,4,2)
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverList(delegate: SliverChildBuilderDelegate(
            childCount: MyProperties.length,
            (context,index){
            return RececentlyViewedTile(MyProperties[index].Images, MyProperties[index].district,
                MyProperties[index].surface, MyProperties[index].Price);
          }))
        ],
      ),
    );
  }
}
