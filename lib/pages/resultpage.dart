import 'package:flutter/material.dart';

class Resultpage extends StatelessWidget {
const Resultpage({super.key});

@override
Widget build(BuildContext context) {
final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

final monthlyConsumption = args?['monthlyConsumption'] ?? '';
final costDollar = args?['costDollar'] ?? '';
final costRiyal = args?['costRiyal'] ?? '';

return SafeArea(
child: Scaffold(
body: OrientationBuilder(
builder: (context, orientation) {
return Container(
width: double.infinity,
height: double.infinity,
color: const Color.fromARGB(255, 6, 3, 27),
child: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24),
child: Column(
children: [
const SizedBox(height: 30),
Row(
children: [
IconButton(
icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
onPressed: () {
Navigator.pushNamed(context, '/infopage');
},
),
],
),
const SizedBox(height: 30),
const Text(
"النتائج",
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.bold,
color: Colors.white,
fontFamily: "myfont2",
),
),
const SizedBox(height: 60),
labeledTextField("الاستهلاك الشهري بالكيلو واط", monthlyConsumption),
const SizedBox(height: 25),
labeledTextField("التكلفة بالدولار", costDollar),
const SizedBox(height: 25),
labeledTextField("التكلفة بالريال", costRiyal),
const SizedBox(height: 40),
SizedBox(
width: double.infinity,
height: 50,
child: ElevatedButton(
onPressed: () {
Navigator.pushNamed(context, '/infopage');
},
style: ElevatedButton.styleFrom(
padding: EdgeInsets.zero,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
),
backgroundColor: Colors.transparent,
elevation: 0,
),
child: Container(
alignment: Alignment.center,
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [
Color(0xFFFF1BB3),
Color(0xFFC451C9),
],
),
borderRadius: BorderRadius.circular(12),
),
child: const Text(
"حساب جهاز آخر",
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
color: Colors.white,
fontFamily: "myfont2",
),
),
),
),
),
const SizedBox(height: 20),
GestureDetector(
onTap: () {
Navigator.pushNamed(context, '/advicepage');
},
child: Column(
children: const [
Text(
"تريد نصائح لتوفير الكهرباء ؟",
style: TextStyle(
color: Colors.white,
fontFamily: "myfont2",
fontSize: 14,
),
),
Text(
"اضغط هنا",
style: TextStyle(
color: Color(0xFFFF1BB3),
fontFamily: "myfont2",
fontSize: 14,
decoration: TextDecoration.underline,
),
),
],
),
),
const SizedBox(height: 20),
GestureDetector(
onTap: () {
Navigator.pushNamed(context, '/quizpage');
},
child: Column(
children: const [
Text(
"تريد أجهزة توفر الكهرباء ؟",
style: TextStyle(
color: Colors.white,
fontFamily: "myfont2",
fontSize: 14,
),
),
Text(
"اضغط هنا",
style: TextStyle(
color: Color(0xFFFF1BB3),
fontFamily: "myfont2",
fontSize: 14,
decoration: TextDecoration.underline,
),
),
],
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

Widget labeledTextField(String label, String value) {
return Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
Padding(
padding: const EdgeInsets.only(bottom: 9),
child: Text(
label,
textAlign: TextAlign.right,
style: const TextStyle(
color: Colors.white,
fontSize: 16,
fontFamily: "myfont2",
),
),
),
Container(
height: 50,
alignment: Alignment.center,
decoration: BoxDecoration(
color: const Color.fromARGB(160, 40, 40, 40),
borderRadius: BorderRadius.circular(12),
),
child: Text(
value,
textAlign: TextAlign.center,
style: const TextStyle(
color: Colors.white,
fontSize: 16,
fontFamily: "myfont2",
),
),
),
],
);
}
}
