import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out/inAppData/Colors.dart';
import 'package:work_out/inAppData/images%20sources.dart';
import 'package:work_out/inAppData/text.dart';
import '../../../controller/authControllers/forgotPasswordController.dart';
import '../../../controller/functionsController.dart';
import '../../components/general componenets/button.dart';
import '../../components/general componenets/text field.dart';
import '../../components/general componenets/titleWithDescription.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  //depend. injection
  final FunctionsController controller = Get.put(FunctionsController());
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              ImgSrc().randomFromAssetsList(),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.45, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.darkBlue,
                  AppColors.darkBlue.withOpacity(0.05),
                ],
              ),
            ),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 100),
                    child: TitleWithDescription(
                      title: controller.capitalize(AppTexts.forgot),
                      description: controller.capitalize(
                          AppTexts.forgotPasswordDesccription.toLowerCase()),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 200),
                    child: CustomTextField(
                      controller:
                          forgotPasswordController.emailToRecoverPassword,
                      keyboardType: TextInputType.emailAddress,
                      label: controller.capitalize(AppTexts.yourEmail),
                    ),
                  ),
                  const SizedBox(height: 50),
                  DelayedDisplay(
                    delay: Duration(milliseconds: controller.delay + 300),
                    child: CustomButton(
                      onPressed: () {
                        forgotPasswordController.recoverPassword(
                            forgotPasswordController
                                .emailToRecoverPassword.text);
                      },
                      isRounded: false,
                      text: controller.capitalize(AppTexts.resetPassword),
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
