import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import 'my_text_style.dart';

customSnackBar({
  required Color bgClr,
  Icon? icon,
  required String msg,
}) {
  Get.rawSnackbar(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
    messageText: Row(
      children: [
        Expanded(
          child: Text(
            msg,
            style: myTextStyle(clr: Colors.white, size: 14.0),
          ),
        ),
        InkWell(
          onTap: () => Get.back(canPop: true),
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ],
    ),
    backgroundColor: bgClr,
    margin: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
    borderRadius: 04.0,
    icon: icon,
    // snackPosition: SnackPosition.BOTTOM,
    animationDuration: const Duration(milliseconds: 200),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeInBack,
    overlayBlur: 0.0,
    overlayColor: Colors.transparent,
    barBlur: 0.0,
    duration: const Duration(milliseconds: 1200),
    maxWidth: 400,
    leftBarIndicatorColor: kSecondaryColor,
  );
}
