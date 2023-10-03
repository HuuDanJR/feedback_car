import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget textcustom({text,double? size,isBold,color}) {
  return Text(text,style: GoogleFonts.nunitoSans(
    fontSize: size,fontWeight:isBold==true? FontWeight.bold:FontWeight.normal),);
}
Widget textcustom2({text,double? size,isBold,color}) {
  return Text(text,style: GoogleFonts.nunito(fontSize: size,fontWeight:isBold==true? FontWeight.bold:FontWeight.normal),);
}
Widget textcustom_center({text,double? size,isBold,color}) {
  return Text(
    text,style: GoogleFonts.nunito(fontSize: size,fontWeight:isBold==true? FontWeight.bold:FontWeight.normal),textAlign: TextAlign.center,);
}
Widget textcustomColor({text,double? size,isBold,color}) {
  return Text(text,style: GoogleFonts.nunitoSans(
    color:  color,
    fontSize: size,fontWeight:isBold==true? FontWeight.bold:FontWeight.normal),);
}
