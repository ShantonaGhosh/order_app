import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quadeye/common/global_variable.dart';
import 'package:quadeye/service/auth_service.dart';

import '../common/app_color.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/my_text_style.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.person_outline_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomCard(
                firstText: Text(
                  'Name : $loginUserName',
                  style: myTextStyle(clr: Colors.black),
                ),
                title: '',
              ),
              CustomCard(
                  firstText: Text(
                    'User ID : $loginUserIdU ',
                    style: myTextStyle(clr: Colors.black, size: 14.0),
                  ),
                  title: ''),
              CustomCard(
                  firstText: Text(
                    'Role ID: $loginUserRoleId',
                    style: myTextStyle(clr: Colors.black, size: 14.0),
                  ),
                  title: ''),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // CustomButton(
                  //   onTap: () {
                  //     Get.toNamed("/editProfile");
                  //   },
                  //   title: "Edit Profile",
                  //   fontSize: 16,

                  //   btnColor: kPrimaryColor,
                  //   radius: 50.0,
                  //    clr: Colors.white,
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 16.0, vertical: 5.0),
                  // ),
                  CustomButton(
                    onTap: () async {
                      AuthService().logOut(context: context);
                    },
                    title: "Log Out",
                    fontSize: 18,
                    btnColor: kPrimaryColor,
                    radius: 50.0,
                    clr: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
