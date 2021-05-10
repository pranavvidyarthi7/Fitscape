import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './Screens/SplashScreen.dart';
import './Variables.dart';
import 'Services/ServerRequests.dart';
import 'Services/User.dart';
import 'Services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  store = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // return MaterialApp(
    //   home: DashboardScreen(),
    // );
    return MultiProvider(
      providers: [
        Provider<ServerRequests>(
          create: (context) => ServerRequests(),
        ),
        Provider<Auth>(
          create: (context) => Auth(),
        ),
        Provider<AppUser>(
          create: (context) => AppUser(),
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
