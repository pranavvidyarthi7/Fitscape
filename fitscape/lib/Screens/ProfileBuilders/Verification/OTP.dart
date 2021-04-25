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
              onCompleted: (v) {
                widget.change(v);
                if (FocusScope.of(context).hasPrimaryFocus)
                  FocusScope.of(context).unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
