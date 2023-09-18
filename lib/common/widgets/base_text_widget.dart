import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';
import '../values/colors.dart';

Widget reuseAbleText(String txt,
    {Color color = AppColors.primaryElementText,
    int size = 14,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    txt,
    style: SafeGoogleFont(
      'Pretendard',
      fontSize: size.toDouble(),
      fontWeight: fontWeight,
      // height: 1.4285714286 * ffem / fem,
      color: color,
    ),
    // style: TextStyle(
    //     color: color, fontSize: size.toDouble(), fontWeight: fontWeight),
  );
}

TextSpan reuseAbleTextSpan(String txt,
    {Color color = AppColors.primaryElementText,
      int size = 14,
      FontWeight fontWeight = FontWeight.bold, List<InlineSpan>? children}) {
  return TextSpan(
    text: txt,
    style: SafeGoogleFont(
      'Pretendard',
      fontSize: size.toDouble(),
      fontWeight: fontWeight,
      // height: 1.4285714286 * ffem / fem,
      color: color,
    ),
    children: children
    // style: TextStyle(
    //     color: color, fontSize: size.toDouble(), fontWeight: fontWeight),
  );
}
