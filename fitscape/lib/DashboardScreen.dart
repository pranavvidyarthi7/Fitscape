import 'package:fitscape/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UI Components/BNB.dart';
import 'Variables.dart';
import 'WidgetResizing.dart';
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(child: Scaffold(
      body: Container(
            margin: EdgeInsets.only(
          left: 20/3.6 *boxSizeH,
            right: 20/3.6 *boxSizeH,
          ),
            child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: DashBoard(),
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
