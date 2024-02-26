import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quadeye/service/auth_service.dart';
import 'package:quadeye/service/network_service.dart';
import 'package:quadeye/widgets/custom_alert_dialog.dart';

import '../common/app_color.dart';
import '../common/global_variable.dart';

import '../widgets/custom_button.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/my_text_style.dart';
import '../widgets/network_failed_dialog.dart';

// ignore: must_be_immutable
class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _userIdController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cid = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return (await customAlertDialog(
          title: "Confirmation",
          content: "Do you want to close this App?",
          confirmOnTap: () => Navigator.of(context).pop(true),
          cancelOnTap: () => Navigator.of(context).pop(false),
        ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Center(
              child: Container(
                // height: size.height,
                width: size.width > 400 ? size.width * 0.60 : size.width,
                alignment: Alignment.center,
                // padding: const EdgeInsets.only(top: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height < 400 ? 200 : size.height * 0.35,
                        child: Center(
                          child: Container(
                            height: 200,
                            width: 250,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'asstes/images/logo.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height < 400 ? 400 : size.height * 0.65,
                        child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 10.0),
                          decoration: BoxDecoration(
                            // color: Color(0xffBBDEFB),
                            color: kSecondaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'LogIn',
                                        style: myTextStyle(
                                            size: 30.0,
                                            fw: FontWeight.bold,
                                            clr: kPrimaryColor),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Login and start managing your account',
                                        style: myTextStyle(
                                            size: 15.0, clr: Colors.black38),
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      CustomTextField(
                                        controller: _userIdController,
                                        hintText: 'Enter user id',
                                        lebelText: 'User Id',
                                        validatorText:
                                            'Please enter your user id',
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: kPrimaryColor,
                                        ),
                                        textInputAction: TextInputAction.next,
                                      ),

                                      const SizedBox(
                                        height: 12.0,
                                      ),

                                      CustomTextField(
                                        controller: _passwordController,
                                        hintText: 'Enter your password',
                                        lebelText: 'User Password',
                                        validatorText:
                                            'Please enter your password',
                                        obscureText: isObscure,
                                        radius: 30,
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: kPrimaryColor,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            // isObscure(!isObscure.value);
                                            setState(() {
                                              isObscure = !isObscure;
                                            });
                                          },
                                          child: Icon(
                                            isObscure == true
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 25.0,
                                      ),
                                      CustomButton(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           DataSyncScreen()),
                                          // );

                                          _login(
                                              
                                              userId:
                                                  _userIdController.text.trim(),
                                              userPass: _passwordController.text
                                                  .trim());
                                        },
                                        title: 'LogIn',
                                        fontSize: 20,
                                        clr: Colors.white,
                                      ),
                                      // const SizedBox(
                                      //   height: 140.0,
                                      // ),
                                    ],
                                  ),
                                ),
                                // Align(
                                //   alignment: Alignment.centerRight,
                                //   child: Text(
                                //     "version: ${appVersion.toString()}",
                                //     style: myTextStyle(),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Obx(
            //   () => AuthService.isLoading.value == true
            //       ? Container(
            //           height: size.height,
            //           width: size.width,
            //           color: Colors.black.withOpacity(0.3),
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

    Future _login(
      {
      required String userId,
      required String userPass}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      await NetworkService.checkInternetConnectivity().then((internet) async {
        if (internet) {
          await AuthService()
              .login(context: context, userId: userId, userPass: userPass);
        } else {
          networkFailedDialog();
        }
      });
    }
  }
}
