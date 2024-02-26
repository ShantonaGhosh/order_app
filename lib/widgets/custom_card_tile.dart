import 'package:flutter/material.dart';

import '../common/app_color.dart';

class CustomCardTile extends StatelessWidget {
  const CustomCardTile({
    super.key,
    this.title,
    this.subTitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.bgColor,
    this.visualDensity,
    this.contentPadding,
    this.child,
    this.elevation,
    this.horizontalTitleGap,
    this.padding,
  });
  final Widget? title;
  final Widget? subTitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? bgColor;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? child;
  final double? elevation;
  final double? horizontalTitleGap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Card(
        color: bgColor ?? cardBgColor1,
        margin: EdgeInsets.zero,
        elevation: elevation ?? 4.0,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12.0), // Adjust the border radius as needed
        ),
        child: Container(
          padding: padding,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(40.0)
          // ),
          child: Column(
            children: [
              ListTile(
                dense: true,
                title: title,
                // title != null
                //     ? SelectableText(
                //         "$title",
                //         style: myTextStyle(
                //             fw: FontWeight.w500,
                //             clr: const Color.fromARGB(221, 35, 32, 32),
                //             size: 15.0),
                //         enableInteractiveSelection: true,
                //         onTap: onTap,
                //       )
                //     : null,
                subtitle: subTitle ,
                // != null
                //     ? Text(
                //         "$subTitle",
                //         style: myTextStyle(
                //             fw: FontWeight.w400, clr: Colors.black54),
                //         maxLines: 2,
                //         overflow: TextOverflow.ellipsis,
                //       )
                //     : null,
                horizontalTitleGap: horizontalTitleGap ?? 0.0,
                minVerticalPadding: 0.0,
                minLeadingWidth: 30.0,
                // contentPadding: EdgeInsets.only(
                //     bottom: subTitle != null ? 0.0 : 0.0, left: 10.0, right: 10.0),
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: .0),
                leading: leading,
                trailing: trailing,
                visualDensity: visualDensity ??
                    const VisualDensity(horizontal: 0, vertical: -4.0),
              ),
            
            
              Container(child: child)
            ],
          ),
        ),
      ),
    );
  }
}
