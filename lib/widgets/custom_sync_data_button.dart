import 'package:flutter/material.dart';

import '../common/app_color.dart';

class CustomSyncDataButton extends StatelessWidget {
  const CustomSyncDataButton({
    super.key,
    required this.animationController,
    this.onTap,
    this.child,
  });
  final AnimationController animationController;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (_, constraints) => Container(
          alignment: Alignment.center,
          height: constraints.maxWidth * 0.50,
          width: constraints.maxWidth * 0.50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.grey,
          ),
          child: Stack(
            children: [
              RotationTransition(
                turns: Tween<double>(begin: 0, end: 1)
                    .animate(animationController),
                child: Stack(
                  children: [
                    SizedBox(
                      height: constraints.maxWidth * 0.50,
                      width: constraints.maxWidth * 0.50,
                      child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1,
                        color: canvasColor,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.50,
                      width: constraints.maxWidth * 0.50,
                      child: const CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 0.95,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.50,
                      width: constraints.maxWidth * 0.50,
                      child: CircularProgressIndicator(
                        strokeWidth: 13,
                        value: 0.66,
                        color: canvasColor,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.50,
                      width: constraints.maxWidth * 0.50,
                      child: const CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 0.61,
                        color: Color.fromARGB(255, 42, 121, 161),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.50,
                      width: constraints.maxWidth * 0.50,
                      child: CircularProgressIndicator(
                        strokeWidth: 13,
                        value: 0.33,
                        color: canvasColor,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.50,
                      width: constraints.maxWidth * 0.50,
                      child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 0.28,
                        color: Colors.teal.shade300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: constraints.maxWidth * 0.50,
                width: constraints.maxWidth * 0.50,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.grey,
                ),
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
