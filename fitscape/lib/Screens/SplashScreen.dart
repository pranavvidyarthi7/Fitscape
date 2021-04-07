import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Variables.dart';
import '../WidgetResizing.dart';
import '../template.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer startTimeout() {
    return Timer(Duration(seconds: 2), changeScreen);
  }

  void changeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            Template(), //TODO: ADD NAVIGATION TO HOME PAGE HERE
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100 * boxSizeV,
          width: 100 * boxSizeH,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffF5F9FA), Color(0xffFBFDFD)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          padding: EdgeInsets.symmetric(
              vertical: 24 * boxSizeV / 6.4, horizontal: 24 * boxSizeH / 3.6),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 120 / 6.4 * boxSizeV,
                  bottom: 22 / 6.4 * boxSizeV,
                ),
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                  width: 183 / 3.6 * boxSizeH,
                ),
              ),
              Container(
                child: Text(
                  'FITSCAPE',
                  style: GoogleFonts.bangers(
                      fontSize: 65, color: Color(0xff2F2E41)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 180 / 6.4 * boxSizeV,
                  bottom: 45 / 6.4 * boxSizeV,
                ),
                child: Text('By Tecnotuners', style: josefinSansSB22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
