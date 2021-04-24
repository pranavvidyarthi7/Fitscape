import 'package:flutter/material.dart';
import 'package:fitscape/Variables.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePicPage extends StatefulWidget {
  @override
  _ProfilePicPageState createState() => _ProfilePicPageState();
}

class _ProfilePicPageState extends State<ProfilePicPage> {
  final TextEditingController _nameController= TextEditingController();
  String get _name =>_nameController.text;

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
            height: 100/6.4*boxSizeV,
            width: 312/3.6*boxSizeH,
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
                top: 20/6.4*boxSizeV,
                bottom: 25/6.4*boxSizeV,
              ),
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
              Container(
                child: Icon(Icons.camera_alt_sharp,),
                height: 20/6.4*boxSizeV,width: 20/3.6*boxSizeH,),
               SizedBox(width: 10/3.6*boxSizeH),
               Text(
                 'Upload from Phone',
                 style: robotoSB13.copyWith(color:Colors.black ),
               ),
             ],
           ),
            ),
            onTap: (){},
          ),
          Container(
            child: Text(
              'Let Us Know Your Name',
              style: robotoSB23,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20/6.4*boxSizeV,
              bottom: 40/6.4*boxSizeV,
            ),
            child: TextField(
              controller: _nameController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
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
                    )
                ),
              ),

              autocorrect: false,

              onChanged: (value){
                setState(() {
                });
              },
            ),
          ),

        ],
      ),
    );
  }
}
