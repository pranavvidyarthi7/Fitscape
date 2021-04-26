import 'dart:async';
import 'dart:math';

import 'package:fitscape/UI%20Components/ScrollSelector.dart';
import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HeightPage extends StatefulWidget {
  final Function(String) change;
  HeightPage({this.change});
  @override
  _HeightPageState createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  bool unit = true; //cm
  List<int> data = [];
  int h;
  StreamController<int> _controller;
  GlobalKey<ScrollSnapListState> key2;
  @override
  void initState() {
    super.initState();
    key2 = new GlobalKey();
    h = 152;
    _controller = StreamController.broadcast();
    for (int i = 0; i <= 280; i++) {
      data.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'What is your Height ?',
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
                        'cm',
                        style: robotoB16.copyWith(
                            color: Color(unit ? 0xffFFFFFF : 0xff000000)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (!unit)
                          key2.currentState.focusToItem(max(0, h ~/ 2));
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
                        'in',
                        style: robotoB16.copyWith(
                          color: Color(unit ? 0xff000000 : 0xffFFFFFF),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (unit)
                          key2.currentState.focusToItem(min(280, h * 2));
                        unit = false;
                      });
                    }),
              ],
            ),
          ),
          StreamBuilder<int>(
            stream: _controller.stream,
            initialData: h,
            builder: (context, snapshot) =>

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('${snapshot.data} ',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 40.0,
                    ),),
                    Text('${unit ? 'cm' : 'in'}',
                   style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
                 ),
                  ],
                ),
          ),
          ScrollSelector(
              gkey: key2,
              // key: ValueKey<int>(0),
              index: h,
              data: data,
              change: (v) {
                _controller.add(v);
                h = v;
                widget.change('$h ${unit ? 'cm' : 'ft'}');
              })
        ],
      ),
    );
  }
}
