import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../Models/PropertyForSale.dart';
import '../tool.dart';

class PropertyTile extends StatefulWidget {
  /*List<String> image;
  String district;
  String Publisher;
  String surface;
  double Price;*/
  SellingProperties property;

  PropertyTile(this.property);

  @override
  State<PropertyTile> createState() => _PropertyTileState();
}

class _PropertyTileState extends State<PropertyTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              offset: Offset(2, 2),
              blurRadius: 2)
        ],
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(width: 2,color: Colors.blueGrey,style: BorderStyle.solid)
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius./*circular(20),*/only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                // bottomRight: Radius.circular(20),
                // topRight: Radius.circular(20)),
                /*boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.4),
                      offset: Offset(2, 2),
                      blurRadius: 2)
                ],*/
                image: DecorationImage(
                  image: AssetImage(widget.property.Images[0]),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: texts(
                      text: widget.property.district,
                      fw: FontWeight.bold,
                      size: 22),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      texts(text: widget.property.Price.toString() + ' \$',size: 18),
                      SizedBox(width: 15,),
                      texts(text: widget.property.surface.toString() + ' m²',size: 18),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.bathtub_rounded),
                            texts(text: ' 2')
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        child: Row(
                          children: [
                            Icon(MdiIcons.bed),
                            texts(text:' '+widget.property.Rooms.toString())
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        child: Row(
                          children: [
                            Icon(MdiIcons.layersTripleOutline),
                            texts(text:' '+ widget.property.floors.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(bottom:10,left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      texts(text: widget.property.Publisher),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
