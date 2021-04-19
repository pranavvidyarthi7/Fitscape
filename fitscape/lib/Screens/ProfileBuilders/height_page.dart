import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
class HeightPage extends StatefulWidget {
  @override
  _HeightPageState createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {

  int cmBorderColor= 0xffFFFFFF;
  int ftBorderColor=0xffC4C4C4;
  int cmBoxColor=0xff8E85E3;
  int ftBoxColor=0xffFFFFFF;
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
                      width: 70/3.6*boxSizeH,
                      height: 40/6.4*boxSizeV,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(cmBorderColor),
                        ),
                        color: Color(cmBoxColor),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[BoxShadow(blurRadius: 15,color: Color(cmBoxColor),offset: Offset(1,3))],),
                      child: Text(
                        'cm',
                        style: robotoB16.copyWith(color: cmBoxColor==0xff8E85E3?Color(0xffFFFFFF):Color(0xff000000)),
                      ),
                    ),
                    onTap: (){
                      setState(() {

                        cmBorderColor=cmBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                        ftBorderColor=ftBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                        cmBoxColor=cmBoxColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;
                        ftBoxColor=ftBoxColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;

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
                          color: Color(ftBorderColor),
                        ),
                        color: Color(ftBoxColor),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[BoxShadow(blurRadius: 15,color: Color(ftBoxColor),offset: Offset(1,3))],),
                      child: Text(
                        'ft',
                        style: robotoB16.copyWith(color: ftBoxColor==0xff8E85E3?Color(0xffFFFFFF):Color(0xff000000)),
                      ),
                    ),
                    onTap: (){
                      setState(() {


                        cmBorderColor=cmBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                        ftBorderColor=ftBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                        cmBoxColor=cmBoxColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;
                        ftBoxColor=ftBoxColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;


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