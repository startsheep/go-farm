import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/routes/app_pages.dart';
import 'package:getx_pattern_starter/app/theme/colors.dart';
import 'package:getx_pattern_starter/app/widgets/reusetext_field.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
      // color: AppTheme.defaultBackground,
      height: Get.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    // margin: EdgeInsets.only(top: 100),
                    child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Selamt Datang",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Go",
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Color.fromARGB(90, 0, 0, 0),
                              offset: Offset(2, 3.0),
                            ),
                          ],
                        ),
                        children: [
                          TextSpan(
                            text: " Farm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(52, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.3),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Masuk lewat sini",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ReuseTextField(
                              controller: controller.phoneController.value,
                              hintText: "Telepon",
                              prefixIcon: Icons.phone,
                              prefixIconColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Telepon tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(() {
                              return ReuseTextField(
                                maxLines: 1,
                                controller: controller.passwordController.value,
                                hintText: "Password",
                                prefixIconColor: Colors.white,
                                suffixIconColor:
                                    controller.isHiddenPassword.value
                                        ? Colors.white
                                        : AppTheme.primary,
                                prefixIcon: Icons.lock,
                                obscureText: controller.isHiddenPassword.value,
                                suffixIcon: controller.isHiddenPassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                onPressSuffix: () {
                                  controller.isHiddenPassword.value =
                                      !controller.isHiddenPassword.value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password tidak boleh kosong";
                                  }
                                  return null;
                                },
                                // isPassword: true,
                              );
                            }),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(() {
                              return !controller.isLoading.value
                                  ? Container(
                                      width: Get.width,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            controller.doLogin();
                                          }
                                        },
                                        child: Text(
                                          "Masuk",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          // primary: AppTheme.defaultButtonColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    )
                                  : CircularProgressIndicator(
                                      color: Colors.white,
                                    );
                            }),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: AppTheme.dTextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
