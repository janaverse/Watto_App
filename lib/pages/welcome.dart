import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
const Welcome({super.key});

@override

Widget build(BuildContext context) {
return SafeArea(
child: Scaffold(
body: OrientationBuilder(
builder: (context, orientation) {
return Container(
height: double.infinity,
width: double.infinity,
color: const Color.fromARGB(255, 6, 3, 27),
child: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24.0),
child: Column(
children: [
const SizedBox(height: 70),
ClipOval(
child: Image.asset(
"assets/Watto.png",
width: 170,
height: 170,
fit: BoxFit.cover,
),
),
const SizedBox(height: 60),
Text(
"Let’s Get",
style: TextStyle(
fontSize: 36,
fontWeight: FontWeight.bold,
color: Colors.white,
fontFamily: "myfont",
),
textAlign: TextAlign.center,
),
Text(
"Started!",
style: TextStyle(
fontSize: 36,
fontWeight: FontWeight.bold,
color: Color(0xFFFF1BB3),
fontFamily: "myfont",
),
textAlign: TextAlign.center,
),
const SizedBox(height: 50),
const Text(
"تطبيق ذكي لحساب استهلاك الكهرباء وعرض التكلفة ",
style: TextStyle(
fontSize: 17,
color: Colors.white,
fontFamily: "myfont2",
),
textAlign: TextAlign.center,
),
const SizedBox(height: 90),
ElevatedButton(
onPressed: () {
Navigator.pushNamed(context, '/infopage');
},
style: ElevatedButton.styleFrom(
padding: EdgeInsets.zero,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(30),
),
backgroundColor: Colors.transparent,
elevation: 0,
),
child: Container(
padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 7),
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [
Color(0xFFFF1BB3),
Color(0xFFC451C9),
],
),
borderRadius: BorderRadius.circular(30),
),
child: const Text(
"إبدأ",
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
color: Colors.white,
fontFamily: "myfont2",
),
),
),
),
const SizedBox(height: 40),
],
),
),
),
);
},
),
),
);
}
}
