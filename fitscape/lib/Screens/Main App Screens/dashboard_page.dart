import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../Variables.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitscape/Services/User.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class DashBoard extends StatefulWidget {
  final Function(int) change;
  DashBoard({this.change});
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String date=(DateFormat('E, d MMM').format(DateTime.now()));
  double calorie_percent=0.5;
  double step_percent=0.5;
  double water_percent=0.5;
  Size dropsize=Size(48/3.6*boxSizeH, 77/6.4*boxSizeV);
  @override
  Widget build(BuildContext context) {
    final _user=Provider.of<AppUser>(context,listen: false);
    String _name=_user.name;
    return Column(
      children: [
        Container(
          width: 320/3.6 *boxSizeH,
          height: 86/6.4*boxSizeV,
          margin: EdgeInsets.only(
            top: 25.0/6.4*boxSizeV,
            bottom: 30.0/6.4*boxSizeV,
          ),

          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffFFFFFF),
              ),
            borderRadius:  BorderRadius.all(Radius.circular(25.0) ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                offset: Offset(0, 1), // shadow direction: bottom right
              )
            ],
            color: Color(0xffFFFFFF),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Icon(FontAwesomeIcons.solidSun,
                        color: Color(0xff563FE5),),
                        margin: EdgeInsets.only(
                          left: 20/3.6*boxSizeH,
                          top: 15/6.4*boxSizeV,
                        ),
                        width: 15/3.6*boxSizeH,
                        height: 17/6.4*boxSizeV,
                      ),
                      Container(
                        height: 15/6.4*boxSizeV,
                        width: 102/3.6*boxSizeH,
                        margin: EdgeInsets.only(
                          left: 20/3.6*boxSizeH,
                          top: 18/6.4*boxSizeV,
                        ),
                        child: Text(
                         date.toUpperCase(),
                          style:robotoSB13.copyWith(color: Color(0xff563FE5),) ,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10/6.4*boxSizeV,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20/3.6*boxSizeH,
                    ),
                    child: Text(
                      'Hi, $_name',
                      style: robotoSB23,
                    ),
                  ),

                ],
              ),

              Container(
                height: 66/6.4*boxSizeV,
                width: 66/3.6*boxSizeH,
                margin: EdgeInsets.only(
                  right: 10/3.6*boxSizeH,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff000000),
                  ),
                  borderRadius:  BorderRadius.all(Radius.circular(25.0) ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 30.0/6.4*boxSizeV,
          ),
          width: 320/3.6 *boxSizeH,
          height: 388/6.4*boxSizeV,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 150/3.6 *boxSizeH,
                    height: 184/6.4*boxSizeV,
                    margin: EdgeInsets.only(
                      bottom: 20.0/6.4*boxSizeV,
                    ),

                     decoration: BoxDecoration(
                         border: Border.all(
                          color: Color(0xffB1ABEC),
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(25.0) //
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color:Color(0xffB1ABEC),
                            )
                        ],
                      color: Color(0xffB1ABEC),
                     ),
                    child: Padding(
                      padding:  EdgeInsets.only(
                        left: 12/3.6*boxSizeH,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12/6.4*boxSizeV,
                          ),

                          Text('CALORIES INTAKE',
                            style: robotoR10.copyWith(
                              color: Colors.white,
                                fontSize: 16.0
                            ),
                          ),
                          Container(
                            width: 77/3.6*boxSizeH,
                            height: 77/6.4*boxSizeV,
                            margin: EdgeInsets.only(
                              top: 10/6.4*boxSizeV,
                              bottom: 10/6.4*boxSizeV,
                              left: 20/3.6*boxSizeH,
                            ),
                           child: CircularPercentIndicator(
                             radius: 77.0,
                             lineWidth: 25.0,
                             percent:calorie_percent,
                             backgroundColor: Color(0xff445174),
                             progressColor: Color(0xff8980F6),
                             circularStrokeCap: CircularStrokeCap.butt,

                           ),
                          ),
                          RichText(
                           text: TextSpan(
                             text: '9,890',
                             style: robotoB16.copyWith(
                                 color: Colors.white,
                                  fontSize: 23.0),
                             children: <TextSpan>[
                           TextSpan(
                           text: ' / 20,000 Cal',
                             style: robotoB16.copyWith(
                                 color: Colors.white,
                             fontSize: 13.0),
                           ),
                             ]
                           ),
                          ),
                          SizedBox(
                            height: 3/6.4*boxSizeV,
                          ),
                          Text(
                            'last update 3m',
                            style: robotoB16.copyWith(
                                color: Color(0xffEAEAEA),
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                    )
                  ),
                  SizedBox(
                    width: 20.0/3.6*boxSizeH,
                  ),
                  Container(
                    width: 150/3.6 *boxSizeH,
                    height: 184/6.4*boxSizeV,
                    margin: EdgeInsets.only(
                      bottom: 20.0/6.4*boxSizeV,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff7165E3),
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(25.0) //
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color:Color(0xff7165E3),
                              )
                        ],
                      color: Color(0xff7165E3),),
                      child: Padding(
                        padding:  EdgeInsets.only(
                          left: 12/3.6*boxSizeH,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12/6.4*boxSizeV,
                            ),
                            Text('CALORIES BURNT',
                              style: robotoR10.copyWith(
                                color: Colors.white,
                                 fontSize: 16.0
                              ),
                            ),
                            Container(
                              width: 77/3.6*boxSizeH,
                              height: 77/6.4*boxSizeV,
                              margin: EdgeInsets.only(
                                left: 36/3.6*boxSizeH,
                                top: 10/6.4*boxSizeV,
                                bottom: 10/6.4*boxSizeV,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: '9,890',
                                  style: robotoB16.copyWith(
                                      color: Colors.white,
                                      fontSize: 23.0),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Cal',
                                      style: robotoB16.copyWith(
                                          color: Colors.white,
                                          fontSize: 13.0),
                                    ),
                                  ]
                              ),
                            ),
                            SizedBox(
                              height: 3/6.4*boxSizeV,
                            ),
                            Text(
                              'last update 3m',
                              style: robotoB16.copyWith(
                                  color: Color(0xffEAEAEA),
                                  fontSize: 12.0),
                            ),

                          ],
                        ),
                      )
                  ),
                ],

              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      widget.change(4);
                    },
                    child: Container(
                      width: 150/3.6 *boxSizeH,
                      height: 184/6.4*boxSizeV,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff1E87FD),
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.0) //
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color:Color(0xff41E87FD),

                            )
                          ],
                        color: Color(0xff1E87FD),),
                        child: Padding(
                          padding:  EdgeInsets.only(
                            left: 12/3.6*boxSizeH,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:12/6.4*boxSizeV ,
                              ),

                              Text('WATER',
                                style: robotoR10.copyWith(
                                  color: Colors.white,
                                  fontSize: 16.0
                                ),
                              ),
                              Container(
                                width: 77/3.6*boxSizeH,
                                height: 77/6.4*boxSizeV,
                                margin: EdgeInsets.only(
                                  top: 10/6.4*boxSizeV,
                                  bottom: 10/6.4*boxSizeV,
                                  left: 38/3.6*boxSizeH,
                                ),
                                child: LiquidCustomProgressIndicator(
                                  value: water_percent,
                                  direction: Axis.vertical,
                                  valueColor:AlwaysStoppedAnimation (Color(0xff42C9FF)),
                                  shapePath: _buildPath(dropsize),
                                  backgroundColor: Color(0xffD9E6FD),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '9,890',
                                    style: robotoB16.copyWith(
                                        color: Colors.white,
                                        fontSize: 23.0),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' / 20,000 ml',
                                        style: robotoB16.copyWith(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]
                                ),
                              ),
                              SizedBox(
                                height: 3/6.4*boxSizeV,
                              ),
                              Text(
                                'last update 3m',
                                style: robotoB16.copyWith(
                                    color: Color(0xffEAEAEA),
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 20.0/3.6*boxSizeH,
                  ),
                  GestureDetector(
                    onTap: (){
                      widget.change(5);
                    },
                    child: Container(
                      width: 150/3.6 *boxSizeH,
                      height: 184/6.4*boxSizeV,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff4C5A81),
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.0) //
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color:Color(0xff4C5A81),
                                )
                          ],
                        color: Color(0xff4C5A81),),
                        child: Padding(
                          padding:  EdgeInsets.only(
                            left: 12/3.6*boxSizeH,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 12/6.4*boxSizeV,
                              ),
                              Text('STEPS',
                                style: robotoR10.copyWith(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                ),
                              ),
                              Container(
                                width: 80/3.6*boxSizeH,
                                height: 80/6.4*boxSizeV,
                                margin: EdgeInsets.only(
                                  top: 10/6.4*boxSizeV,
                                  bottom: 10/6.4*boxSizeV,
                                  left: 20/3.6*boxSizeH,
                                ),
                                child: CircularPercentIndicator(
                                  radius: 80.0,
                                  lineWidth: 10.0,
                                  percent: step_percent,
                                  progressColor: Color(0xff8980F6),
                                  backgroundColor: Color(0xff445174),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: SvgPicture.asset('assets/svg/dashboardstep.svg'),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '9,890',
                                    style: robotoB16.copyWith(
                                        color: Colors.white,
                                        fontSize: 23.0),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' / 20,000',
                                        style: robotoB16.copyWith(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ]
                                ),
                              ),
                              SizedBox(
                                height: 3/6.4*boxSizeV,
                              ),
                              Text(
                                'last update 3m',
                                style: robotoB16.copyWith(
                                    color: Color(0xffA2A8BF),
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Path _buildPath(size){
  Path path=Path();
  path.lineTo(size.width / 2, 0);
  path.cubicTo(size.width * 0.59, size.height / 5, size.width * 0.84, size.height * 0.37, size.width * 0.96, size.height * 0.58);
  path.cubicTo(size.width * 1.02, size.height * 0.68, size.width * 1.02, size.height * 0.8, size.width * 0.9, size.height * 0.88);
  path.cubicTo(size.width * 0.72, size.height * 1.03, size.width * 0.35, size.height * 1.04, size.width * 0.14, size.height * 0.91);
  path.cubicTo(size.width * 0.03, size.height * 0.85, -0.02, size.height * 0.75, size.width * 0.01, size.height * 0.66);
  path.cubicTo(size.width * 0.02, size.height * 0.6, size.width * 0.06, size.height * 0.54, size.width * 0.1, size.height * 0.49);
  path.cubicTo(size.width * 0.17, size.height * 0.4, size.width * 0.26, size.height * 0.32, size.width * 0.34, size.height * 0.23);
  path.cubicTo(size.width * 0.41, size.height * 0.16, size.width * 0.47, size.height * 0.08, size.width / 2, 0);
  path.cubicTo(size.width / 2, 0, size.width / 2, 0, size.width / 2, 0);
  return path;
}
