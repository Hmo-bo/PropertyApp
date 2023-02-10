import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property/screens/test.dart';

void main() {
  runApp(GetMaterialApp(
    home: Test(),
    theme: ThemeData(
      primarySwatch: Colors.blueGrey
    ),
  ));
}
