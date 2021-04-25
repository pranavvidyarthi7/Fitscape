import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences store;
double boxSizeH;
double boxSizeV;
//Bangers
TextStyle bangersSB62 = GoogleFonts.bangers(fontSize: 65);
const List<String> emoticons = [
  '😎',
  '👻',
  '😺',
  '🤠',
  '🙎🏼‍♀️',
  '🙎🏻‍♂️',
  '🦊',
  '🐼',
  '😈',
  '🐵',
  '🤓',
  '😇',
];
//josefinSans
TextStyle josefinSansSB22 =
    GoogleFonts.josefinSans(fontSize: 25, fontWeight: FontWeight.w600);
TextStyle josefinSansSB26 =
    GoogleFonts.josefinSans(fontSize: 29.0, fontWeight: FontWeight.w600);

//roboto
TextStyle robotoR10 =
    GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
TextStyle robotoSB13 =
    GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600);
TextStyle robotoSB15 =
    GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w600);
TextStyle robotoSB23 =
    GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.w600);
TextStyle robotoB16 =
    GoogleFonts.roboto(fontSize: 19, fontWeight: FontWeight.w700);

// openSans
TextStyle openSansSB12 =
    GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.w600);
TextStyle openSansSB15 =
    GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);
TextStyle openSansSB19 =
    GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600);
TextStyle openSansB15 =
    GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.bold);
