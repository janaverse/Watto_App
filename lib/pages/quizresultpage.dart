import 'package:flutter/material.dart';
import 'quizpage.dart';
import 'welcome.dart';

class QuizResultPage extends StatelessWidget {
final String deviceType;
final String usage;
final String priority;
final String budget;

const QuizResultPage({
super.key,
required this.deviceType,
required this.usage,
required this.priority,
required this.budget,
});

@override
Widget build(BuildContext context) {
final rec = getRecommendation();

return Directionality(
textDirection: TextDirection.rtl,
child: Scaffold(
backgroundColor: const Color(0xFF06031B),
appBar: AppBar(
backgroundColor: Colors.transparent,
title: const Text(
'نتيجة الاختبار',
style: TextStyle(color: Colors.white, fontFamily: 'myfont2'),
),
centerTitle: true,
elevation: 0,
),
body: OrientationBuilder(
builder: (context, orientation) {
final isPortrait = orientation == Orientation.portrait;

final content = Column(
mainAxisSize: MainAxisSize.min,
children: [
Card(
elevation: 8,
color: const Color(0xFF1E1B3A),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
child: Padding(
padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
Icon(Icons.check_circle, color: const Color(0xFF69F0AE), size: 60),
const SizedBox(height: 20),
Text(
rec['name'] ?? '',
style: const TextStyle(
fontSize: 22,
fontWeight: FontWeight.bold,
color: Colors.white,
fontFamily: 'myfont2',
),
textAlign: TextAlign.center,
),
const SizedBox(height: 15),
Text(
rec['description'] ?? '',
style: const TextStyle(
fontSize: 16,
color: Colors.white70,
fontFamily: 'myfont2',
),
textAlign: TextAlign.center,
),
],
),
),
),
const SizedBox(height: 30),
ElevatedButton(
onPressed: () {
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (_) => const QuizPage()),
);
},
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFFFF1BB3),
padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
),
),
child: const Text(
'إعادة الاختبار',
style: TextStyle(
fontFamily: 'myfont2',
fontSize: 16,
color: Colors.white,
),
),
),
const SizedBox(height: 15),
TextButton(
onPressed: () {
Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(builder: (_) => const Welcome()),
(route) => false,
);
},
child: const Text(
'الصفحة الرئيسية',
style: TextStyle(
color: Colors.white70,
fontSize: 14,
fontFamily: 'myfont2',
decoration: TextDecoration.underline,
),
),
),
],
);

return Center(
child: SingleChildScrollView(
padding: const EdgeInsets.all(20),
child: isPortrait
? content
: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Expanded(child: content),
],
),
),
);
},
),
),
);
}

Map<String, String> getRecommendation() {
if (deviceType == 'ميكرويف') {
if (usage == 'أقل من ساعة' && priority == 'توفير الطاقة' && budget == 'أقل من ٥٠٠ ريال') {
return {
'name': 'ميكروويف سامسونج اقتصادي',
'description': 'صغير الحجم، موفر للطاقة وسهل الاستخدام.',
};
}
if (usage == 'أكثر من ٣ ساعات' && priority == 'الأداء العالي' && budget == 'أكثر من ١٥٠٠ ريال') {
return {
'name': 'ميكروويف سامسونج 30 لتر',
'description': 'أداء فائق وتصميم أنيق — مثالي للاستخدام الكثيف.',
};
}
return {
'name': 'ميكروويف باناسونيك 25 لتر',
'description': 'حل متوازن للاستخدام اليومي : جودة وسعر مناسب.',
};
}

if (deviceType == 'مكيف') {
if (usage == 'أكثر من ٣ ساعات' && priority == 'الأداء العالي') {
return {
'name': 'مكيف سبليت سامسونج 18000 وحدة',
'description': 'تبريد ممتاز مع كفاءة طاقة عالية للاستخدام الطويل.',
};
}
return {
'name': 'مكيف شباك Gree 18000 وحدة',
'description': 'تركيب سهل وتبريد سريع بدون تكلفة عالية.',
};
}

if (deviceType == 'غسالة') {
if (priority == 'توفير الطاقة') {
return {
'name': 'غسالة إل جي 6 كجم موفرة',
'description': 'كفاءة استهلاك مع برامج ذكية للعناية بالملابس.',
};
}
return {
'name': 'غسالة سامسونج أوتوماتيك 8 كجم',
'description': 'أداء قوي وتنظيف ممتاز للعائلات المتوسطة.',
};
}

if (deviceType == 'ثلاجة') {
if (budget == 'أكثر من ١٥٠٠ ريال') {
return {
'name': 'ثلاجة LG InstaView 21 قدم',
'description': 'فخامة وتقنيات ذكية لا تضيع أموالك.',
};
}
return {
'name': 'ثلاجة سامسونج 12 قدم',
'description': 'توازن ممتاز بين الحجم والسعر والأداء.',
};
}

if (deviceType == 'فرن') {
return {
'name': 'فرن كهربائي كينوود 45 لتر',
'description': 'مثالي للخبز والتحميص بجودة ممتازة وسعر مناسب.',
};
}

if (deviceType == 'مجفف') {
return {
'name': 'مجفف إلكترولوكس 7 كجم',
'description': 'تجفيف سريع واقتصادي — مثالي للعائلات صغيرة الحجم.',
};
}

return {
'name': 'جهاز موصى به',
'description': 'اخترنا لك هذا الجهاز استنادًا لإجاباتك.',
};
}
}