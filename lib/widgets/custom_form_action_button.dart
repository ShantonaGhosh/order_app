import 'package:flutter/material.dart';

import '../common/app_color.dart';

class CustomFormActionButton extends StatelessWidget {
  const CustomFormActionButton({
    super.key,
    this.title,
    required this.onTap,
    this.leftIcon, this.height, this.width,
  });

  final String? title;
  final IconData? leftIcon;
  final double? height;
  final double? width;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap,
        child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12), // Customize border radius
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 0.0, 0.0, 0.0),
              alignment: Alignment.center,
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: kPrimaryColor)),
              child: Row(
                children: [
                  if (leftIcon != null) ...[
                    Icon(
                      leftIcon,
                      size: 22.0,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(width: 06.0),
                  ],
                  Text(
                    "$title",
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0),
                  ),
                ],
              ),
            )));
  }
}
