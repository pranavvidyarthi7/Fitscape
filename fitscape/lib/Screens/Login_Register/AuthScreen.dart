import 'package:fitscape/Screens/ProfileBuilders/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../UI Components/ErrorBox.dart';
import '../../Variables.dart';
import '../../WidgetResizing.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  FocusNode _emailFocus, _passFocus, _cPasswordFocus;
  bool _page = true;
  TextEditingController _emailController,
      _passwordController,
      _confirmPasswordController;
  String _email, _password, _confirmPassword;
  bool _obscurePasswordText = true,
      _obscureConfirmPasswordText = true,
      _evalid = true,
      _pvalid = true,
      _cpvalid = true;

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailFocus = FocusNode();
    _passFocus = FocusNode();
    _cPasswordFocus = FocusNode();
    super.initState();
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
                end: Alignment.bottomCenter),
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              SvgPicture.asset(
                'assets/svg/login.svg',
                height: 250 / 6.4 * boxSizeV,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24 * boxSizeV / 6.4,
                  horizontal: 24 * boxSizeH / 3.6,
                ),
                child: GestureDetector(
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
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: GestureDetector(
                  key: ValueKey<bool>(_page),
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 27 * boxSizeV),
                    height: 486 / 6.4 * boxSizeV,
                    width: 100 * boxSizeH,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0)),
                      // border: Border.all(),
                      color: Color(0xCCF6F9FB),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0)),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 34 / 3.6 * boxSizeH,
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 23 / 6.4 * boxSizeV),
                                child: Text(
                                    _page ? 'WELCOME BACK!' : 'CREATE ACCOUNT',
                                    style: josefinSansSB26),
                              ),
                              Container(
                                // decoration: BoxDecoration(border: Border.all()),
                                margin: EdgeInsets.only(
                                    top: _page
                                        ? 15 / 6.4 * boxSizeV
                                        : 2 / 6.4 * boxSizeV,
                                    bottom: _page
                                        ? 10 / 6.4 * boxSizeV
                                        : 6 / 6.4 * boxSizeV),
                                child: TextField(
                                  focusNode: _emailFocus,
                                  controller: _emailController,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    labelStyle: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                    errorText: _evalid ? null : 'Invalid Email',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                        color: Colors.black54,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  onChanged: (email) {
                                    _email = email;
                                    setState(() {
                                      _evalid = validateEmail(_email);
                                    });
                                    print("EVALID: $_evalid");
                                  },
                                  onSubmitted: (email) {
                                    _email = email;
                                    _evalid = validateEmail(_email);
                                    if (_evalid)
                                      FocusScope.of(context)
                                          .requestFocus(_passFocus);
                                    else
                                      FocusScope.of(context)
                                          .requestFocus(_emailFocus);
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: _page
                                        ? 10 / 6.4 * boxSizeV
                                        : 6 / 6.4 * boxSizeV),
                                child: TextField(
                                  focusNode: _passFocus,
                                  controller: _passwordController,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscurePasswordText =
                                              !_obscurePasswordText;
                                        });
                                      },
                                      child: Icon(
                                        _obscurePasswordText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: 'Password',
                                    errorText:
                                        _pvalid ? null : 'Invalid Password',
                                    labelStyle: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                          color: Colors.black54,
                                        )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                  ),
                                  obscureText: _obscurePasswordText,
                                  autocorrect: false,
                                  onChanged: (password) {
                                    _password = password;
                                    setState(() {
                                      _pvalid = validatePassword(_password);
                                    });
                                  },
                                  onSubmitted: (password) {
                                    _password = password;
                                    setState(() {
                                      _pvalid = validatePassword(_password);
                                    });
                                    if (_pvalid && !_page)
                                      FocusScope.of(context)
                                          .requestFocus(_cPasswordFocus);
                                    else if (_pvalid)
                                      print("SUBMITTED");
                                    else
                                      FocusScope.of(context)
                                          .requestFocus(_passFocus);
                                  },
                                ),
                              ),
                              _page
                                  ? Container(
                                      // decoration:
                                      //     BoxDecoration(border: Border.all()),
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        child: Text(
                                          'Forgot Password',
                                          style: robotoSB15.copyWith(
                                              color: Colors.black),
                                        ),
                                        onTap: () {
                                          print(
                                              'Forgot Password Container Clicked');
                                        },
                                      ),
                                    )
                                  : Container(
                                      // decoration:
                                      //     BoxDecoration(border: Border.all()),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 6 / 6.4 * boxSizeV),
                                      child: TextField(
                                        focusNode: _cPasswordFocus,
                                        controller: _confirmPasswordController,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _obscureConfirmPasswordText =
                                                    !_obscureConfirmPasswordText;
                                              });
                                            },
                                            child: Icon(
                                              _obscureConfirmPasswordText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.black,
                                            ),
                                          ),
                                          hintText: 'Confirm Password',
                                          errorText: _cpvalid
                                              ? null
                                              : 'Password and Confrim Password do not match',
                                          labelStyle: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                              borderSide: BorderSide(
                                                color: Colors.black54,
                                              )),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Colors.black,
                                          )),
                                        ),
                                        obscureText:
                                            _obscureConfirmPasswordText,
                                        autocorrect: false,
                                        onChanged: (confirmpassword) {
                                          _confirmPassword = confirmpassword;
                                          _cpvalid =
                                              (_confirmPassword == _password);
                                        },
                                        onSubmitted: (confrimPassword) {
                                          _confirmPassword = confrimPassword;
                                          _cpvalid =
                                              (_confirmPassword == _password);
                                          if (_cpvalid) print('SUBMIITTED');
                                        },
                                      ),
                                    ),
                              GestureDetector(
                                onTap: () {
                                  print('SUBMIT');
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // border: Border.all(),
                                    color: Color(0xff8E85E3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  width: 240 / 3.6 * boxSizeH,
                                  height: 57 / 6.4 * boxSizeV,
                                  margin: EdgeInsets.only(
                                      top: _page
                                          ? 30 / 6.4 * boxSizeV
                                          : 8 / 6.4 * boxSizeV,
                                      bottom: 18 / 6.4 * boxSizeV),
                                  child: Text(
                                    _page ? 'LOGIN' : 'REGISTER',
                                    style: robotoSB13.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 86 / 3.6 * boxSizeH,
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    ' OR ',
                                    style: robotoSB13.copyWith(
                                        color: Colors.black),
                                  ),
                                  Container(
                                    width: 86 / 3.6 * boxSizeH,
                                    height: 1.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 18 / 6.4 * boxSizeV,
                                    bottom: 20 / 6.4 * boxSizeV),
                                width: 200 / 3.6 * boxSizeH,
                                height: 37 / 6.4 * boxSizeV,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black54,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                ),
                                child: GestureDetector(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/googleicon.svg',
                                        height: 20 / 6.4 * boxSizeV,
                                      ),
                                      SizedBox(width: 12 / 3.6 * boxSizeH),
                                      Text(
                                        _page
                                            ? 'Sign In with Google'
                                            : 'Register In with Google',
                                        style: robotoSB13.copyWith(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {});
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _page
                                        ? 'Don\'t have an account?'
                                        : 'Already have an account?',
                                    style: openSansSB12.copyWith(
                                      color: Color(0xff424A6E),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      _page ? ' Register Now' : ' Sign in',
                                      style: openSansSB12.copyWith(
                                        color: Color(0xff8E85E3),
                                      ),
                                    ),
                                    onTap: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                      setState(() {
                                        _page = !_page;
                                        _email = null;
                                        _password = null;
                                        _confirmPassword = null;
                                        _evalid = true;
                                        _pvalid = true;
                                        _cpvalid = true;
                                        _emailController.text = '';
                                        _passwordController.text = '';
                                        _confirmPasswordController.text = '';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
