import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './Variables.dart';

Future<bool> errorBox(BuildContext context, PlatformException e) async {
  bool val = false;
  final Map<String, Map<String, List<Widget>>> errorMap = {
    'double': {
      'actions': [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6 * boxSizeH / 3.6),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(0xffFFCB00),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Text(
              "Yes",
              style: josefinSansR10.copyWith(color: Colors.white),
            ),
            onPressed: () {
              val = true;
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6 * boxSizeH / 3.6),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(0xffFFCB00),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child:
                Text("No", style: josefinSansR10.copyWith(color: Colors.white)),
            onPressed: () {
              val = false;
              Navigator.of(context).pop();
            },
          ),
        ),
      ]
    },
    'single': {
      'actions': [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6 * boxSizeH / 3.6),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(0xffFFCB00),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Text(
              "OK",
              style: josefinSansR10.copyWith(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ]
    },
  };

  await showDialog(
    barrierColor: Colors.black12,
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 48,
        insetPadding: EdgeInsets.symmetric(
          horizontal: 18 * boxSizeH / 3.6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 12 * boxSizeV / 6.4,
            horizontal: 30 * boxSizeH / 3.6,
          ),
          height: 257 * boxSizeV / 6.4,
          width: 334 * boxSizeH / 3.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                // decoration: BoxDecoration(border: Border.all()),
                height: 130 * boxSizeV / 6.4,
                width: 180 * boxSizeH / 3.6,
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    e.code == 'Exit' || e.code == 'Logout & Exit'
                        ? 'assets/quit1.png'
                        : e.code == 'Logout'
                            ? 'assets/error.png'
                            : 'assets/error.png',
                  ),
                ),
              ),
              Text(
                e.code,
                style: josefinSansSB18.copyWith(
                  color: Color(0xff0D2C34),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                e.message,
                style: josefinSansSB10.copyWith(
                  color: Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: errorMap[e.details]['actions'],
              ),
            ],
          ),
        ),
      );
    },
  );
  print('val : $val');
  return val;
}
