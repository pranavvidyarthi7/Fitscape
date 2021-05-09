import 'package:flutter/material.dart';
import '../../Variables.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class StepsPage extends StatefulWidget {
  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  @override
  Widget build(BuildContext context) {
        double calorie_percent=0.5;
        double step_percent=0.5;
        double time_percent=0.5;
        int cal_number=31;
        int km_number=7;
        int time_number=50;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 24 / 3.6 * boxSizeH,
                height: 24 / 6.4 * boxSizeV,
                child: Icon(Icons.chevron_left,color:Colors.black,size: 40,)),
            Container(
              alignment: Alignment.center,
              width: 85 / 3.6 * boxSizeH,
              height: 41 / 6.4 * boxSizeV,
              decoration: BoxDecoration(
                  color: Color(0xff8E85E3),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'History',
                style: robotoB16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(
        height: 30/6.4*boxSizeV,
        ),
        Text(
          'DAILY STEPS',
          style: robotoSB15.copyWith(color: Color(0xff7165E3)),
        ),
        SizedBox(
          height: 14/6.4*boxSizeV,
        ),
        Text(
          'You have walked',
          style:GoogleFonts.roboto(
            fontSize: 30.0,
            fontWeight: FontWeight.w600
          ),
        ),
        RichText(
          text: TextSpan(
              text: '40%',
               style:GoogleFonts.roboto(
                     fontSize: 30.0,
                color: Color(0xff7165E3),
                fontWeight: FontWeight.w600
                 ),
              children: <TextSpan>[
                TextSpan(
                  text: ' of your goal',
              style:GoogleFonts.roboto(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),
                ),
              ]
          ),
        ),
        SizedBox(
          height: 30/6.4*boxSizeV,
        ),
        CircularPercentIndicator(
          radius: 280.0,
          lineWidth: 15.0,
          percent:1,
          startAngle: 280,
          arcType: ArcType.FULL,
          backgroundColor: Colors.white10,
          progressColor: Color(0xff8980F6),
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30/6.4*boxSizeV,
              ),
              Icon(FontAwesomeIcons.running,
                color:Color(0xff8980F6),
              size: 40.0,),
              SizedBox(
                height: 10/6.4*boxSizeV,
              ),
              Text(
                '7,235',
                style:GoogleFonts.roboto(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w800
                ),
              ),

              Text(
                'steps',
                style:GoogleFonts.roboto(
                    fontSize: 19.0,
                    color: Color(0xff6F6868),
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10/6.4*boxSizeV,
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    Column(
      children: [
        CircularPercentIndicator(
        radius: 80.0,
        lineWidth: 10.0,
        percent:calorie_percent,
        backgroundColor:Color(0xffC9F6FF),
        progressColor: Color(0xff66DEEE),
        circularStrokeCap: CircularStrokeCap.round,
        center: Icon(Icons.local_fire_department_sharp,color:Color(0xff66DEEE))
        ),
        SizedBox(
          height: 10/6.4*boxSizeV,
        ),
        Text(
          '$cal_number cal',
          style:GoogleFonts.roboto(
              fontSize: 19.0,
              color: Colors.black,
              fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
            SizedBox(
              width: 20/3.6*boxSizeH,
            ),
            Column(
              children: [
                CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 10.0,
                    percent:calorie_percent,
                    backgroundColor:Color(0xffF1E9FD),
                    progressColor: Color(0xffAF8CF7),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Icon(FontAwesomeIcons.mapMarkerAlt,color:Color(0xffAF8CF7)),
    ),
                SizedBox(
                  height: 10/6.4*boxSizeV,
                ),
    Text(
    '$km_number km',
    style:GoogleFonts.roboto(
    fontSize: 19.0,
    color: Colors.black,
    fontWeight: FontWeight.w700
    ),
    ),

    ],
            ),
            SizedBox(
              width: 20/3.6*boxSizeH,
            ),
            Column(
              children: [
                CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 10.0,
                    percent:calorie_percent,
                    backgroundColor:Color(0xffD7E9FD),
                    progressColor: Color(0xff1D8DFD),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Icon(Icons.timelapse,color:Color(0xff1D8DFD))
                ),
                SizedBox(
                  height: 10/6.4*boxSizeV,
                ),
                Text(
                  '$time_number min',
                  style:GoogleFonts.roboto(
                      fontSize: 19.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),


      ],
    );
  }
}
