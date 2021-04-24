import 'dart:math';

import 'package:fitscape/Variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class PicScroller extends StatefulWidget {
  @override
  _PicScrollerState createState() => _PicScrollerState();
}

class _PicScrollerState extends State<PicScroller> {
  List<int> data = [];
  Widget _buildItemList(BuildContext context, int index) {
    return Container(
      alignment: Alignment.center,
      width: 55 / 3.6 * boxSizeH,
      margin: EdgeInsets.symmetric(
        horizontal: 8.5 / 3.6 * boxSizeH,
        vertical: 22.5 / 6.4 * boxSizeV,
      ),
      decoration: BoxDecoration(
        boxShadow: index == _focusedIndex
            ? [
                BoxShadow(
                  blurRadius: 15,
                  color: Color(0xffB1ABEC),
                  offset: Offset(0, 2),
                )
              ]
            : null,
        color: index == _focusedIndex ? Color(0xff90ACFF) : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        border: Border.all(
            color: index == _focusedIndex ? Colors.white : Colors.black),
      ),
      child: Text('${data[index]}'),
    );
  }

  int _focusedIndex = 2;

  @override
  void initState() {
    for (int i = 0; i <= 10; i++) {
      data.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ScrollSnapList(
          onItemFocus: (index) {
            _focusedIndex = index;
            print(_focusedIndex);
          },
          itemBuilder: _buildItemList,
          itemSize: 72 / 3.6 * boxSizeH,
          dynamicItemSize: true,
          onReachEnd: () {
            print('Done');
          },
          updateOnScroll: true,
          initialIndex: _focusedIndex.toDouble(),
          itemCount: data.length,
          dynamicSizeEquation: (dist) {
            return (dist.abs() < 36 / 3.6 * boxSizeH) ? 1 : 0.8;
          },
        ),
        Positioned(
          top: 0,
          child: Transform.rotate(
            angle: pi,
            child: Container(
              // decoration: BoxDecoration(border: Border.all()),
              child: SvgPicture.asset(
                'assets/svg/up arrow.svg',
                color: Color(0xff6C63FF),
                height: 18 / 6.4 * boxSizeV,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            // decoration: BoxDecoration(border: Border.all()),
            child: SvgPicture.asset(
              'assets/svg/up arrow.svg',
              color: Color(0xff6C63FF),
              height: 18 / 6.4 * boxSizeV,
            ),
          ),
        ),
      ],
    );
  }
}