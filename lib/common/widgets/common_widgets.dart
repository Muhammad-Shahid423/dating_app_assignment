import 'package:dating_app_assignment/common/widgets/base_text_widget.dart';
import 'package:flutter/widgets.dart';

import '../../ui/screens/home/home_screen.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomeScreen(),
    Center(child: reuseAbleText("Location Screen", size: 20)),
    Center(child: reuseAbleText("Main Screen", size: 20)),
    Center(child: reuseAbleText("Chat Screen", size: 20)),
    Center(child: reuseAbleText("Setting Screen", size: 20)),
  ];

  return widget[index];
}