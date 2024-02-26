// ignore_for_file: must_be_immutable, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key,
    key,
    this.title,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading,
    this.titleSpacing,
  })  : preferredSize = const Size.fromHeight(55.0),
        super(key: key);

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;
  final double? titleSpacing;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: kPrimaryColor,
      title: Text(
        title ?? 'Plan BD',
         style: myTextStyle(fw: FontWeight.w600, clr: Colors.white, size: 22.0),
      ),
      centerTitle: true,
      leading: leading ??
          IconButton(
              onPressed: () {
                Get.offAllNamed('/appRoute');
              },
              icon: const Icon(Icons.home_outlined)),
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      titleSpacing: titleSpacing ?? 0,
      // actions: actions,
      actions: actions ??
          [
            // Builder(
            //   builder: (context) {
            //     return IconButton(
            //       onPressed: () {
            //         Scaffold.of(context).openEndDrawer();
            //       },
            //       icon: Icon(
            //         Icons.account_circle_outlined,
            //         size: 30.0,
            //       ),
            //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            //     );
            //   },
            // ),
            const SizedBox(
              width: 20.0,
            ),
          ],
      elevation: 0.0,
    );
  }
}
