import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitscape/Screens/ProfileBuilders/gender_page.dart';
import 'package:fitscape/Screens/ProfileBuilders/height_page.dart';
import 'package:fitscape/Screens/ProfileBuilders/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../ErrorBox.dart';
import '../../Variables.dart';
import '../../WidgetResizing.dart';
import './Verification/PhoneAuth.dart';
import './Verification/OTP.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _otp = '';
  bool validate = false;

  PhoneNumber phone;
  Future<void> phoneauthFirebase(String phone) async {
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
    await _auth.verifyPhoneNumber(
        timeout: Duration(seconds: 40),
        phoneNumber: phone,
        verificationCompleted: /*VERIFICATION COMPLETES AUTOMATICALLY*/ (PhoneAuthCredential
            phoneAuthCredential) async {
          if (phoneAuthCredential.token != null) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1),
                content: Text(
                  'SUCCESS',
                  textAlign: TextAlign.center,
                ),
              ),
            );
            // Provider.of<AppUser>(context, listen: false).setPhone(phone);
            // bool success;
            // try {
            //   success = await Provider.of<ServerRequests>(context,
            //           listen: false)
            //       .updateProfile(Provider.of<AppUser>(context, listen: false));
            // } on PlatformException catch (e) {
            //   //SHOW ERROR ON UPDATE PROFILE
            //   await errorBox(context, e);
            //   success = false;
            // }
            // if (success) {
            //   Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(
            //       builder: (context) => Intro1(),
            //     ),
            //     (_) => false,
            //   );
            // }
          } else {
            Navigator.pop(context); //Remove Circular indicator
            await errorBox(
              context,
              PlatformException(
                  code: 'Something went wrong',
                  message: 'Something went wrong. Try again after sometime.',
                  details: 'single'),
            );
          }
        },
        verificationFailed: (FirebaseAuthException authException) async {
          Navigator.pop(context); //Remove Circular indicator
          await errorBox(
            context,
            PlatformException(
                code: 'Something went wrong',
                message: 'Something went wrong. Try again after sometime.',
                details: 'single'),
          );
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          print('SENT');
        },
        codeAutoRetrievalTimeout: (String verificationId) async {
          print('TIMEOUT');
          Navigator.pop(
              context); //ERROR PHONE AUTH NOT DONE TRY AGAIN AFTERWARDS
          await errorBox(
            context,
            PlatformException(
                code: 'Error phone not verified',
                message:
                    'OTP not recieved in time.Needs strong network.Try again after sometime',
                details: 'single'),
          );
        });
  }

  Future<void> phoneVerify() async {
    if (phone != null && phone.parseNumber().length == 10) {
      await phoneauthFirebase(phone.toString());
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
    }
  }

  double _percent = 0;
  int _page = 5; //TODO: CHANGE THIS PAGE TO SEE UR PAGE
  // 1:otp
  // 2:male
  // 3:phone
  // 4:weight
  // 5:height
  void _percentIncrement(double value) {
    setState(() {
      _percent += 1 / 4;
    });
  }

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
      // print('EXIT APP');
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
        if (val) {
          // await Provider.of<Auth>(context, listen: false).logOut();
          // store.clear();
          // exit(0);
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: 100 * boxSizeV,
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
                              print("BACK");
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
                              // if (val) {
                              //   await Provider.of<Auth>(context, listen: false)
                              //       .logOut();
                              //   store.clear();
                              //   Navigator.of(context).pushAndRemoveUntil(
                              //       MaterialPageRoute(
                              //         builder: (context) => LoginPage(),
                              //       ),
                              //       (route) => false);
                              // }
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 32,
                            )),
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
                              percent: .5,
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
                      top: _page == 4 || _page == 5 ? 22 / 6.4 * boxSizeV : 0,
                    ),
                    child: _page == 4 || _page == 5
                        ? SvgPicture.asset('assets/svg/box.svg',
                            width: 151 / 3.6 * boxSizeH)
                        : null,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: _page == 4 || _page == 5
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
                        minHeight: _page == 4 || _page == 5
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
                              ? GenderPage(
                                  // child: Text("GENDER"),
                                ) //TODO GENDER Page here
                              : _page == 3
                                  ? PhoneAuth(
                                      change: (v) {
                                        phone = v;
                                        print(phone);
                                      },
                                      verify: () {
                                        phoneVerify();
                                      },
                                    )
                                  : _page == 4
                                      ? WeightPage()
                                      : HeightPage(),
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_page == 3) {
                        phoneVerify();
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
