import 'package:flutter/material.dart';
import '../../Variables.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class CalorieBurntPage extends StatefulWidget {
  @override
  _CalorieBurntPageState createState() => _CalorieBurntPageState();
}

class _CalorieBurntPageState extends State<CalorieBurntPage> {
  @override
  Widget build(BuildContext context) {
    double calorie_percent=0.5;
    double step_percent=0.5;
    double time_percent=0.5;
    int cal_number=31;
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
    'DAILY CALORIES BURNT',
    style: robotoSB15.copyWith(color: Color(0xff7165E3)),
    ),
    SizedBox(
    height: 14/6.4*boxSizeV,
    ),

    RichText(
    text: TextSpan(
    text: '20%',
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
    Text(
    'reached',
    style:GoogleFonts.roboto(
    fontSize: 30.0,
    fontWeight: FontWeight.w600
    ),
    ),
    SizedBox(
    height: 30/6.4*boxSizeV,
    ),
     // Stack(
     //   children: [
     //     CircularPercentIndicator(
     //       radius: 100.0,
     //       lineWidth: 15.0,
     //       percent:0.5,
     //       startAngle: 280,
     //       arcType: ArcType.FULL,
     //       backgroundColor: Colors.white10,
     //       progressColor: Color(0xff66DEEE),
     //       circularStrokeCap: CircularStrokeCap.butt,
     //     ),
     //     CircularPercentIndicator(
     //       radius: 100.0,
     //       lineWidth: 15.0,
     //       percent:0.5,
     //       startAngle: 280,
     //       backgroundColor: Color(0xff1D8DFD),
     //       progressColor: Color(0xff8980F6),
     //       circularStrokeCap: CircularStrokeCap.butt,
     //     ),
     //   ],
     // ),
        SizedBox(
          height: 12/6.4*boxSizeV,
        ),
    Align(
      alignment: Alignment.centerRight,
      child: FloatingActionButton(
          onPressed: (){},
        backgroundColor: Color(0xff1D8DFD),
      child: Icon(FontAwesomeIcons.plus),),
    ),

        SizedBox(
          height: 12/6.4*boxSizeV,
        ),

    Column(
      children: [
        Divider(
          height: 2,
          thickness: 2,
          color: Color(0xffE7E7E7),
        ),
        SizedBox(
          height: 7/6.4*boxSizeV,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Icon(
                     FontAwesomeIcons.squareFull,
                     color: Color(0xff8980F6),),

                 Text('Body Consumption\t',
                   style: GoogleFonts.roboto(
                       fontSize: 18.0,
                       color: Colors.black,
                       fontWeight: FontWeight.bold
                   ),),
                 Text('20%',
                   style: GoogleFonts.roboto(
                       fontSize: 18.0,
                       color: Colors.black,
                       fontWeight: FontWeight.bold
                   ),),
                 Text('100 cal',
                   style: GoogleFonts.roboto(
                       fontSize: 18.0,
                       color: Colors.black,
                       fontWeight: FontWeight.bold
                   ),),
          ],
               ),
            SizedBox(
              height: 7/6.4*boxSizeV,
            ),
        Divider(
          height: 2,
          thickness: 2,
          color: Color(0xffE7E7E7),
        ),

        SizedBox(
          height: 7/6.4*boxSizeV,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.squareFull,
              color: Color(0xff66DEEE),),

            Text('Steps/Distance Burn',
              style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            Text('20%',
              style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            Text('100 cal',
              style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
          ],
        ),
        SizedBox(
          height: 7/6.4*boxSizeV,
        ),
        Divider(
          height: 2,
          thickness: 2,
          color: Color(0xffE7E7E7),
        ),
        SizedBox(
          height: 7/6.4*boxSizeV,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.squareFull,
              color: Color(0xff1D8DFD),),

            Text('Other Excercises\t\t\t\t',
              style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            Text('20%',
              style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            Text('100 cal',
              style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
          ],
        ),
        SizedBox(
          height: 7/6.4*boxSizeV,
        ),
        Divider(
          height: 2,
          thickness: 2,
          color: Color(0xffE7E7E7),
        ),
         ],
        ),
    ],
    );
  }
}