import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
class ImageViewer extends StatefulWidget {
  List  imagesList;
  ImageViewer(this.imagesList);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: PhotoViewGallery.builder(
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
    );
  }
}

