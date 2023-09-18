import 'package:flutter/cupertino.dart';

import '../../../../common/values/colors.dart';
import '../../../../common/widgets/base_text_widget.dart';

Widget tagWidget(String tag, {Color borderColor = const Color(0xff1A1A1A), Color bgColor = const Color(0xff202020), String icon = 'assets/icons/ic_icon_grey.png', FontWeight fontWeight = FontWeight.w400}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
    margin: const EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      border: Border.all(
          color: borderColor),
      color: bgColor,
      borderRadius:
      BorderRadius.circular(100),
    ),
    child: Row(
      children: [
        Image.asset(
          icon,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 3),
        reuseAbleText(tag, fontWeight: fontWeight)
      ],
    ),
  );
}