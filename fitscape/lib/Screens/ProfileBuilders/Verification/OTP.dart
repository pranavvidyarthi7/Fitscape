import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';

import '../../../Variables.dart';

//TODO: ADD BTN FOR RESEND OTP
class OTP extends StatefulWidget {
  final Function(String) change;
  OTP({this.change});
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(border: Border.all()),
            child: Text(
              'Verify OTP',
              style: robotoSB23,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 25 / 6.4 * boxSizeV,
              bottom: 25 / 6.4 * boxSizeV,
            ),
            child: SvgPicture.asset('assets/svg/otp.svg',
                width: 110 / 3.6 * boxSizeH),
          ),
          Text(
            'Enter the OTP sent to',
            style: openSansSB19.copyWith(color: Color(0x80000000)),
          ),
          Text(
            'abcd@gmail.com',
            style: openSansSB19.copyWith(fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 34 / 6.4 * boxSizeV),
            child: OTPTextField(
              keyboardType: TextInputType.text,
              width: 300 * boxSizeH / 3.6,
              fieldWidth: 40 * boxSizeH / 3.6,
              style: robotoSB23,
              length: 6,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              onChanged: widget.change,
              onCompleted: widget.change,
            ),
          ),
          // GestureDetector(
          //   onTap: () async {
          //     print(_otp);
          //     if (validate) {
          //       showDialog(
          //         barrierDismissible: false,
          //         context: context,
          //         builder: (context) => WillPopScope(
          //           onWillPop: () =>
          //               Future.delayed(Duration(), () => false),
          //           child: Dialog(
          //             backgroundColor: Colors.transparent,
          //             elevation: 0,
          //             child: Center(
          //               child: CircularProgressIndicator(),
          //             ),
          //           ),
          //         ),
          //       );
          //       bool success;
          //       // try {
          //       //   success = await Provider.of<ServerRequests>(context,
          //       //           listen: false)
          //       //       .changeOTP(_otp);
          //       // } on PlatformException catch (e) {
          //       //   //TODO Impliment RESEND OTP BTN
          //       //   print(e.code);
          //       //   await errorBox(context, e);
          //       //   success = false;
          //       //   Navigator.pop(context);
          //       // }
          //       // if (success) {
          //       //   Navigator.of(context).pushReplacement(
          //       //     MaterialPageRoute(
          //       //       builder: (context) => OTP1(),
          //       //     ),
          //       //   );
          //       // }
          //     } else {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           duration: Duration(seconds: 1),
          //           content: Text(
          //             'Enter the complete OTP',
          //             textAlign: TextAlign.center,
          //           ),
          //         ),
          //       );
          //     }
          //   },
          //   child: Container(
          //     alignment: Alignment.center,
          //     width: 291 * boxSizeH / 3.6,
          //     height: 58 * boxSizeV / 6.4,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(14)),
          //       color: Colors.black,
          //     ),
          //     child: Text(
          //       'Verify and Proceed',
          //       // style: josefinSansR18.copyWith(color: Colors.white),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
