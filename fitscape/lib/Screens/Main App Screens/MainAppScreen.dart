import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../UI%20Components/ErrorBox.dart';
import '../../UI%20Components/BNB.dart';
import '../../Variables.dart';
import '../../WidgetResizing.dart';
import './Steps/MainSteps.dart';
import './CalorieBurntPage.dart';
import './WaterIntakePage.dart';
import './dashboard_page.dart';

class MainAppScreen extends StatefulWidget {
  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
//Page
// 1:Dashboard Cards
// 2:Calorie Intake
// 3:Calorie Burnt
// 4:Water Intake
// 5:Steps
//  5.1: Steps
//  5.2: Cal
//  5.3: Dist
//  5.4: Time
// 6:Events
// 7:More
//Navigating Screens maybe
// Profile
// Chat
  int _page = 1;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return WillPopScope(
      //EXIT APP ERROR
      onWillPop: () async {
        bool val = await errorBox(
          context,
          PlatformException(
            code: 'Logout & Exit',
            message: 'Are you sure you want to logout and exit?',
            details: 'double',
          ),
        );
        print(val);
        if (val) SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(
              top: 13 / 6.4 * boxSizeV,
              left: 20 / 3.6 * boxSizeH,
              right: 20 / 3.6 * boxSizeH,
            ),
            child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _page == 1
                  ? DashBoard(
                      change: (v) {
                        setState(() {
                          _page = v;
                        });
                      },
                    )
                  : _page == 2
                      ? Container()
                      : _page == 3
                          ? CalorieBurntPage()
                          : _page == 4
                              ? WaterIntakePage()
                              : _page == 5
                                  ? MainSteps()
                                  : _page == 6
                                      ? Container()
                                      : Container(),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
          bottomNavigationBar: BNB(),
        ),
      ),
    );
  }
}
