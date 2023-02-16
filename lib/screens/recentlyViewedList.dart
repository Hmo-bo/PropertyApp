import 'package:flutter/material.dart';
import 'package:property/screens/recentlyViewedTile.dart';
import 'package:property/tool.dart';

import '../Models/PropertyForSale.dart';
class recentViewed extends StatefulWidget {
  const recentViewed({Key? key}) : super(key: key);

  @override
  State<recentViewed> createState() => _recentViewedState();
}

class _recentViewedState extends State<recentViewed> {
  List<SellingProperties> recent = [
    SellingProperties(260, ['lib/images/beige.jpg', 'lib/images/green.jpg',],
        'Nouvelle Ville', 'Hammou', 150,2,5),
    SellingProperties(485, ['lib/images/red.jpg', 'lib/images/green.jpg'],
        'Kerkoura', 'Younes', 180,1,3),
    SellingProperties(2500, ['lib/images/green.jpg', 'lib/images/green.jpg'],
        'El Khroub', 'Omar', 286,3,6),
    SellingProperties(632, ['lib/images/yellow.jpg', 'lib/images/green.jpg'],
        'Touzouz', 'Moussa', 50,4,2)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Align(
        alignment: AlignmentDirectional.centerEnd,child: arabtexts(text: 'تمت مشاهدته مؤخرا',clr: Colors.white,size: 25)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate(
                  childCount: recent.length,
                  (context,index){
            return RececentlyViewedTile(recent[index].Images, recent[index].district,
                recent[index].surface, recent[index].Price);
          }))
        ],
      )
    );
  }
}
