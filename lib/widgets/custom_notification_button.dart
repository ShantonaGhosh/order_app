import 'package:flutter/material.dart';

import 'my_text_style.dart';

class CustomNotificationButton extends StatelessWidget {
  const CustomNotificationButton({
    Key? key,
    this.onTap,
    this.icon,
    this.text,
  }) : super(key: key);
  final VoidCallback? onTap;
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Visibility(
              visible: text != null && text.toString().isNotEmpty,
              child: Positioned(
                right: -5.0,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Text(
                    "$text",
                    style: myTextStyle(
                        clr: Colors.black, size: 12.0, fw: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
