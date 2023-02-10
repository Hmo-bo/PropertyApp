import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:property/screens/profileDetailles.dart';
import 'package:property/tool.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/PropertyForSale.dart';
import 'Drawer.dart';
import 'ImageViewer.dart';

class PropertyDetailles extends StatefulWidget {
  SellingProperties item;

  PropertyDetailles(this.item);

  @override
  State<PropertyDetailles> createState() => _PropertyDetaillesState();
}

class _PropertyDetaillesState extends State<PropertyDetailles> {

  IconData favIcon = Icons.favorite_border;
  bool favorated = false;

  favorite(icn) {
    favorated = !favorated;
    setState(() {
      favIcon = icn;
    });
    favorated?favorites.add(widget.item):favorites.remove(widget.item);
  }

  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri _phoneUri = Uri(
        scheme: "tel",
        path: contactNumber
    );
    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      throw("Cannot dial");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favorated=favorites.contains(widget.item);
    favIcon=favorated?Icons.favorite:Icons.favorite_border;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: appDrawer(context),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          /*SliverAppBar(
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey[100]
                  ),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                actions: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey[100]
                    ),
                    child: IconButton(onPressed: () {
                        favorated ? favorite(Icons.favorite_border):favorite(Icons.favorite);
                    },
                        icon: Icon(favIcon)),
                  )
                ],
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background:
              ),*/

          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    child: PhotoViewGallery.builder(
                      backgroundDecoration: const BoxDecoration(color: Colors.white),
                      scrollPhysics: const BouncingScrollPhysics(),
                      builder: (BuildContext context, int index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider: AssetImage(widget.item.Images[index]),
                          initialScale: PhotoViewComputedScale.contained * 1.0,
                          minScale: PhotoViewComputedScale.contained * 0.8,
                          maxScale: PhotoViewComputedScale.covered * 1.1,
                        );
                      },
                      itemCount: widget.item.Images.length,
                    ),
                    onTap: () => Get.to(() => ImageViewer(widget.item.Images)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: texts(
                              text: widget.item.district,
                              fw: FontWeight.bold,
                              size: 25)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(height: 1,color: Colors.blueGrey,thickness: 2,),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(7.5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey[300]),
                                  child: const Icon(
                                    MdiIcons.arrowTopRightBottomLeft,
                                    size: 25,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              texts(
                                  text: '${widget.item.surface} m²',
                                  fw: FontWeight.bold)
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(7.5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey[300]),
                                  child: const Icon(
                                    MdiIcons.toilet,
                                    size: 25,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              texts(
                                  text:
                                      '${widget.item.Rooms} Toilets',
                                  fw: FontWeight.bold)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(7.5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey[300]),
                                  child: const Icon(
                                    MdiIcons.bed,
                                    size: 25,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              texts(
                                  text: '${widget.item.Rooms} Rooms',
                                  fw: FontWeight.bold)
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(7.5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey[300]),
                                  child: const Icon(
                                      MdiIcons.layersTripleOutline,
                                    size: 25,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              texts(
                                  text:
                                      '${widget.item.floors} Floors',
                                  fw: FontWeight.bold)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(height: 1,color: Colors.blueGrey,thickness: 2,),
                      const SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Container(
                            padding: const EdgeInsets.all(7.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueGrey[300]),
                            child: const Icon(
                              Icons.person,
                              size: 25,
                            )),
                          const SizedBox(
                            width: 10,
                          ),
                          texts(
                              text:
                              widget.item.Publisher+'  0540995164',
                              fw: FontWeight.bold)],),
                        onTap:()=> Get.to(const profileDetailles()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      texts(text: 'Description', size: 25, fw: FontWeight.bold),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: texts(
                            text:
                                'A property description is the written portion '
                                'of a real estate listing that describes the details '
                                'of a home for sale or lease. Descriptions account for roughly one-third '
                                'of a listing and are accompanied by property information (i.e. the number '
                                'of bedrooms) and photographs'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          return SizedBox(
            height: 80,
            child: BottomNavigationBar(
              backgroundColor: Colors.blueGrey[400],
              items: [
                BottomNavigationBarItem(
                    label: '',
                    icon: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back,size: 30,color: Colors.grey[800],),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: IconButton(
                        onPressed: ()=>favorated?favorite(Icons.favorite_border):favorite(Icons.favorite),
                        icon: Icon(favIcon,size: 30,),color: Colors.grey[800],)),
                BottomNavigationBarItem(
                    label: '',
                    icon: IconButton(
                        onPressed: () {
                          launchPhoneDialer('+213540995164');
                        },
                        icon: Icon(Icons.phone_forwarded,size: 30,color:Colors.grey[800])))
              ],
            ),
          );
        }
      ),
    );
  }
}
