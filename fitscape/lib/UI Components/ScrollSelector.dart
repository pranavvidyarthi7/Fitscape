import 'package:fitscape/Variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class ScrollSelector extends StatefulWidget {
  final int index;
  final Function(int) change;
  final List<int> data;
  final GlobalKey<ScrollSnapListState> gkey;

  const ScrollSelector({this.index, this.change, this.data, this.gkey});
  @override
  _ScrollSelectorState createState() => _ScrollSelectorState();
}

class _ScrollSelectorState extends State<ScrollSelector> {
  Widget _buildItemList(BuildContext context, int index) {
    return index == _focusedIndex
        ? Container(
            margin: EdgeInsets.only(
                left: 6 / 3.6 * boxSizeH,
                right: 6 / 3.6 * boxSizeH,
                top: index % 10 == 0
                    ? 2 / 6.4 * boxSizeV
                    : index % 5 == 0
                        ? 4 / 6.4 * boxSizeV
                        : 12 / 6.4 * boxSizeV,
                bottom: index % 10 == 0
                    ? (16 + 2) / 6.4 * boxSizeV
                    : index % 5 == 0
                        ? (16 + 4) / 6.4 * boxSizeV
                        : (16 + 12) / 6.4 * boxSizeV),
            width: 3 / 3.6 * boxSizeH,
            color: Colors.red)
        : index % 10 == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 6 / 3.6 * boxSizeH,
                      right: 3 / 3.6 * boxSizeH,
                      top: 0,
                      bottom: 2.5 / 6.4 * boxSizeV,
                    ),
                    width: 3 / 3.6 * boxSizeH,
                    height: 65 / 6.4 * boxSizeV,
                    color: Color(0xff8E85E3),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(border: Border.all(width: 0.1)),
                    width: 15 / 3.6 * boxSizeH,
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        index.toString(),
                        style: robotoR10.copyWith(color: Color(0xff8E85E3)),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                margin: EdgeInsets.only(
                    left: 6 / 3.6 * boxSizeH,
                    right: 6 / 3.6 * boxSizeH,
                    top: index % 5 == 0
                        ? 4 / 6.4 * boxSizeV
                        : 12 / 6.4 * boxSizeV,
                    bottom: index % 5 == 0
                        ? (16 + 4) / 6.4 * boxSizeV
                        : (16 + 12) / 6.4 * boxSizeV),
                width: 3 / 3.6 * boxSizeH,
                color: index % 5 == 0 ? Color(0xff8E85E3) : Color(0xff6C63FF),
              );
  }

  int _focusedIndex;
  @override
  void initState() {
    _focusedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.gkey.currentState);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          // decoration: BoxDecoration(border: Border.all()),
          child: SvgPicture.asset(
            'assets/svg/up arrow.svg',
            color: Color(0xff6C63FF),
            height: 18 / 6.4 * boxSizeV,
          ),
        ),
        Container(
          height: 80 / 6.4 * boxSizeV,
          // decoration: BoxDecoration(border: Border.all()),
          child: ScrollSnapList(
            key: widget.gkey,
            focusOnItemTap: true,
            onItemFocus: (index) {
              _focusedIndex = index;
              widget.change(widget.data[_focusedIndex]);
            },
            itemBuilder: _buildItemList,
            itemSize: 15 / 3.6 * boxSizeH,
            dynamicItemSize: true,
            onReachEnd: () {
              print('Done');
            },
            updateOnScroll: true,
            initialIndex: _focusedIndex.toDouble(),
            itemCount: widget.data.length,
            dynamicSizeEquation: (dist) {
              return (dist.abs() < 7.5 / 3.6 * boxSizeH) ? 0.9 : 0.8;
            },
          ),
        ),
      ],
    );
  }
}
