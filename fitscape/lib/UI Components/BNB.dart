
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BNB extends StatefulWidget {
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BNB> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Container(
        width: size.width,
        height: 80,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(backgroundColor: Color(0xff7165E3), child: Icon(FontAwesomeIcons.home), elevation: 0.1, onPressed: () {}),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.plus,
             color: currentIndex == 1 ? Color(0xff7165E3) : Color(0xffD2D4E0),
                 ),
                    onPressed: () {
                      setBottomBarIndex(1);
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.running,
                          color: currentIndex == 2 ? Color(0xff7165E3) : Color(0xffD2D4E0),
                      ),
                      onPressed: () {
                        setBottomBarIndex(2);

                      }),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(
                      icon: Icon(
                       FontAwesomeIcons.userAlt,
                        color: currentIndex == 3? Color(0xff7165E3) : Color(0xffD2D4E0),
                      ),
                      onPressed: () {
                        setBottomBarIndex(3);
                      }),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.comments,
                        color: currentIndex == 4 ? Color(0xff7165E3) : Color(0xffD2D4E0),
                      ),
                      onPressed: () {
                        setBottomBarIndex(4);
                      }),
                ],
              ),
            )
          ],
        ),

    );
  }
}
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
