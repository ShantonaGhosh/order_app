import 'package:flutter/material.dart';

import 'my_text_style.dart';

class CustomMenuCard extends StatelessWidget {
  const CustomMenuCard({
    super.key,
    this.icon,
    this.iconSize,
    this.title,
    this.titleSize,
    required this.onTap,
    this.cardColor,
  });

  final IconData? icon;
  final double? iconSize;
  final String? title;
  final double? titleSize;
  final VoidCallback onTap;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        color: cardColor,
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: iconSize,
                color: Colors.black,
              ),
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: myTextStyle(
                  size: titleSize,
                  clr: Colors.black,
                  fw: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
