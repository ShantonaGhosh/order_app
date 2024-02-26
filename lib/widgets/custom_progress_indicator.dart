import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../common/app_color.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      size: 60.0,
      itemBuilder: (context, index) {
        final colors = [
          kPrimaryColor,
          kPrimaryColor,
        ];
        final color = colors[index % colors.length];
        return DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        );
      },
    );
  }
}
