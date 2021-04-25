import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../Variables.dart';

class PhoneAuth extends StatefulWidget {
  final Function(PhoneNumber) change;
  PhoneAuth({this.change});
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController;
  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(border: Border.all()),
            child: Text(
              'Verify your Mobile Number',
              style: robotoSB23,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 25 / 6.4 * boxSizeV,
              bottom: 25 / 6.4 * boxSizeV,
            ),
            child: SvgPicture.asset('assets/svg/phone.svg',
                width: 110 / 3.6 * boxSizeH),
          ),
          RichText(
            maxLines: 2,
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'We will send you a ',
              style: openSansSB15.copyWith(color: Color(0x80000000)),
              children: [
                TextSpan(
                  text: 'One Time Password',
                  style: openSansB15.copyWith(color: Colors.black),
                ),
                TextSpan(text: ' on this mobile number'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 34 / 6.4 * boxSizeV),
            padding: EdgeInsets.only(right: 15 * boxSizeH),
            child: InternationalPhoneNumberInput(
              textFieldController: phoneController,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              // selectorTextStyle: josefinSansSB20.copyWith(color: Colors.black),
              autoFocus: true,
              keyboardAction: TextInputAction.done,
              // textStyle: josefinSansSB20.copyWith(color: Colors.black),
              inputDecoration: InputDecoration(
                  border: UnderlineInputBorder(), hintText: 'Phone Number'),
              onInputChanged: widget.change,
              onFieldSubmitted: (n) {
                if (FocusScope.of(context).hasPrimaryFocus)
                  FocusScope.of(context).unfocus();
              },
              countries: ['IN'],
            ),
          ),
        ],
      ),
    );
  }
}
