import 'package:fitscape/Screens/Login_Register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fitscape/WidgetResizing.dart';
import 'package:fitscape/Variables.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({this.setEmail,this.setPassword,this.setConfirmPassword,this.changePage});
  final Function (String) setEmail;
  final Function (String) setPassword;
  final Function (String) setConfirmPassword;
  final Function  changePage;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmpasswordController=TextEditingController();
  String get _email =>_emailController.text;
  String get _password =>_passwordController.text;
  String get _confirmpassword => _confirmpasswordController.text;
  bool _submitted=false;
  bool _obscurePasswordText=true;
  bool _obscureConfirmPasswordText=true;
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
  bool validatePassword(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
     return //SafeArea(
    //   child: Scaffold(
    //     body: Container(
    //       height: 100 * boxSizeV,
    //       width: 100 * boxSizeH,
    //       child: Stack(
    //         alignment: Alignment.topCenter,
    //         children: [
    //           Container(
    //             height: 250/6.4*boxSizeV,
    //             width: 360/3.6*boxSizeH,
    //             child: SvgPicture.asset('assets/svg/login.svg'),
    //           ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top:24*boxSizeV),
                  height: 486/6.4 *boxSizeV,
                  width: 360/3.6 *boxSizeH,
                  decoration: BoxDecoration(
                    color:Color(0x95F6F9FB),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight:Radius.circular(50.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left:34/3.6*boxSizeH,right:34/3.6*boxSizeH ),
                    child: Column(
                      children: [

                        Container(
                          margin: EdgeInsets.only(top: 23/6.4*boxSizeV),
                          child: Text(
                            'CREATE ACCOUNT',
                            style: GoogleFonts.josefinSans(
                                fontSize: 26.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:25/6.4*boxSizeV),
                          child: TextField(
                            controller: _emailController,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: 'Email',
                              errorText:  _submitted && !validateEmail(_email)?'Invalid Email':null,
                                labelStyle: TextStyle(
                                  fontSize: 20.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                      color: Colors.black54,
                                    )
                                ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )
                              ),

                            ),

                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            onChanged: (email) => _updateState(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12/6.4*boxSizeV),
                          child: TextField(
                            controller: _passwordController,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              suffixIcon:GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _obscurePasswordText=_obscurePasswordText?false:true;
                                  });
                                },
                                child: Icon(_obscurePasswordText?Icons.visibility:Icons.visibility_off,
                                  color: Colors.black,
                                 ),
                              ) ,
                              hintText: 'Password',
                              errorText: _submitted &&!validatePassword(_password)?'Invalid Password':null,
                              labelStyle: TextStyle(
                                fontSize: 20.0,

                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                  )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )
                              ),
                            ),
                            obscureText: _obscurePasswordText,
                            autocorrect: false,
                            onChanged: (password)=>_updateState(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12/6.4*boxSizeV),
                          child: TextField(
                            controller: _confirmpasswordController,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              suffixIcon:GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _obscureConfirmPasswordText=_obscureConfirmPasswordText?false:true;
                                  });
                                },
                                child: Icon(_obscureConfirmPasswordText?Icons.visibility:Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ) ,
                              hintText: 'Confirm Password',
                              errorText: _submitted && _password!=_confirmpassword?'Does\'t match':null,
                              labelStyle: TextStyle(
                                fontSize: 20.0,

                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                  )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )
                              ),
                            ),
                            obscureText: _obscureConfirmPasswordText,
                            autocorrect: false,
                            onChanged: (confirmpassword)=>_updateState(),
                          ),
                        ),
                        GestureDetector(child: Container(
                          margin: EdgeInsets.only(top: 15/6.4*boxSizeV),
                          width: 240/3.6 *boxSizeH,
                          height: 57/6.4 *boxSizeV,
                          decoration: BoxDecoration(
                            color: Color(0xff8E85E3),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 19/6.4*boxSizeV),
                            child: Text(
                              'REGISTER',
                              style: robotoSB13.copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                          onTap: (){
                          print('Register Button Clicked');
                          setState(() {
                            _submitted=true;
                          });
                          },
                        ),
                        SizedBox(height: 18/6.4*boxSizeV),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 86/3.6*boxSizeH,
                              height: 1.0,
                              color: Colors.black,
                            ),
                            Text(
                              ' OR ',
                              style: robotoSB13.copyWith(color: Colors.black),
                            ),
                            Container(
                              width: 86/3.6*boxSizeH,
                              height: 1.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(top:18/6.4*boxSizeV  ),
                            width: 200/3.6 *boxSizeH,
                            height: 37/6.4 *boxSizeV,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black54,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50.0),),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/googleicon.svg',height: 20/6.4*boxSizeV,width: 20/3.6*boxSizeH),
                                SizedBox(width: 10/3.6*boxSizeH),
                                Text(
                                  'Register with Google',
                                  style: robotoSB13.copyWith(color:Colors.black ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26/6.4*boxSizeV,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: GoogleFonts.openSans(
                                fontSize: 16.0,
                                color: Color(0xff424A6E),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                ' Sign in',
                                style: GoogleFonts.openSans(
                                  fontSize: 16.0,
                                  color: Color(0xff8E85E3),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onTap: widget.changePage,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

    );
  }
  _updateState(){
    print('email: $_email, password; $_password, confirm password $_confirmpassword');
    setState(() {
    });
  }
}
