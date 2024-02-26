import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_style.dart';

Future<dynamic> customAlertDialog({
  final VoidCallback? leftOnTap,
  final VoidCallback? rightOnTap,
  final Color? confirmButtonClr,
  final Color? cancelButtonClr,
  final String? title,
  final String? content,
  final Widget? body,
  final List<Widget>? actions,
  final bool? onWillPop,
  final VoidCallback? confirmOnTap,
  final VoidCallback? cancelOnTap,
  final EdgeInsetsGeometry? contentPadding,
  final EdgeInsetsGeometry? titlePadding,
}) {
  return Get.defaultDialog(
    radius: 10.0,
    onWillPop: () async => onWillPop ?? false,
    title: title ?? '',
    content: body ??
        Text(
          "$content",
          style: myTextStyle(size: 16.0),
          // textAlign: TextAlign.justify,
        ),
    contentPadding:
        contentPadding ?? const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 16.0),
    titlePadding: const EdgeInsets.symmetric(vertical: 20.0),
    actions: actions ??
        <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: cancelOnTap ?? () => Get.back(canPop: false),
                // color: cancelButtonClr ?? Colors.red.shade300,
                minWidth: 0.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Cancel",
                  style: myTextStyle(
                      clr: cancelButtonClr ?? Colors.green.shade500, size: 18.0),
                ),
              ),
              MaterialButton(
                onPressed: confirmOnTap ?? () => Get.back(canPop: true),
                // color: confirmButtonClr ?? Colors.green.shade300,
                minWidth: 0.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Confirm",
                  style: myTextStyle(
                      clr: confirmButtonClr ?? Colors.red.shade500,
                      size: 18.0),
                ),
              ),
            ],
          )
        ],
  );
}
