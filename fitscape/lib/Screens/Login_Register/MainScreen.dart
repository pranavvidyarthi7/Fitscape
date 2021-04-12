import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Variables.dart';
import '../../WidgetResizing.dart';
import 'login_page.dart';
import 'register_page.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool _page=true;
  String _email='';
  String _password='';
  String _confirmPassword='';

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
        child: Stack(
        alignment: Alignment.topCenter,
        children: [
        Container(
        height: 250/6.4*boxSizeV,
        width: 360/3.6*boxSizeH,
        child: SvgPicture.asset('assets/svg/login.svg'),
    ),

          AnimatedSwitcher( duration: Duration(seconds: 1),
            child:_page==true?LoginPage(
              setEmail: (v){
                _email=v;
              },
              setPassword: (v){
                _password=v;
              },
              changePage: (){
                setState(() {
                  _page=!_page;
                });
              },
            ):RegisterPage(
              setEmail: (v){
                _email=v;
              },
              setPassword: (v){
                _password=v;
              },
              setConfirmPassword: (v){
                _confirmPassword=v;
              },
              changePage: (){
                setState(() {
                  _page=!_page;
                });
              },

            ),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            ),
          ]
    ),
    ),
        ),
    );
  }
}
