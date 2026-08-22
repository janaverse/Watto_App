import 'package:flutter/material.dart';
import 'package:my_project/pages/infopage.dart';
import 'package:my_project/pages/quizpage.dart';
import 'package:my_project/pages/resultpage.dart';
import 'package:my_project/pages/welcome.dart';
import 'package:my_project/pages/advicepage.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
initialRoute: '/',
routes: {
'/': (context) => const Welcome(),
'/infopage': (context) => const Infopage(),
'/resultpage': (context) => const Resultpage(),
'/advicepage': (context) => const Advicepage(),
'/quizpage': (context) => const QuizPage(),
},
);
}
}
