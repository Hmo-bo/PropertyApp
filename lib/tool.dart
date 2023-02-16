import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'Models/PropertyForSale.dart';

Widget texts({required String text,double? size,Color? clr,FontWeight? fw,double? sbtw,}){
  return Text(text.toString(),
    style: GoogleFonts.nunito(
    fontSize: size??20,
    color: clr??Colors.black,
    fontWeight: fw,
    letterSpacing: sbtw??1

  ));
}

Widget arabtexts({required String text,double? size,Color? clr,FontWeight? fw,double? sbtw,}){
  return Text(text.toString(),
      style: TextStyle(
          fontSize: size??20,
          color: clr,
          fontWeight: fw,
          letterSpacing: sbtw??1,
          fontFamily: 'Almarai'
      ));
}

 List<SellingProperties> favorites=[];