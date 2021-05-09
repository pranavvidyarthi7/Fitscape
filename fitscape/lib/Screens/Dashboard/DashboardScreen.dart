import 'package:fitscape/Screens/Dashboard/CalorieBurntPage.dart';
import 'package:fitscape/Screens/Dashboard/CalorieBurntSteps.dart';
import 'package:fitscape/Screens/Dashboard/DistancePage.dart';
import 'package:fitscape/Screens/Dashboard/StepsPage.dart';
import 'package:fitscape/Screens/Dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../UI Components/BNB.dart';
import '../../Variables.dart';
import '../../WidgetResizing.dart';
class DashboardScreen extends StatefulWidget {
  final int page;
  DashboardScreen({this.page});
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    int _page;
    //1 Steps
    //2 Distance
    //3 Calorie Burn Steps
    //4 calorie Burnt
    //5 Water Intake
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(child: Scaffold(
      body: Container(
            margin: EdgeInsets.only(
          top: 13/6.4*boxSizeV,
          left: 20/3.6 *boxSizeH,
            right: 20/3.6 *boxSizeH,
          ),
            child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child:CalorieBurntSteps(),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),

      ),
      bottomNavigationBar: BNB(),
    ),
    );
  }
}
