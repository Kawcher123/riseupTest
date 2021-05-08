import 'package:flutter/material.dart';
import 'package:riseup_sports_game/Screens/Home/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:riseup_sports_game/api_controller/cricket_api.dart';
import 'package:riseup_sports_game/api_controller/football_api.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CricketApi>(
        create: (_) => CricketApi(),
      ),
      ChangeNotifierProvider<FootballApi>(
        create: (_) => FootballApi(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Play',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
