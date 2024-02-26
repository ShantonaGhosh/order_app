// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadeye/service/auth_service.dart';

import 'custom_list_button.dart';
import 'my_text_style.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    this.children,
  });
  List<Widget>? children = const <Widget>[];
  final GlobalKey<ScaffoldState> _drawerScaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: _drawerScaffoldKey,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'asstes/images/logo.png',
                width: 120,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: children ??
                    [
                      CustomListButton(
                        onTap: () => Get.offAllNamed('/appRoute'),
                        title: "Home",
                        icon: Icons.home_outlined,
                      ),
                     
                      CustomListButton(
                        onTap: () async {
                          //   Navigator.of(context).pop(false);
                          await AuthService().logOut(context: context);
                        },
                        title: "Log Out",
                        icon: Icons.logout,
                      ),
                    ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: const BoxDecoration(
                  // color: searchBtnColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80.0))),
              child: Text(
                "version: 1.0.0",
                style: myTextStyle(
                  clr: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
