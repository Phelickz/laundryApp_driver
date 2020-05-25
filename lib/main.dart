import 'package:flutter/material.dart';
import 'package:laundry_app_drivers/state/authState.dart';
import 'package:laundry_app_drivers/state/userState.dart';
import 'package:provider/provider.dart';
import 'screens/splashScreen.dart';
import 'screens/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationState()),
          ChangeNotifierProvider(create: (_) => UserNotifier()),

      ],
          child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splash()
      ),
    );
  }
}

