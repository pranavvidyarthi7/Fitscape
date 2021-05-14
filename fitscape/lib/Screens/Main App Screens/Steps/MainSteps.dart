import 'package:fitscape/Screens/Main%20App%20Screens/Steps/CalorieBurntSteps.dart';
import 'package:fitscape/Screens/Main%20App%20Screens/Steps/DistancePage.dart';
import 'package:fitscape/Screens/Main%20App%20Screens/Steps/StepsPage.dart';
import 'package:fitscape/UI%20Components/DashedCircle.dart';
import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
import 'package:fitscape/WidgetResizing.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MainSteps extends StatefulWidget {
  // 5:Steps
//  5.1: Steps
//  5.2: Cal
//  5.3: Dist
//  5.4: Time
  @override
  _MainStepsState createState() => _MainStepsState();
}

class _MainStepsState extends State<MainSteps> {
  double caloriePercent = 0.5;
  int i = 0, j = 1, k = 2, l = 3, temp; //0:Steps, 1:Distance, 2:Cal, 3:Time
  // int calNumber = 31, kmNumber = 7, timeNumber = 50;
  List<dynamic> values = [];
  @override
  void initState() {
    values.add({
      '%': 50,
      'heading': 'DAILY STEPS',
      'text': 'You have walked',
      'richText': RichText(
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
      'icon': 'assets/svg/steps_run.svg',
      'color': Color(0xff8980F6),
      'bgColor': Color(0xffD8D4FF),
      'val': '7k',
      'unit': 'steps',
    });
    values.add({
      '%': 50,
      'heading': 'CALORIES BURNT',
      'text': 'You have burnt',
      'richText': RichText(
        text: TextSpan(
            text: '31 cal',
            style: GoogleFonts.roboto(
                fontSize: 30.0,
                color: Color(0xff7165E3),
                fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                text: ' by walking',
                style: GoogleFonts.roboto(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
      ),
      'icon': 'assets/svg/steps_burn.svg',
      'color': Color(0xff66DEEE),
      'bgColor': Color(0xffC9F6FF),
      'val': '31',
      'unit': 'cal',
    });
    values.add({
      '%': 40,
      'heading': 'DAILY DISTANCE',
      'text': 'You have walked',
      'richText': RichText(
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
      'icon': 'assets/svg/steps_location.svg',
      'color': Color(0xffAF8CF7),
      'bgColor': Color(0xffF1E9FD),
      'val': '7k',
      'unit': 'metres',
    });
    values.add({
      '%': 10,
      'heading': 'TIME SPENT',
      'text': 'You spent',
      'richText': RichText(
        text: TextSpan(
            text: '50 min',
            style: GoogleFonts.roboto(
                fontSize: 30.0,
                color: Color(0xff7165E3),
                fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                text: ' walking today',
                style: GoogleFonts.roboto(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ]),
      ),
      'icon': 'assets/svg/steps_time.svg',
      'color': Color(0xff1D8DFD),
      'bgColor': Color(0xffD7E9FD),
      'val': '50',
      'unit': 'min',
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: Column(
              key: ValueKey<int>(i),
              children: [
                Text(
                  values[i]['heading'],
                  style: robotoSB15.copyWith(color: Color(0xff7165E3)),
                ),
                SizedBox(
                  height: 14 / 6.4 * boxSizeV,
                ),
                Text(
                  values[i]['text'],
                  style: GoogleFonts.roboto(
                      fontSize: 30.0, fontWeight: FontWeight.w600),
                ),
                values[i]['richText'],
                SizedBox(
                  height: 30 / 6.4 * boxSizeV,
                ),
                CircularPercentIndicator(
                  animation: true,
                  animationDuration: 1800,
                  radius: 280.0,
                  lineWidth: 15.0,
                  percent: values[i]['%'] / 100,
                  startAngle: 280,
                  arcType: ArcType.FULL,
                  backgroundColor: Colors.transparent,
                  arcBackgroundColor: values[i]['bgColor'],
                  progressColor: values[i]['color'],
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Stack(
                    alignment: Alignment.center,
                    children: [
                      DashedCircle(
                          dashes: 25,
                          gap: 1.2,
                          radius: 220,
                          color: values[i]['color']),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            values[i]['icon'],
                            height: 36 / 6.4 * boxSizeV,
                          ),
                          SizedBox(
                            height: 10 / 6.4 * boxSizeV,
                          ),
                          Text(
                            values[i]['val'],
                            style: GoogleFonts.roboto(
                                fontSize: 35.0, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            values[i]['unit'],
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
              ],
            ),
          ),
          SizedBox(
            height: 10 / 6.4 * boxSizeV,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: GestureDetector(
                    key: ValueKey<int>(j),
                    onTap: () {
                      setState(() {
                        temp = j;
                        j = i;
                        i = temp;
                      });
                    },
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 10.0,
                          percent: values[j]['%'] / 100,
                          backgroundColor: values[j]['bgColor'],
                          progressColor: values[j]['color'],
                          circularStrokeCap: CircularStrokeCap.round,
                          center: SvgPicture.asset(
                            values[j]['icon'],
                            height: 20 / 6.4 * boxSizeV,
                          ),
                        ),
                        SizedBox(
                          height: 10 / 6.4 * boxSizeV,
                        ),
                        Text(
                          '${values[j]['val']} ${values[j]['unit']}',
                          style: GoogleFonts.roboto(
                            fontSize: 19.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: GestureDetector(
                    key: ValueKey<int>(k),
                    onTap: () {
                      setState(() {
                        temp = k;
                        k = i;
                        i = temp;
                      });
                    },
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 10.0,
                          percent: values[k]['%'] / 100,
                          backgroundColor: values[k]['bgColor'],
                          progressColor: values[k]['color'],
                          circularStrokeCap: CircularStrokeCap.round,
                          center: SvgPicture.asset(values[k]['icon'],
                              height: 20 / 6.4 * boxSizeV),
                        ),
                        SizedBox(
                          height: 10 / 6.4 * boxSizeV,
                        ),
                        Text(
                          '${values[k]['val']} ${values[k]['unit']}',
                          style: GoogleFonts.roboto(
                              fontSize: 19.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: GestureDetector(
                    key: ValueKey<int>(l),
                    onTap: () {
                      setState(() {
                        temp = l;
                        l = i;
                        i = temp;
                      });
                    },
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 10.0,
                          percent: values[l]['%'] / 100,
                          backgroundColor: values[l]['bgColor'],
                          progressColor: values[l]['color'],
                          circularStrokeCap: CircularStrokeCap.round,
                          center: SvgPicture.asset(values[l]['icon'],
                              height: 20 / 6.4 * boxSizeV),
                        ),
                        SizedBox(
                          height: 10 / 6.4 * boxSizeV,
                        ),
                        Text(
                          '${values[l]['val']} ${values[l]['unit']}',
                          style: GoogleFonts.roboto(
                            fontSize: 19.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //  AnimatedSwitcher(
          //     duration: Duration(seconds: 1),
          //     child:_page==1?StepsPage(
          //       changepage: (v){
          //         setState(() {
          //           _page=v;
          //         });
          //       },
          //     ):
          //   _page==2?CalorieBurntSteps(

          //     changepage: (v){
          //       setState(() {
          //         _page=v;
          //       });
          //     },
          //   ):
          //  _page==3?DistancePage(

          //    changepage: (v){
          //      setState(() {
          //        _page=v;
          //      });
          //    },
          //  ):
          //        Container(),
          //     transitionBuilder: (child, animation) => FadeTransition(
          //       opacity: animation,
          //       child: child,
          //     ),
          //   ),
        ],
      ),
    );
  }
}
