import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../tool.dart';

class favoriteTile extends StatefulWidget {
  List<String> image;
  String district;
  double surface;
  double price;

  favoriteTile(this.image, this.district, this.surface,this.price);

  @override
  State<favoriteTile> createState() => _favoriteTileState();
}

class _favoriteTileState extends State<favoriteTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        height: 125,
        width: MediaQuery.of(context).size.width * .85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              offset: Offset(2, 2),
              blurRadius: 1
            )
          ]
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
                                // SizedBox(width: 15,),
                                texts(text: widget.surface.toString(),size: 22),
                                texts(text: ' m²',size: 22)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
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
          ],
        ),
    );
  }
}
