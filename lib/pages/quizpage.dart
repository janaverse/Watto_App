import 'package:flutter/material.dart';
import 'quizresultpage.dart';

class QuizPage extends StatefulWidget {
const QuizPage({super.key});

@override
State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
String? deviceType;
String? usage;
String? priority;
String? budget;

final questionStyle = const TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: Colors.white,
fontFamily: 'myfont2',
);

final optionStyle = const TextStyle(
color: Colors.white70,
fontFamily: 'myfont2',
);

Widget buildOption(
String value,
String? group,
void Function(String?) onChanged,
) {
return RadioListTile(
title: Text(value, style: optionStyle, textAlign: TextAlign.right),
value: value,
groupValue: group,
onChanged: onChanged,
activeColor: const Color(0xFFFF1BB3),
controlAffinity: ListTileControlAffinity.trailing,
);
}

@override
Widget build(BuildContext context) {
return Directionality(
textDirection: TextDirection.rtl,
child: Scaffold(
backgroundColor: const Color.fromARGB(255, 6, 3, 27),
appBar: AppBar(
backgroundColor: Colors.transparent,
elevation: 0,
automaticallyImplyLeading: false,
title: const Text(
'اختبار اختيار الجهاز',
style: TextStyle(color: Colors.white, fontFamily: 'myfont2'),
),
centerTitle: true,
),
body: OrientationBuilder(
builder: (context, orientation) {
return Center(
child: ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 700), 
child: Padding(
padding: const EdgeInsets.all(20),
child: ListView(
children: [
Text('١. ما نوع الجهاز الذي تبحث عنه؟', style: questionStyle),
buildOption('ميكرويف', deviceType, (val) => setState(() => deviceType = val)),
buildOption('غسالة', deviceType, (val) => setState(() => deviceType = val)),
buildOption('مكيف', deviceType, (val) => setState(() => deviceType = val)),
buildOption('ثلاجة', deviceType, (val) => setState(() => deviceType = val)),
buildOption('مجفف', deviceType, (val) => setState(() => deviceType = val)),
buildOption('فرن', deviceType, (val) => setState(() => deviceType = val)),
const SizedBox(height: 20),

Text('٢. كم تستخدم الجهاز يوميًا؟', style: questionStyle),
buildOption('أقل من ساعة', usage, (val) => setState(() => usage = val)),
buildOption('١ إلى ٣ ساعات', usage, (val) => setState(() => usage = val)),
buildOption('أكثر من ٣ ساعات', usage, (val) => setState(() => usage = val)),
const SizedBox(height: 20),

Text('٣. أيهما أهم بالنسبة لك؟', style: questionStyle),
buildOption('توفير الطاقة', priority, (val) => setState(() => priority = val)),
buildOption('الأداء العالي', priority, (val) => setState(() => priority = val)),
const SizedBox(height: 20),

Text('٤. ما ميزانيتك؟', style: questionStyle),
buildOption('أقل من ٥٠٠ ريال', budget, (val) => setState(() => budget = val)),
buildOption('من ٥٠٠ إلى ١٥٠٠ ريال', budget, (val) => setState(() => budget = val)),
buildOption('أكثر من ١٥٠٠ ريال', budget, (val) => setState(() => budget = val)),
const SizedBox(height: 30),

if (deviceType != null && usage != null && priority != null && budget != null)
ElevatedButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => QuizResultPage(
deviceType: deviceType!,
usage: usage!,
priority: priority!,
budget: budget!,
),
),
);
},
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFFFF1BB3),
padding: const EdgeInsets.symmetric(vertical: 14),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
),
),
child: const Text(
'اعرض الجهاز المناسب',
style: TextStyle(
fontFamily: 'myfont2',
fontSize: 16,
color: Colors.white,
),
),
),
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