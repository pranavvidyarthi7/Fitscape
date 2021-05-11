import 'package:fitscape/Variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitscape/WidgetResizing.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30/6.4*boxSizeV,
                  left: 30/3.6*boxSizeH,
                  right:30/3.6*boxSizeH,
                  bottom: 60/6.4*boxSizeV
                ),
                width: 300/3.6*boxSizeH,
                height: 120/6.4*boxSizeV,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'All progress takes place outside the comfort zone.',
                  ),
                ),
              ),
              SvgPicture.asset('assets/svg/home.svg',height:250/6.4*boxSizeV,),
              Container(
                width: 273/3.6*boxSizeH,
                height: 57/6.4*boxSizeV,
                margin: EdgeInsets.only(
                  top: 35/6.4*boxSizeV,
                  bottom: 20/6.4*boxSizeV,
                  left: 44/3.6*boxSizeH,
                  right: 44/3.6*boxSizeH,
                ),
                decoration: BoxDecoration(
                    color: Color(0xff8E85E3),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: robotoB16.copyWith(color: Colors.white),
                  ),
                ),
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'Already have an account?',
                     style: openSansSB12.copyWith(
                       color: Color(0xff424A6E),
                     ),
                   ),
                   GestureDetector(
                       child: Text(
                         ' Sign in',
                         style: openSansSB12.copyWith(
                           color: Color(0xff8E85E3),
                         ),
                       ),
                       onTap: (){},
                   ),
                 ],
               ),
            ],
          ),
        ),
      ),
    );
  }
}
