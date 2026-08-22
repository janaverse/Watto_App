import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTipsPage extends StatefulWidget {
const VideoTipsPage({super.key});

@override
State<VideoTipsPage> createState() => _VideoTipsPageState();
}

class _VideoTipsPageState extends State<VideoTipsPage> {
late VideoPlayerController _controller;
bool _isInitialized = false;

@override
void initState() {
super.initState();
_controller = VideoPlayerController.asset('assets/video.MP4')
..initialize().then((_) {
setState(() {
_isInitialized = true;
});
});
}

@override
void dispose() {
_controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
final isLandscape =
MediaQuery.of(context).orientation == Orientation.landscape;
final screenWidth = MediaQuery.of(context).size.width;

final videoWidget = _isInitialized
? AspectRatio(
aspectRatio: _controller.value.aspectRatio,
child: VideoPlayer(_controller),
)
: const CircularProgressIndicator(color: Colors.white);

final content = Column(
mainAxisSize: MainAxisSize.min,
children: [
const Text(
"شاهد هذا الفيديو لتتعرف على أفضل طرق ترشيد استهلاك الكهرباء",
style: TextStyle(
color: Colors.white70,
fontSize: 18,
fontFamily: "myfont2",
),
textAlign: TextAlign.center,
),
const SizedBox(height: 20),
SizedBox(
width: isLandscape ? screenWidth * 0.5 : double.infinity,
child: videoWidget,
),
const SizedBox(height: 20),
IconButton(
icon: Icon(
_controller.value.isPlaying
? Icons.pause_circle_filled
: Icons.play_circle_fill,
color: Colors.white,
size: 40,
),
onPressed: () {
setState(() {
_controller.value.isPlaying
? _controller.pause()
: _controller.play();
});
},
),
],
);

return Directionality(
textDirection: TextDirection.rtl,
child: Scaffold(
backgroundColor: const Color(0xFF06031B),
appBar: AppBar(
backgroundColor: Colors.transparent,
elevation: 0,
centerTitle: true,
title: const Text(
"فيديو توعوي",
style: TextStyle(
color: Colors.white,
fontFamily: "myfont2",
),
),
leading: IconButton(
icon: const Icon(Icons.arrow_back, color: Colors.white),
onPressed: () {
Navigator.pop(context);
},
),
),
body: Padding(
padding: const EdgeInsets.all(20),
child: SingleChildScrollView(
physics: const BouncingScrollPhysics(), 
child: isLandscape
? Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(child: content),
],
)
: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const SizedBox(height: 50),
content,
],
),
),
),
),
);
}
}