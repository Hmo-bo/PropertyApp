import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:property/screens/profileDetailles.dart';
import 'package:property/tool.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
  final _controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favorated=favorites.contains(widget.item);
    print(favorated);
    print(widget.item);
    favIcon=favorated?Icons.favorite:Icons.favorite_border;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: arabtexts(text: 'التفاصيل',clr: Colors.white,size: 25),
        ),
      ),
      body: CustomScrollView(
          slivers: [
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
                    pageController: _controller,
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
              SizedBox(height: 15,),
              SmoothPageIndicator(
                controller: _controller,
                count: widget.item.Images.length,
                effect: JumpingDotEffect()
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                texts(
                                    text: '${widget.item.surface} m²',
                                    fw: FontWeight.bold),

                                const SizedBox(
                                  width: 10,
                                ),

                                Container(
                                    padding: const EdgeInsets.all(7.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blueGrey[300]),
                                    child: const Icon(
                                      MdiIcons.arrowTopRightBottomLeft,
                                      size: 25,
                                    )),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                arabtexts(
                                    text:'غرف',
                                    fw: FontWeight.bold),
                                texts(text: ' ${widget.item.Rooms}'),


                                const SizedBox(
                                  width: 10,
                                ),

                                Container(
                                    padding: const EdgeInsets.all(7.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blueGrey[300]),
                                    child: const Icon(
                                      MdiIcons.bed,
                                      size: 25,
                                    )),

                              ],
                            ),
                        ],),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                arabtexts(
                                    text:'حمامات',
                                    fw: FontWeight.bold),
                                texts(text: ' ${widget.item.Rooms}'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(7.5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blueGrey[300]),
                                    child: const Icon(
                                      MdiIcons.bathtub,
                                      size: 25,
                                    )),

                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Row(
                                  children: [
                                    arabtexts(
                                        text:'طوابق',
                                        fw: FontWeight.bold),
                                    texts(text: ' ${widget.item.floors}'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(7.5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blueGrey[300]),
                                        child: const Icon(
                                          MdiIcons.layersTripleOutline,
                                          size: 25,
                                        )),

                                  ],
                                ),
                          ],
                        )


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

                    arabtexts(text: 'الوصف', size: 25, fw: FontWeight.bold),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                              'تعرف الملكية العقارية تأطيرا قانونيا غزيرا،'
                                  ' نظرا لأهميتها و كثرة المشاكل التي تطرحها.'
                                  ' و لقد عرفها المشرع على أنها تتمثل في الأرض أو الثروات العقارية غير المبنية،'
                                  ' و هي تخول لصاحب العقار سلطة مباشرة تمكنه من شغله و استعماله في إطار القانون'
                                  '. لكن كثرة النصوص ولدت اختلافات كثيرة في مقاربة'
                                  ' النظام القانوني للملكية العقارية في الجزائر.',
                      textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: SizedBox(
            height: 60,
            child: BottomNavigationBar(
              onTap: botmNavBar,
              backgroundColor: Colors.blueGrey[400],
              unselectedLabelStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontFamily: 'Almarai'
              ),
              selectedLabelStyle:  const TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontFamily: 'Almarai'
              ),
              items: [
                BottomNavigationBarItem(
                    label: 'رجوع',
                    icon: Icon(Icons.arrow_back,color: Colors.grey[800],),
                    ),
                BottomNavigationBarItem(
                    label: 'أحببته',
                    icon: Icon(favIcon,color: Colors.grey[800],)),
                BottomNavigationBarItem(
                    label: 'إتصال',
                    icon: Icon(Icons.phone_forwarded,color:Colors.grey[800]))
              ],
            ),
      ),
    );
  }

  botmNavBar(index) {

    switch (index) {
      case 0:
        {
          Get.back();
        }
        break;
      case 1:
        {
          favorated?favorite(Icons.favorite_border):favorite(Icons.favorite);
        }
        break;
      case 2:
        {
          launchPhoneDialer('+213540995164');
        }
        break;
    }
    setState(() {
      var currentIndex=index;
    });
  }
}
