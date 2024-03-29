import 'dart:convert';

import 'package:fitscape/Variables.dart';
import 'package:fitscape/WidgetResizing.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import './UI Components/DashedCircle.dart';

class Logic extends StatefulWidget {
  @override
  _LogicState createState() => _LogicState();
}

class _LogicState extends State<Logic> {
  void method() async {
    // await webScraper.loadWebPage('/tools/calories-burned');
    // webScraper.
    http.Response res;
    // try {
    //   res = await http.post(
    //     Uri.https('nutritiondata.self.com', '/tools/calories-burned'),
    //     body: {
    //       'sex': 'F',
    //       'age': '19',
    //       'height': '122',
    //       'weight': '95',
    //       'weightUnit': 'lbs',
    //       'lifestyleIndex': '0',
    //       'primaryExerciseMinutesPerDay': '120',
    //       'primaryExerciseRelativeScore': '6.0',
    //       'secondaryExerciseMinutesPerDay': '60',
    //       'secondaryExerciseRelativeScore': '12'
    //     },
    //     headers: {"Content-Type": "application/x-www-form-urlencoded"},
    //   );
    // } catch (e) {
    //   print('error $e');
    // }
    // // print(res.body);
    // dom.Document doc = parse(res.body);
    // print((doc.getElementsByClassName('dailyneeds_chart'))[1] //div
    //     .getElementsByTagName('tr')
    //     .last
    //     .children[1] //total always
    //     .text
    //     .trim());
    // List<dom.Element> list =
    //     (doc.getElementsByClassName('dailyneeds_chart'))[1] //div
    //         .getElementsByTagName('tr')[1]
    //         .getElementsByTagName(
    //             'tr'); //tr1 per day regular tr2 excercise tr4 total
    // print(list[0] //per day regular
    //     .children[1]
    //     .text
    //     .trim());
    // print(list[1] //excercise
    //     .children[1]
    //     .text
    //     .trim()
    //     .substring(2));
    // print(list[3] //total
    //     .children[1]
    //     .text
    //     .trim());
    // try {
    //   res = await http.post(
    //     Uri.https('preview.antbits.com',
    //         '/choices_production/calorie_checker/proxy.php'),
    //     body: {"val": Uri.encodeComponent('butter chicken')},
    //     headers: {"Content-Type": "application/x-www-form-urlencoded"},
    //   );
    // } catch (e) {
    //   print("ERROR $e");
    // }
    // print(res.body);
    // print(jsonDecode(res.body)["results"]["products"].length);
    res = await http.get(Uri.https('www.nutracheck.co.uk',
        '/CaloriesIn/Product/Search', {'desc': 'burger'}));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return Scaffold(
      body: Center(
        child: DashedCircle(
          radius: 92 * boxSizeH / 3.6,
          dashes: 20,
          gap: 1.5,
        ),
      ),
    );
  }
}
