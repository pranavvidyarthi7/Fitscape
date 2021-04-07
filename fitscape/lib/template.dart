import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Variables.dart';
import 'WidgetResizing.dart';

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        SystemUiOverlay.values); //statefull mi yeh line init mai jayegi
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    print('H: $boxSizeV  W: $boxSizeH ');
    return WillPopScope(
      onWillPop: () => Future.delayed(Duration(), () => true),
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
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
