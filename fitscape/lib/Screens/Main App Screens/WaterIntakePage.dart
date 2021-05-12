import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitscape/WidgetResizing.dart';

class WaterIntakePage extends StatefulWidget {
  final Function(int) changepage;
  WaterIntakePage({this.changepage});
  @override
  _WaterIntakePageState createState() => _WaterIntakePageState();
}

class _WaterIntakePageState extends State<WaterIntakePage> {
  @override
  Widget build(BuildContext context) {
    int waterintake = 500;
    double water_percent = 0.5;
    int goal = 2500;
    Size dropsize = Size(227 / 3.6 * boxSizeH, 360 / 6.4 * boxSizeV);
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 24 / 3.6 * boxSizeH,
                height: 24 / 6.4 * boxSizeV,
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 40,
                )),
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
          height: 30 / 6.4 * boxSizeV,
        ),
        Text(
          'HYDRATION',
          style: robotoSB15.copyWith(color: Color(0xff7165E3)),
        ),
        SizedBox(
          height: 14 / 6.4 * boxSizeV,
        ),
        Text(
          'Today you took',
          style:
              GoogleFonts.roboto(fontSize: 30.0, fontWeight: FontWeight.w600),
        ),
        RichText(
          text: TextSpan(
              text: '500 ml',
              style: GoogleFonts.roboto(
                  fontSize: 30.0,
                  color: Color(0xff7165E3),
                  fontWeight: FontWeight.w600),
              children: <TextSpan>[
                TextSpan(
                  text: ' water',
                  style: GoogleFonts.roboto(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ]),
        ),
        Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 227 / 3.6 * boxSizeH,
                // height: 360 / 6.4 * boxSizeV,
                margin: EdgeInsets.only(
                  top: 6 / 6.4 * boxSizeV,
                ),
                child: LiquidCustomProgressIndicator(
                  value: water_percent,
                  direction: Axis.vertical,
                  valueColor: AlwaysStoppedAnimation(Color(0xff42C9FF)),
                  shapePath: _buildPath(dropsize),
                  backgroundColor: Color(0xffD9E6FD),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${(water_percent * 100).toInt()}%',
                        style: GoogleFonts.roboto(
                          fontSize: 43,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1D8DFD),
                        ),
                      ),
                      SizedBox(
                        height: 10 / 6.4 * boxSizeV,
                      ),
                      Text(
                        'Goal: ${goal}ml',
                        style: robotoSB15.copyWith(fontSize: 23.0),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 6 / 6.4 * boxSizeV,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(FontAwesomeIcons.plus),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}

Path _buildPath(size) {
  Path path = Path();
  path.lineTo(size.width / 2, 0);
  path.cubicTo(size.width * 0.59, size.height / 5, size.width * 0.84,
      size.height * 0.37, size.width * 0.96, size.height * 0.58);
  path.cubicTo(size.width * 1.02, size.height * 0.68, size.width * 1.02,
      size.height * 0.8, size.width * 0.9, size.height * 0.88);
  path.cubicTo(size.width * 0.72, size.height * 1.03, size.width * 0.35,
      size.height * 1.04, size.width * 0.14, size.height * 0.91);
  path.cubicTo(size.width * 0.03, size.height * 0.85, -0.02, size.height * 0.75,
      size.width * 0.01, size.height * 0.66);
  path.cubicTo(size.width * 0.02, size.height * 0.6, size.width * 0.06,
      size.height * 0.54, size.width * 0.1, size.height * 0.49);
  path.cubicTo(size.width * 0.17, size.height * 0.4, size.width * 0.26,
      size.height * 0.32, size.width * 0.34, size.height * 0.23);
  path.cubicTo(size.width * 0.41, size.height * 0.16, size.width * 0.47,
      size.height * 0.08, size.width / 2, 0);
  path.cubicTo(size.width / 2, 0, size.width / 2, 0, size.width / 2, 0);
  return path;
}
