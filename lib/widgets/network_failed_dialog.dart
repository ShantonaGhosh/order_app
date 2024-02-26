import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import 'custom_alert_dialog.dart';
import 'my_text_style.dart';

Future networkFailedDialog() async {
  return customAlertDialog(
    title: "Something went wrong",
    content: "Please check your internet connection and try again later",
    actions: [
      MaterialButton(
        onPressed: () => Get.back(canPop: false),
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.9, color: kPrimaryColor),
            borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          "OK",
          style: myTextStyle(clr: kPrimaryColor),
        ),
      )
    ],
  );
}
