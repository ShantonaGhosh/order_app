import 'package:flutter/material.dart';

import '../common/app_color.dart';
import 'my_text_style.dart';

class CustomListButton extends StatelessWidget {
  const CustomListButton({
    super.key,
    this.onTap,
    this.icon,
    this.title,
  });
  final VoidCallback? onTap;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 10.0, 10.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          child: Row(
            children: [
              Icon(icon, color: kPrimaryColor),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                title ?? '',
                style: myTextStyle(clr: Colors.black, size: 16.0),
              )
            ],
          ),
        ),
      ),
    );
    
  }
}
