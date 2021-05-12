import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitscape/PageNavigationAnimation/fadeTransition.dart';
import 'package:fitscape/Screens/HomeScreen.dart';
import 'package:fitscape/Screens/Main%20App%20Screens/MainAppScreen.dart';
import 'package:fitscape/Services/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../AuthScreen.dart';
import '../../UI Components/ErrorBox.dart';
import '../../Variables.dart';
import '../../WidgetResizing.dart';
import './Verification/PhoneAuth.dart';
import './Verification/OTP.dart';
import '../ProfileBuilders/gender_page.dart';
import '../ProfileBuilders/height_page.dart';
import '../ProfileBuilders/weight_page.dart';
import '../ProfileBuilders/profilepic_page.dart';

class MainScreen extends StatefulWidget {
  final int page;
  MainScreen({this.page});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _otp = '',
      _name = '',
      _pic = '',
      _gender = '',
      _weight = '',
      _height = '';
  PhoneNumber phone;
  bool validate = false;
  double _percent;
  int _page;
  // 1:otp
  // 2:name and pic
  // 3:male
  // 4:phone
  // 5:weight
  // 6:height
  // 7:age,lifestyle

  Future<bool> phoneauthFirebase(String phone) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () => Future.delayed(Duration(), () => false),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
    FirebaseAuth _auth = FirebaseAuth.instance;
    print('phone  $phone');
    print("START");
    final completer = Completer<bool>();
    await _auth.verifyPhoneNumber(
      timeout: Duration(seconds: 40),
      phoneNumber: phone,
      verificationCompleted: /*VERIFICATION COMPLETES AUTOMATICALLY*/ (PhoneAuthCredential
          phoneAuthCredential) {
        print("WORKING 1");
        if (phoneAuthCredential.token != null) {
          Navigator.pop(context);
          Provider.of<AppUser>(context, listen: false).setPhone(phone);
          completer.complete(true);
          // try {
          //   success = await Provider.of<ServerRequests>(context,
          //           listen: false)
          //       .updateProfile(Provider.of<AppUser>(context, listen: false));
          // } on PlatformException catch (e) {
          //   //SHOW ERROR ON UPDATE PROFILE
          //   await errorBox(context, e);
          //   success = false;
          // }
        } else {
          print("NOT GOOD");
          Navigator.pop(context); //Remove Circular indicator
          errorBox(
            context,
            PlatformException(
                code: 'Something went wrong',
                message: 'Something went wrong. Try again after sometime.',
                details: 'single'),
          );
          completer.complete(false);
        }
        print("CAME HERE");
      },
      verificationFailed: (FirebaseAuthException authException) {
        Navigator.pop(context); //Remove Circular indicator
        errorBox(
          context,
          PlatformException(
              code: 'Something went wrong',
              message: 'Something went wrong. Try again after sometime.',
              details: 'single'),
        );
        completer.complete(false);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        print('SENT');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('TIMEOUT');
        Navigator.pop(context); //ERROR PHONE AUTH NOT DONE TRY AGAIN AFTERWARDS
        errorBox(
          context,
          PlatformException(
              code: 'Error phone not verified',
              message:
                  'OTP not recieved in time.Needs strong network.Try again after sometime',
              details: 'single'),
        );
        completer.complete(false);
      },
    );
    print("WORKING without wait");
    return completer.future;
  }

  Future<bool> phoneVerify() async {
    if (phone != null && phone.parseNumber().length == 10) {
      print("DONE");
      return phoneauthFirebase(phone.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          content: Text(
            'Enter the correct phone number',
            textAlign: TextAlign.center,
          ),
        ),
      );
      return false;
    }
  }

  Future<bool> checkOTP() async {
    // print("Validate: $validate");
    if (validate) {
      // print("OTP: $_otp");
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: () => Future.delayed(Duration(), () => false),
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
      bool success = false;
      // try {
      //   success = await Provider.of<ServerRequests>(context,
      //           listen: false)
      //       .checkOTP(_otp);
      // } on PlatformException catch (e) {
      //   //TODO Impliment RESEND OTP BTN
      //   print(e.code);
      //   await errorBox(context, e);
      //   success = false;
      Navigator.pop(context);
      // }
      // return success; //TODO: Change this
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          content: Text(
            'Enter the complete OTP',
            textAlign: TextAlign.center,
          ),
        ),
      );
      return false;
    }
  }

  Future<bool> updateNameandPic() async {
    print("Validate: $validate");
    if (validate) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: () => Future.delayed(Duration(), () => false),
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
      bool success = false;
      Provider.of<AppUser>(context, listen: false).setName(_name);
      Provider.of<AppUser>(context, listen: false).photoURL = _pic;
      // try {
      //   success = await Provider.of<ServerRequests>(context,
      //           listen: false)
      //       .updateProfile();
      // } on PlatformException catch (e) {
      //   //TODO Impliment RESEND OTP BTN
      //   print(e.code);
      //   await errorBox(context, e);
      //   success = false;
      Navigator.pop(context);
      // }
      // return success;//TODO: Change this
      return true;
    }
    return false;
  }

  Future<bool> updateGender() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () => Future.delayed(Duration(), () => false),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
    bool success = false;
    Provider.of<AppUser>(context, listen: false).setGender(_gender);
    // try {
    //   success = await Provider.of<ServerRequests>(context,
    //           listen: false)
    //       .updateProfile();
    // } on PlatformException catch (e) {
    //   //TODO Impliment RESEND OTP BTN
    //   print(e.code);
    //   await errorBox(context, e);
    //   success = false;
    Navigator.pop(context);
    // }
    // return success;//TODO: Change this
    return true;
  }

  Future<bool> updateHeight() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () => Future.delayed(Duration(), () => false),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
    bool success = false;
    Provider.of<AppUser>(context, listen: false).height = _height;
    // try {
    //   success = await Provider.of<ServerRequests>(context,
    //           listen: false)
    //       .updateProfile();
    // } on PlatformException catch (e) {
    //   //TODO Impliment RESEND OTP BTN
    //   print(e.code);
    //   await errorBox(context, e);
    //   success = false;
    Navigator.pop(context);
    // }
    // return success;//TODO:Change
    return true;
  }

  Future<bool> updateWeight() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () => Future.delayed(Duration(), () => false),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
    bool success = false;
    Provider.of<AppUser>(context, listen: false).weight = _weight;
    // try {
    //   success = await Provider.of<ServerRequests>(context,
    //           listen: false)
    //       .updateProfile();
    // } on PlatformException catch (e) {
    //   //TODO Impliment RESEND OTP BTN
    //   print(e.code);
    //   await errorBox(context, e);
    //   success = false;
    Navigator.pop(context);
    // }
    // return success;//TODO:Change
    return true;
  }

  Future<bool> next() async {
    print("PAGE: $_page");
    switch (_page) {
      case 1:
        return checkOTP();
      case 2:
        return updateNameandPic();
      case 3:
        return updateGender();
      case 4:
        return phoneVerify();
      case 5:
        return updateWeight();
      case 6:
        return updateHeight();
      //TODO: Implement for page 7
      default:
        return true;
    }
  }

  void _percentIncrement() {
    if (_page <= 7) {
      _percent += 1 / 7;
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _page = widget.page ?? 1;
    _percent = (_page - 1) / 7;
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
          body: SingleChildScrollView(
            child: Container(
              // height: 100 * boxSizeV,
              width: 100 * boxSizeH,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffF5F9FA), Color(0xffFBFDFD)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              padding: EdgeInsets.symmetric(
                  vertical: 24 * boxSizeV / 6.4,
                  horizontal: 24 * boxSizeH / 3.6),
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            //Ask for logout
                            bool val = await errorBox(
                              context,
                              PlatformException(
                                code: 'Logout',
                                message: 'Are you sure you want to logout?',
                                details: 'double',
                              ),
                            );
                            print(val);
                            if (val) {
                              store.clear();
                              Navigator.of(context).pushAndRemoveUntil(
                                  fadeTransition(
                                    page: HomeScreen(),
                                    duration: Duration(milliseconds: 800),
                                  ),
                                  (route) => false);
                            }
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 32,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 150 / 3.6 * boxSizeH,
                            padding: EdgeInsets.symmetric(
                              vertical: 0.4 * boxSizeV,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(4 * boxSizeV)),
                            child: LinearPercentIndicator(
                              animateFromLastPercent: true,
                              lineHeight: 1.2 * boxSizeV,
                              curve: Curves.easeInOut,
                              percent: _percent,
                              animation: true,
                              animationDuration: 2000,
                              backgroundColor: Color(0xffE5E5E5),
                              progressColor: Color(0xff8E85E3),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // decoration: BoxDecoration(border: Border.all()),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: _page == 5 || _page == 6 ? 22 / 6.4 * boxSizeV : 0,
                    ),
                    child: _page == 5 || _page == 6
                        ? SvgPicture.asset('assets/svg/box.svg',
                            width: 151 / 3.6 * boxSizeH)
                        : null,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: _page == 5 || _page == 6
                            ? 22 / 6.4 * boxSizeV
                            : 45 / 6.4 * boxSizeV,
                        bottom: 22 / 6.4 * boxSizeV),
                    child: Text(
                      'Step $_page/7',
                      style: robotoSB13.copyWith(color: Color(0xff563FE5)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    constraints: BoxConstraints(
                        minHeight: _page == 5 || _page == 6
                            ? 265 / 6.4 * boxSizeV
                            : 390 / 6.4 * boxSizeV),
                    // decoration: BoxDecoration(border: Border.all()),
                    child: AnimatedSwitcher(
                      duration: Duration(seconds: 1),
                      child: _page == 1
                          ? OTP(change: (v) {
                              _otp = v;
                              if (_otp.length == 6)
                                validate = true;
                              else
                                validate = false;
                            })
                          : _page == 2
                              ? ProfilePicPage(
                                  name: Provider.of<AppUser>(context,
                                          listen: false)
                                      .name,
                                  pic: Provider.of<AppUser>(context,
                                          listen: false)
                                      .photoURL,
                                  change: (name, pic) {
                                    _name = name;
                                    _pic = pic;
                                    if (_name == null || _name == '')
                                      validate = false;
                                    else
                                      validate = true;
                                  })
                              : _page == 3
                                  ? GenderPage(change: (gender) {
                                      _gender = gender ? 'Female' : 'Male';
                                    })
                                  : _page == 4
                                      ? PhoneAuth(
                                          change: (v) {
                                            phone = v;
                                            print(phone);
                                          },
                                        )
                                      : _page == 5
                                          ? WeightPage(change: (v) {
                                              _weight = v;
                                            })
                                          : _page == 6
                                              ? HeightPage(change: (v) {
                                                  _height = v;
                                                })
                                              : Container(), //Age,Lifestyle Page
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // print("TAP");
                      bool condition = false;
                      condition = await next();
                      // print('condition val: $condition');
                      Provider.of<AppUser>(context, listen: false).printUser();
                      if (condition) {
                        setState(() {
                          _percentIncrement();
                          if (_page <= 7) _page++;
                        });
                        if (_page >= 8)
                          //TODO:Add request here
                          Navigator.pushAndRemoveUntil(
                              context,
                              fadeTransition(
                                page: MainAppScreen(),
                                duration: Duration(milliseconds: 800),
                              ),
                              (route) => false);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 241 / 3.6 * boxSizeH,
                      height: 56 / 6.4 * boxSizeV,
                      decoration: BoxDecoration(
                          color: Color(0xff8E85E3),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'Continue',
                        style: robotoB16.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: _page == 1 ? 19 / 6.4 * boxSizeV : 0,
                    ),
                    child: _page == 1
                        ? GestureDetector(
                            onTap: () {
                              print('ok');
                            },
                            child: Text(
                              'Resend OTP',
                              style:
                                  robotoSB15.copyWith(color: Color(0xff563FE5)),
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
