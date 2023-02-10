import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:property/tool.dart';
import 'dart:async';
import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'addProperty_2.dart';

class addProperty extends StatefulWidget {
  const addProperty({Key? key}) : super(key: key);

  @override
  State<addProperty> createState() => _addPropertyState();
}

class _addPropertyState extends State<addProperty> {
  // List<String> MyProperties = ['lib/MyProperties/red.jpg'];
  // Widget addPic =
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imagesList = [];
  final TextEditingController _districtController= TextEditingController();
  final TextEditingController _surfaceController= TextEditingController();
  final TextEditingController _floorsController= TextEditingController();
  final TextEditingController _roomsController= TextEditingController();
  final TextEditingController _toiletsController= TextEditingController();
  final _formKey=GlobalKey<FormState>();

  void selectMyProperties() async {
    final List<XFile> images = await imagePicker.pickMultiImage();
    setState(() {
      if (images!.isNotEmpty) {
        imagesList!.addAll(images);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 50,width: 125,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          onPressed: (){
            validateAndSave();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                texts(text: 'Next',fw: FontWeight.bold,size: 22,clr: Colors.white),
                Expanded(child: SizedBox()),
                Icon(MdiIcons.chevronDoubleRight,size: 40,)

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: texts(text: 'Add Property'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(15),
                    height: 300,
                    child: imagesList!.isEmpty
                        ? Center(
                            child: Container(
                                height: 250,
                                width: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blueGrey,
                                ),
                                child: const Icon(Icons.add_a_photo)),
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        imagesList!.length < 5 ? 3 : 4,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0),
                            itemCount: imagesList!.length,
                            itemBuilder: (context, index) {
                              return Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(
                                              File(imagesList![index].path)),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  top: 5,left: 5,
                                  child: GestureDetector(
                                    child: const Icon(Icons.cancel_outlined,
                                      color: Colors.white,
                                    ),
                                    onTap: (){
                                      setState(() {
                                        imagesList!.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              ]);
                            })),
                onTap: () => {
                      imagesList!.length < 10 ? selectMyProperties() : {},
                    }),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(20)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) =>
                        value!.isEmpty ? 'This Field is Required' : null,
                        decoration: const InputDecoration(
                          icon: Icon(MdiIcons.homeCityOutline),
                          labelText: 'District Name',
                        ),
                        keyboardType: TextInputType.name,
                        controller: _districtController,
                      ),
                      TextFormField(
                        validator: (value) =>
                        value!.isEmpty ? 'This Field is Required' : null,
                        controller: _surfaceController,
                        keyboardType:  TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(MdiIcons.arrowTopRightBottomLeft),
                          labelText: 'Property Surfaces',
                        ),
                      ),
                      TextFormField(
                        validator: (value) =>
                        value!.isEmpty ? 'This Field is Required' : null,
                        controller: _floorsController,
                        keyboardType:  TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(MdiIcons.layersTripleOutline),
                          labelText: 'Number of Floors',
                        ),
                      ),
                      TextFormField(
                        validator: (value) =>
                        value!.isEmpty ? 'This Field is Required' : null,
                        controller: _roomsController,
                        decoration: const InputDecoration(
                          icon: Icon(MdiIcons.bed),
                          labelText: 'Number of Rooms',
                        ),
                        keyboardType:  TextInputType.number,
                      ),
                      TextFormField(
                        validator: (value) =>
                        value!.isEmpty ? 'This Field is Required' : null,
                        controller: _toiletsController,
                        decoration: const InputDecoration(
                          icon: Icon(MdiIcons.bathtub),
                          labelText: 'Number of Toilets',
                        ),
                        keyboardType:  TextInputType.number,
                      ),
                    ],
              )),
            ),
          ],
        ),
      ),
    );

}
  void validateAndSave() {
    if (_formKey.currentState!.validate()&&imagesList!.isNotEmpty) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
    Get.to(()=>addProperty_2());
  }}