import 'dart:async';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitscape/UI%20Components/ScrollSelector.dart';
import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class WeightPage extends StatefulWidget {
  final Function(String) change;
  WeightPage({this.change});
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  bool unit = true; //lbs:900,
  //kg:450
  List<int> data = [], lbs = [];
  int w;
  StreamController<int> _controller;
  GlobalKey<ScrollSnapListState> key;
  @override
  void initState() {
    super.initState();
    key = GlobalKey();
    w = 180;
    _controller = StreamController.broadcast();
    for (int i = 1; i <= 450; i++) {
      data.add(i);
    }
    for (int i = 451; i <= 900; i++) {
      lbs.add(i);
      data.add(i);
    }
    widget.change('$w ${unit ? 'lbs' : 'kg'}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'What is your Weight ?',
              style: robotoSB23,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20 / 6.4 * boxSizeV,
              bottom: 20 / 6.4 * boxSizeV,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 70 / 3.6 * boxSizeH,
                      height: 40 / 6.4 * boxSizeV,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(unit ? 0xffFFFFFF : 0xffC4C4C4),
                        ),
                        color: Color(unit ? 0xff8E85E3 : 0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 15,
                              color: Color(unit ? 0xff8E85E3 : 0xffFFFFFF),
                              offset: Offset(1, 3))
                        ],
                      ),
                      child: Text(
                        'lbs',
                        style: robotoB16.copyWith(
                          color: Color(unit ? 0xffFFFFFF : 0xff000000),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (!unit) {
                          data.addAll(lbs);
                          key.currentState.focusToItem(min(901, w * 2) - 1);
                        }
                        unit = true;
                      });
                    }),
                SizedBox(
                  width: 20 / 3.6 * boxSizeH,
                ),
                GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 70 / 3.6 * boxSizeH,
                      height: 40 / 6.4 * boxSizeV,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(unit ? 0xffC4C4C4 : 0xffFFFFFF),
                        ),
                        color: Color(unit ? 0xffFFFFFF : 0xff8E85E3),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 15,
                              color: Color(unit ? 0xffFFFFFF : 0xff8E85E3),
                              offset: Offset(1, 3))
                        ],
                      ),
                      child: Text(
                        'Kg',
                        style: robotoB16.copyWith(
                          color: Color(unit ? 0xff000000 : 0xffFFFFFF),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (unit) {
                          key.currentState.focusToItem(max(1, w ~/ 2) - 1);
                          Future.delayed(
                              Duration(
                                milliseconds: 500,
                              ), () {
                            setState(() {
                              data.removeRange(450, 900);
                            });
                          });
                        }
                        unit = false;
                      });
                    }),
              ],
            ),
          ),
          StreamBuilder<int>(
            stream: _controller.stream,
            initialData: w,
            builder: (context, snapshot) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${snapshot.data} ',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  '${unit ? 'lbs' : 'kg'}',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
          ScrollSelector(
              gkey: key,
              index: w - 1,
              data: data,
              change: (v) {
                _controller.add(v);
                w = v;
                widget.change('$w ${unit ? 'lbs' : 'kg'}');
              })
        ],
      ),
    );
  }
}
