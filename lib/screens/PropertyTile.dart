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
      height: 180,
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              offset: Offset(2, 2),
              blurRadius: 2)
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                texts(
                    text: widget.property.district,
                    fw: FontWeight.bold,
                    size: 25),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    texts(text: widget.property.Price.toString() + ' \$'),
                    texts(text: widget.property.surface.toString() + ' m²'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
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
                    Container(
                      child: Row(
                        children: [
                          Icon(MdiIcons.bed),
                          texts(text:' '+widget.property.Rooms.toString())
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(MdiIcons.layersTripleOutline),
                          texts(text:' '+ widget.property.floors.toString())
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    texts(text: widget.property.Publisher),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.4),
                      offset: Offset(2, 2),
                      blurRadius: 2)
                ],
                image: DecorationImage(
                  image: AssetImage(widget.property.Images[0]),
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
