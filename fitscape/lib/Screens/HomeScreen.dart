import 'package:fitscape/Screens/AuthScreen.dart';
import 'package:fitscape/UI%20Components/ErrorBox.dart';
import 'package:fitscape/Variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../WidgetResizing.dart';
import '../PageNavigationAnimation/fadeTransition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            width: 100 * boxSizeH,
            height: 100 * boxSizeV,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: 30 / 6.4 * boxSizeV, bottom: 50 / 6.4 * boxSizeV),
                  width: 300 / 3.6 * boxSizeH,
                  height: 120 / 6.4 * boxSizeV,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'All progress takes place outside the comfort zone.',
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg/home.svg',
                  height: 250 / 6.4 * boxSizeV,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      fadeTransition(
                          page: AuthScreen(type: false),
                          duration: Duration(milliseconds: 800)),
                    );
                  },
                  child: Container(
                    width: 273 / 3.6 * boxSizeH,
                    height: 57 / 6.4 * boxSizeV,
                    margin: EdgeInsets.only(
                      top: 40 / 6.4 * boxSizeV,
                      bottom: 20 / 6.4 * boxSizeV,
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
                      onTap: () {
                        Navigator.push(
                          context,
                          fadeTransition(
                            page: AuthScreen(type: true),
                            duration: Duration(milliseconds: 800),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
