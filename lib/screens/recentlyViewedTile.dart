import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../tool.dart';

class RececentlyViewedTile extends StatefulWidget {
  List<String> image;
  String district;
  double surface;
  double price;

  RececentlyViewedTile(this.image, this.district, this.surface,this.price);

  @override
  State<RececentlyViewedTile> createState() => _RececentlyViewedTileState();
}

class _RececentlyViewedTileState extends State<RececentlyViewedTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 125,
      width: MediaQuery.of(context).size.width * .85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueGrey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  texts(
                      text: widget.district,size: 25,fw: FontWeight.bold
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Icon(MdiIcons.arrowTopRightBottomLeft,),
                              // SizedBox(width: 15,),
                              texts(text: widget.surface.toString(),size: 22),
                              texts(text: ' m²',size: 22)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Icon(MdiIcons.cash,),
                              // SizedBox(width: 15,),
                              texts(text: widget.price.toString(),size: 22),
                              texts(text: ' \$',size: 22)
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(children: [
            Container(
              width: 120,
              height: 125,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image[0]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            /*Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(5)),
                      color: Colors.blueGrey[200]),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                )),*/
          ]),
        ],
      ),
    );
  }
}
