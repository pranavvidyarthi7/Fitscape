import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Screens/HomeScreen.dart';
import '../Screens/Main App Screens/MainAppScreen.dart';
import '../UI%20Components/ErrorBox.dart';
import '../Services/ServerRequests.dart';
import '../Services/User.dart';
import '../Variables.dart';
import '../WidgetResizing.dart';
import './ProfileBuilders/MainScreen.dart';

class SplashScreen extends StatefulWidget {
  final AppUser appUser;
  final ServerRequests serverRequests;
  SplashScreen({this.appUser, this.serverRequests});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer startTimeout() {
    return Timer(Duration(seconds: 2), changeScreen);
  }

//TODO: change somethings lifestyle and all not here daalne hai abhi
  void changeScreen() async {
    final String token = store.getString('token');
    print('TOKEN : $token ');
    if (token != null) {
      //USER SIGNED IN SERVER
      String json;
      try {
        json = await widget.serverRequests.getUser(token);
      } on PlatformException catch (e) {
        print(e.code);
        //TODO:SERVER DOWN CLOSE APP
        await errorBox(context, e);
      }
      if (json != null) {
        widget.appUser.fromServer(json); //SETTING THE AppUSER IN PROVIDER
        //check profile complete or not
        final jsonObj = jsonDecode(json);
        if (jsonObj['data']['username'] == null) {
          //Email verified
          //Start from Username and Pic
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(
                page: 2,
              ),
            ),
          );
        } else if (jsonObj['data']['username'] != null &&
            jsonObj['data']['gender'] == null) {
          //Email and Username done
          //Start from Gender
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(
                page: 3,
              ),
            ),
          );
        } else if (jsonObj['data']['username'] != null &&
            jsonObj['data']['gender'] != null &&
            jsonObj['data']['phone'] == null) {
          //Email, Username And Gender done
          //Start from Phone
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(
                page: 4,
              ),
            ),
          );
        } else if (jsonObj['data']['username'] != null &&
            jsonObj['data']['gender'] != null &&
            jsonObj['data']['phone'] != null &&
            jsonObj['data']['weight'] == null) {
          //Email, Username, Gender And Phone done
          //Start from Weight
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(
                page: 5,
              ),
            ),
          );
        } else if (jsonObj['data']['username'] != null &&
            jsonObj['data']['gender'] != null &&
            jsonObj['data']['phone'] != null &&
            jsonObj['data']['weight'] != null &&
            jsonObj['data']['height'] == null) {
          //Email, Username, Gender, Phone And Weight done
          //Start from Height
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(
                page: 6,
              ),
            ),
          );
        } else {
          //FULL USER PROFILE COMPLETE
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainAppScreen(), //Dasboard
            ),
          );
        }
      }
    } else {
      //User has no account/Logged out
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100 * boxSizeV,
          width: 100 * boxSizeH,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffF5F9FA), Color(0xffFBFDFD)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          padding: EdgeInsets.symmetric(
              vertical: 24 * boxSizeV / 6.4, horizontal: 24 * boxSizeH / 3.6),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 120 / 6.4 * boxSizeV,
                  bottom: 22 / 6.4 * boxSizeV,
                ),
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                  width: 183 / 3.6 * boxSizeH,
                ),
              ),
              Container(
                child: Text(
                  'FITSCAPE',
                  style: bangersSB62.copyWith(
                    color: Color(0xff2F2E41),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 180 / 6.4 * boxSizeV,
                  bottom: 25 / 6.4 * boxSizeV,
                ),
                child: Text('By Tecnotuners', style: josefinSansSB22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
