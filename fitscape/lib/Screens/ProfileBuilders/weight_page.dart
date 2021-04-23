import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {

  int lbsBorderColor= 0xffFFFFFF;
  int kgBorderColor=0xffC4C4C4;
  int lbsBoxColor=0xff8E85E3;
  int kgBoxColor=0xffFFFFFF;
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
              width: 70/3.6*boxSizeH,
              height: 40/6.4*boxSizeV,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(lbsBorderColor),
                  ),
                  color: Color(lbsBoxColor),
                  borderRadius: BorderRadius.circular(10),
                boxShadow:[BoxShadow(blurRadius: 15,color: Color(lbsBoxColor),offset: Offset(1,3))],),
              child: Text(
                'lbs',
                style: robotoB16.copyWith(color: lbsBoxColor==0xff8E85E3?Color(0xffFFFFFF):Color(0xff000000)),
              ),
            ),
              onTap: (){
                setState(() {

                  lbsBorderColor=lbsBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                  kgBorderColor=kgBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                  lbsBoxColor=lbsBoxColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;
                  kgBoxColor=kgBoxColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;

                });
              }
          ),
          SizedBox(
            width: 20/3.6*boxSizeH,
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 70/3.6*boxSizeH,
              height: 40/6.4*boxSizeV,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(kgBorderColor),
                  ),
                  color: Color(kgBoxColor),
                  borderRadius: BorderRadius.circular(10),
                boxShadow:[BoxShadow(blurRadius: 15,color: Color(kgBoxColor),offset: Offset(1,3))],),
              child: Text(
                'Kg',
                style: robotoB16.copyWith(color: kgBoxColor==0xff8E85E3?Color(0xffFFFFFF):Color(0xff000000)),
              ),
            ),
              onTap: (){
                setState(() {

                  lbsBorderColor=lbsBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                  kgBorderColor=kgBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                  lbsBoxColor=lbsBoxColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;
                  kgBoxColor=kgBoxColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;

                });
              }
          ),
        ],
      ),
    ),

        ],
      ),
    );
  }
}