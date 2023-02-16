import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class ImageViewer extends StatefulWidget {
  List  imagesList;

  ImageViewer(this.imagesList);

  // ImageViewer(this.imagesList);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  // final _controller=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: /*Scaffold(
        backgroundColor: Colors.black,
        body: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child:*/ PhotoViewGallery.builder(
                        scrollPhysics: const BouncingScrollPhysics(),
                        builder: (BuildContext context, int index) {
                          return  PhotoViewGalleryPageOptions(
                            imageProvider: AssetImage(widget.imagesList[index]),
                            initialScale: PhotoViewComputedScale.contained * 1.0,
                            minScale: PhotoViewComputedScale.contained * 0.8,
                            maxScale: PhotoViewComputedScale.covered * 1.1,
                          );
                        },
                        itemCount: widget.imagesList.length,
                      ),
                 /*   ),
                  ),
                 *//* SizedBox(height: 20,),
                  SmoothPageIndicator(
                      controller: _controller,
                      count: widget.imagesList.length,
                    effect: SwapEffect(
                      dotColor: Colors.grey.shade200,
                      activeDotColor: Colors.blueGrey.shade600,
                      dotHeight: 15,dotWidth: 15,
                      spacing: 15
                    ),
                  )*//*
                ],
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}

