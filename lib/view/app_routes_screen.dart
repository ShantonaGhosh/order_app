// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quadeye/common/global_variable.dart';

import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_bottom_appbar.dart';
import '../widgets/custom_drawer.dart';

import 'home_screen.dart';
import 'user_profile_screen.dart';

class AppRouteScreen extends StatefulWidget {
  AppRouteScreen({super.key});

  @override
  State<AppRouteScreen> createState() => _AppRouteScreenState();
}

class _AppRouteScreenState extends State<AppRouteScreen> {
  // ignore: unnecessary_new
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var selectedIndex = 0.obs;

  List<Widget> page = [
     HomeScreen(),
    const UserProfileScreen(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   Box loginData = Hive.box('login');
  //   loginUserName = loginData.get('username') ?? '';
  //   loginUserIdU = loginData.get('user_id') ?? '';
  //   loginUserRoleId = loginData.get('role_id') ?? '';
  //   print('---------login name--------------${loginUserName}');
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // if (AuthServices.isLoading.value) {
        //   return false;
        // }
        return (await customAlertDialog(
          title: "Confirmation",
          content: "Do you want to close this App?",
          confirmOnTap: () => Navigator.of(context).pop(true),
          cancelOnTap: () => Navigator.of(context).pop(false),
        ));
      },
      child: Obx(
        () => Stack(
          children: [
            Scaffold(
              key: _scaffoldKey,
              // extendBody: false,
              appBar: CustomAppBar(
                title: selectedIndex.value == 0 ? "Vedio " : "Profile",
                // actions: selectedIndex.value == 0
                //     ? [
                //         CustomNotificationButton(
                //           onTap: () {},
                //           icon: Icons.notifications_active_outlined,
                //           text: "90",
                //         ),
                //         const SizedBox(
                //           width: 12.0,
                //         ),
                //       ]
                //     : [],
                leading: IconButton(
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    icon: const Icon(Icons.menu)),
              ),
              drawer: CustomDrawer(),
              body: page[selectedIndex.value],
              bottomNavigationBar: CustomBottomAppbar(
                index: selectedIndex.value,
                onChangedTab: onChangedTab,
              ),
            ),
            // Obx(
            //   () => AuthServices.isLoading.value
            //       ? Container(
            //           // height: size.height,
            //           // width: size.width,
            //           color: Colors.black.withOpacity(0.4),
            //           alignment: Alignment.center,
            //           child: const CustomProgressIndicator(),
            //         )
            //       : const SizedBox(),
            // )
          ],
        ),
      ),
    );
  }

  void onChangedTab(int index) {
    selectedIndex(index);
  }
}
