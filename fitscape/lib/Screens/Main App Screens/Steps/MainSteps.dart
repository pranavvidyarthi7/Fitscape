import 'package:fitscape/Screens/Main%20App%20Screens/Steps/CalorieBurntSteps.dart';
import 'package:fitscape/Screens/Main%20App%20Screens/Steps/DistancePage.dart';
import 'package:fitscape/Screens/Main%20App%20Screens/Steps/StepsPage.dart';
import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
import 'package:fitscape/WidgetResizing.dart';
class MainSteps extends StatefulWidget {
  // 5:Steps
//  5.1: Steps
//  5.2: Cal
//  5.3: Dist
//  5.4: Time
  @override
  _MainStepsState createState() => _MainStepsState();
}
class _MainStepsState extends State<MainSteps> {
  int _page=1;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return Container(
      child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 24 / 3.6 * boxSizeH,
                  height: 24 / 6.4 * boxSizeV,
                  child: Icon(Icons.chevron_left,color:Colors.black,size: 40,)),
              Container(
                alignment: Alignment.center,
                width: 85 / 3.6 * boxSizeH,
                height: 41 / 6.4 * boxSizeV,
                decoration: BoxDecoration(
                    color: Color(0xff8E85E3),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'History',
                  style: robotoB16.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30/6.4*boxSizeV,
          ),
         AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child:_page==1?StepsPage(
              changepage: (v){
                setState(() {
                  _page=v;
                });
              },
            ):
          _page==2?CalorieBurntSteps(

            changepage: (v){
              setState(() {
                _page=v;
              });
            },
          ):
         _page==3?DistancePage(

           changepage: (v){
             setState(() {
               _page=v;
             });
           },
         ):
               Container(),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
