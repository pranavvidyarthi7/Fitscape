import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../UI%20Components/PicScroller.dart';

class ProfilePicPage extends StatefulWidget {
  final Function(String, String) change;
  ProfilePicPage({this.change});
  @override
  _ProfilePicPageState createState() => _ProfilePicPageState();
}

class _ProfilePicPageState extends State<ProfilePicPage> {
  TextEditingController _nameController;
  String _pic = '';
  FocusNode _node;
  bool valid = true;
  @override
  void initState() {
    _nameController = TextEditingController();
    _node = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'Choose Your Profile Picture',
              style: robotoSB23,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15 / 6.4 * boxSizeV,
              bottom: 15 / 6.4 * boxSizeV,
            ),
            height: 100 / 6.4 * boxSizeV,
            child: PicScroller(),
          ),
          Text(
            'You can select from above emoji or',
            style: GoogleFonts.openSans(
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(
                top: 20 / 6.4 * boxSizeV,
                bottom: 25 / 6.4 * boxSizeV,
              ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(
                      Icons.camera_alt_sharp,
                    ),
                    height: 20 / 6.4 * boxSizeV,
                    width: 20 / 3.6 * boxSizeH,
                  ),
                  SizedBox(width: 10 / 3.6 * boxSizeH),
                  Text(
                    'Upload from Phone',
                    style: robotoSB13.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          Container(
            child: Text(
              'Let Us Know Your Name',
              style: robotoSB23,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20 / 6.4 * boxSizeV,
              bottom: 40 / 6.4 * boxSizeV,
            ),
            child: TextField(
              focusNode: _node,
              controller: _nameController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                errorText: valid ? null : 'Please enter your name',
                hintText: 'Your Name Here!!',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                )),
              ),
              autocorrect: false,
              onChanged: (v) {
                widget.change(v, _pic);
                setState(() {
                  valid = (v != null && v != '');
                });
              },
              onSubmitted: (v) {
                widget.change(v, _pic);
                setState(() {
                  valid = (v != null && v != '');
                });
                if (!valid) {
                  FocusScope.of(context).requestFocus(_node);
                } else if (FocusScope.of(context).hasPrimaryFocus)
                  FocusScope.of(context).unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
