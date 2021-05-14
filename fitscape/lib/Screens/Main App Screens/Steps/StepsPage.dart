import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Variables.dart';
import '../../../UI Components/DashedCircle.dart';

class StepsPage extends StatefulWidget {
  final Function(int) changepage;
  StepsPage({this.changepage});
  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  @override
  Widget build(BuildContext context) {
    double caloriePercent = 0.5;
    // double step_percent = 0.5;
    // double time_percent = 0.5;
    int calNumber = 31;
    int kmNumber = 7;
    int timeNumber = 50;
    return Column(
      children: [
        Text(
          'DAILY STEPS',
          style: robotoSB15.copyWith(color: Color(0xff7165E3)),
        ),
        SizedBox(
          height: 14 / 6.4 * boxSizeV,
        ),
        Text(
          'You have walked',
          style:
              GoogleFonts.roboto(fontSize: 30.0, fontWeight: FontWeight.w600),
        ),
        RichText(
          text: TextSpan(
              text: '40%',
              style: GoogleFonts.roboto(
                  fontSize: 30.0,
                  color: Color(0xff7165E3),
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                  text: ' of your goal',
                  style: GoogleFonts.roboto(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ]),
        ),
        SizedBox(
          height: 30 / 6.4 * boxSizeV,
        ),
        CircularPercentIndicator(
          radius: 280.0,
          lineWidth: 15.0,
          percent: 1,
          startAngle: 280,
          arcType: ArcType.FULL,
          backgroundColor: Colors.white10,
          progressColor: Color(0xff8980F6),
          circularStrokeCap: CircularStrokeCap.round,
          center: Stack(
            alignment: Alignment.center,
            children: [
              DashedCircle(dashes: 25, gap: 1.2, radius: 220),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.running,
                    color: Color(0xff8980F6),
                    size: 40.0,
                  ),
                  SizedBox(
                    height: 10 / 6.4 * boxSizeV,
                  ),
                  Text(
                    '7,235',
                    style: GoogleFonts.roboto(
                        fontSize: 35.0, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'steps',
                    style: GoogleFonts.roboto(
                        fontSize: 19.0,
                        color: Color(0xff6F6868),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10 / 6.4 * boxSizeV,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                widget.changepage(2);
              },
              child: Column(
                children: [
                  CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 10.0,
                      percent: caloriePercent,
                      backgroundColor: Color(0xffC9F6FF),
                      progressColor: Color(0xff66DEEE),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Icon(Icons.local_fire_department_sharp,
                          color: Color(0xff66DEEE))),
                  SizedBox(
                    height: 10 / 6.4 * boxSizeV,
                  ),
                  Text(
                    '$calNumber cal',
                    style: GoogleFonts.roboto(
                      fontSize: 19.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20 / 3.6 * boxSizeH,
            ),
            GestureDetector(
              onTap: () {
                widget.changepage(3);
              },
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 10.0,
                    percent: caloriePercent,
                    backgroundColor: Color(0xffF1E9FD),
                    progressColor: Color(0xffAF8CF7),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Icon(FontAwesomeIcons.mapMarkerAlt,
                        color: Color(0xffAF8CF7)),
                  ),
                  SizedBox(
                    height: 10 / 6.4 * boxSizeV,
                  ),
                  Text(
                    '$kmNumber km',
                    style: GoogleFonts.roboto(
                        fontSize: 19.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20 / 3.6 * boxSizeH,
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 10.0,
                      percent: caloriePercent,
                      backgroundColor: Color(0xffD7E9FD),
                      progressColor: Color(0xff1D8DFD),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Icon(Icons.timelapse, color: Color(0xff1D8DFD))),
                  SizedBox(
                    height: 10 / 6.4 * boxSizeV,
                  ),
                  Text(
                    '$timeNumber min',
                    style: GoogleFonts.roboto(
                      fontSize: 19.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
