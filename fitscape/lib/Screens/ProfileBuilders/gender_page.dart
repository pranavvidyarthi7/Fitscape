import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String maleAssetName='maleU';
  String femaleAssetName='femaleS';
  int femaleBorderColor= 0xffFFFFFF;
  int maleBorderColor=0xffC4C4C4;
  int femaleBoxShadowColor=0xff8E85E3;
  int maleBoxShadowColor=0xffFFFFFF;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(border: Border.all()),
            child: Text(
              'Which one are you?',
              style: robotoSB23,
            ),
          ),
         Container(
         margin: EdgeInsets.only(
        top: 30 / 6.4 * boxSizeV,
        bottom: 30 / 6.4 * boxSizeV,
         ),
           child: Row(
             children: [
               GestureDetector(
                 child: Container(
                   width: 145/3.6*boxSizeH ,
                   height: 190/6.4*boxSizeV,
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Color(femaleBorderColor),
                     ),
                  borderRadius: BorderRadius.all(
                     Radius.circular(25.0) //
                   ),
                     boxShadow:[BoxShadow(blurRadius: 15,color: Color(femaleBoxShadowColor),offset: Offset(1,3))],
                 ),
                   child: SvgPicture.asset('assets/svg/$femaleAssetName.svg',
                     //   width: 144 / 3.6 * boxSizeH,
                     // height: 195/6.4*boxSizeV,
                     fit: BoxFit.fill,
                   ),
                 ),
                 onTap: (){
                   setState(() {
                     femaleAssetName=femaleAssetName=='femaleS'?'femaleU':'femaleS';
                     maleAssetName=maleAssetName=='maleS'?'maleU':'maleS';
                     femaleBorderColor=femaleBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                     maleBorderColor=maleBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                     femaleBoxShadowColor=femaleBoxShadowColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;
                     maleBoxShadowColor=maleBoxShadowColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;

                   });
                 }
               ),
               SizedBox(
                 width: 20/3.6*boxSizeH,
               ),
               GestureDetector(
                 child: Container(
                   width: 145/3.6*boxSizeH ,
                   height: 190/6.4*boxSizeV,
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Color(maleBorderColor),
                     ),
                     borderRadius: BorderRadius.all(
                         Radius.circular(25.0) //
                     ),
                        boxShadow: [BoxShadow(blurRadius: 20,color: Color(maleBoxShadowColor),offset: Offset(1,3))]
                   ),
                   child: SvgPicture.asset('assets/svg/$maleAssetName.svg',
                       // width: 144 / 3.6 * boxSizeH,
                       // height: 190/6.4*boxSizeV,
                     fit: BoxFit.fill,
                   ),

                   ),
                   onTap: (){
                   setState(() {
                     maleAssetName=maleAssetName=='maleS'?'maleU':'maleS';
                     femaleAssetName=femaleAssetName=='femaleS'?'femaleU':'femaleS';
                     femaleBorderColor=femaleBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                     maleBorderColor=maleBorderColor==0xffFFFFFF?0xffC4C4C4:0xffFFFFFF;
                     femaleBoxShadowColor=femaleBoxShadowColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;
                     maleBoxShadowColor=maleBoxShadowColor==0xffFFFFFF?0xff8E85E3:0xffFFFFFF;
                   });
                   }
               ),
             ],
           ),
         ),
          Text(
            ' To give you a customized  ',
            style: GoogleFonts.openSans(
              fontSize: 15.0,
             color: Colors.black,
             fontWeight: FontWeight.w600,
            ),
          ),
          Text(
         'experience we need to know your ',
           style: GoogleFonts.openSans(
           fontSize: 15.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
           ),
          ),
          Text(
            'gender',
            style: GoogleFonts.openSans(
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
