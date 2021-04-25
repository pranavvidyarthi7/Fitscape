import 'dart:async';
import 'dart:math';

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
  bool unit = true; //lbs
  List<int> data = [];
  int w;
  StreamController<int> _controller;
  GlobalKey<ScrollSnapListState> key;
  @override
  void initState() {
    super.initState();
    key = GlobalKey();
    w = 180;
    _controller = StreamController.broadcast();
    for (int i = 0; i <= 900; i++) {
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
                        if (!unit)
                          key.currentState.focusToItem(min(900, w * 2));
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
                        if (unit) key.currentState.focusToItem(max(0, w ~/ 2));
                        unit = false;
                      });
                    }),
              ],
            ),
          ),
          StreamBuilder<int>(
            stream: _controller.stream,
            initialData: w,
            builder: (context, snapshot) =>
                Text('${snapshot.data} ${unit ? 'lbs' : 'kg'}'),
          ),
          ScrollSelector(
              gkey: key,
              index: w,
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
