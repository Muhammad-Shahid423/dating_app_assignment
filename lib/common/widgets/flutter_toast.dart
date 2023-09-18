import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../values/colors.dart';

toastInfo({
  required String msg,
  Color backgroundColor = AppColors.primaryElement,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16);
}
