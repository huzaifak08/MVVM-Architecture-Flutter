import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // Toast Message:

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // FlushBar:
  static flushbar(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.decelerate,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
