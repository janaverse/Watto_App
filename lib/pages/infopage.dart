import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Infopage extends StatefulWidget {
const Infopage({super.key});
@override
State<Infopage> createState() => _InfopageState();
}
class _InfopageState extends State<Infopage> {
final TextEditingController nameController = TextEditingController();
final TextEditingController wattsController = TextEditingController();
final TextEditingController hoursController = TextEditingController();
final TextEditingController daysController = TextEditingController();
void showError(String message) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(message, style: const TextStyle(fontFamily: "myfont2")),
backgroundColor: Colors.red,
),
);
}
void calculateAndNavigate(BuildContext context) {
final name = nameController.text.trim();
final wattsText = wattsController.text.trim();
final hoursText = hoursController.text.trim();
final daysText = daysController.text.trim();

if (name.isEmpty || wattsText.isEmpty || hoursText.isEmpty || daysText.isEmpty) {
showError("يرجى تعبئة جميع الحقول");
return;
}
if (!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(name)) {
showError("يرجى إدخال اسم الجهاز باستخدام حروف عربية فقط");
return;
}

final watts = double.tryParse(wattsText);
final hours = int.tryParse(hoursText);
final days = int.tryParse(daysText);

if (watts == null || watts <= 0) {
showError("يرجى إدخال استهلاك بالواط (رقم موجب فقط)");
return;
}

if (hours == null || hours <= 0 || hours > 24) {
showError("عدد الساعات يجب أن يكون من 1 إلى 24");
return;
}

if (days == null || days < 1 || days > 30) {
showError("عدد الأيام يجب أن يكون من 1 إلى 30");
return;
}

final monthlyConsumption = (watts * hours * days) / 1000;
final costDollar = monthlyConsumption * 0.18;
final costRiyal = costDollar * 3.75;

Navigator.pushNamed(
context,
'/resultpage',
arguments: {
'monthlyConsumption': monthlyConsumption.toStringAsFixed(2),
'costDollar': costDollar.toStringAsFixed(2),
'costRiyal': costRiyal.toStringAsFixed(2),
},
);
}

@override
Widget build(BuildContext context) {
final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

return Scaffold(
resizeToAvoidBottomInset: true,
backgroundColor: const Color.fromARGB(255, 6, 3, 27),
body: SafeArea(
child: LayoutBuilder(
builder: (context, constraints) {
return SingleChildScrollView(
padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
child: ConstrainedBox(
constraints: BoxConstraints(minHeight: constraints.maxHeight),
child: IntrinsicHeight(
child: isLandscape ? buildLandscapeLayout() : buildPortraitLayout(),
),
),
);
},
),
),
);
}

Widget buildPortraitLayout() {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 24),
width: double.infinity,
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: buildSharedContent(),
),
);
}

Widget buildLandscapeLayout() {
final content = buildSharedContent();
return Row(
children: [
Expanded(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: content.sublist(0, 5),
),
),
),
Expanded(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: content.sublist(5),
),
),
),
],
);
}

List<Widget> buildSharedContent() {
return [
const SizedBox(height: 30),
Align(
alignment: Alignment.centerLeft,
child: IconButton(
icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
onPressed: () => Navigator.pushNamed(context, '/'),
),
),
const SizedBox(height: 20),
Center(
child: Text(
"Welcome",
style: TextStyle(
fontSize: 40,
fontWeight: FontWeight.bold,
color: Colors.white,
fontFamily: "myfont",
),
),
),
const SizedBox(height: 10),
Center(
child: Text(
"قم بإدخال البيانات",
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.bold,
color: Color(0xFFFF1BB3),
fontFamily: "myfont2",
),
),
),
const SizedBox(height: 30),
fieldOnly("اسم الجهاز (مثلاً: ثلاجة)", TextInputType.text, Icons.devices_other,
arabicOnly: true, controller: nameController),
fieldOnly("( W ) الاستهلاك بالواط", TextInputType.number, Icons.power,
controller: wattsController),
fieldOnly("عدد الساعات يوميًا", TextInputType.number, Icons.schedule,
controller: hoursController),
fieldOnly("عدد الأيام في الشهر", TextInputType.number, Icons.date_range,
controller: daysController),
const SizedBox(height: 30),
SizedBox(
width: double.infinity,
height: 50,
child: ElevatedButton(
onPressed: () => calculateAndNavigate(context),
style: ElevatedButton.styleFrom(
padding: EdgeInsets.zero,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
backgroundColor: Colors.transparent,
elevation: 0,
),
child: Container(
alignment: Alignment.center,
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [Color(0xFFFF1BB3), Color(0xFFC451C9)],
),
borderRadius: BorderRadius.circular(12),
),
child: const Text(
"احسب الاستهلاك",
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
];
}

Widget fieldOnly(String hint, TextInputType type, IconData icon,
{bool arabicOnly = false, required TextEditingController controller}) {
List<TextInputFormatter> formatters = [];

if (arabicOnly) {
formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF\s]+')));
}

return Container(
margin: const EdgeInsets.only(bottom: 15),
decoration: BoxDecoration(
color: const Color.fromARGB(160, 40, 40, 40),
borderRadius: BorderRadius.circular(12),
),
child: TextField(
controller: controller,
style: const TextStyle(color: Colors.white, fontFamily: "myfont2"),
keyboardType: type,
inputFormatters: formatters,
textAlign: TextAlign.center,
textAlignVertical: TextAlignVertical.center,
decoration: InputDecoration(
hintText: hint,
hintStyle: const TextStyle(color: Colors.white70, fontFamily: "myfont2"),
contentPadding: const EdgeInsets.only(right: 48, left: 12),
border: InputBorder.none,
suffixIcon: Icon(icon, color: Colors.white70, size: 22),
),
),
);
}
}
