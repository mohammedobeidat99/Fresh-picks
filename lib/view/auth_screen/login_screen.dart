import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_picks/controller/auth_control.dart';
import 'package:fresh_picks/view/auth_screen/signup_screen.dart';
import 'package:fresh_picks/view/home_screen/home.dart';
import 'package:fresh_picks/widgets/applogo_widget.dart';
import 'package:fresh_picks/widgets/bg_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../consts/consts.dart';
import '../../consts/list.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/our_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthCotroller());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.03).heightBox,

          Lottie.asset( 'assets/lottie/130776-create-account.json',width: 200).box.roundedFull.size(300, 150).padding(EdgeInsets.all(8)).roundedFull.make(),

          
            

            //10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                      hint: emailHint,
                      title: email,
                      ispass: false,
                      controller: controller.emailController),
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      ispass: true,
                      controller: controller.passwordController),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child:
                              forgetpass.text.color(redColor).size(12).make())),
                  5.heightBox,
                  controller.isloading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(mainColor),
                        )
                      : ourBoutton(
                          color: mainColor,
                          title: login,
                          textcolor: whiteColor,
                          onPress: () async {
                            controller.isloading(true);

                            await controller
                                .loginMethod(context: context)
                                .then((value) {
                              if (value != null) {
                                Get.offAll(() => const Home());
                                VxToast.show(context, msg: "Log in saccss ");
                              } else {
                                controller.isloading(false);
                                
                              }
                            });
                          }).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  loginwith.text.color(fontGrey).make(),
                  5.heightBox,
                  ourBoutton(
                      color: redColor,
                      title: signup,
                      textcolor: whiteColor,
                      onPress: () {
                        Get.to(() => const SignupScreen());
                      }).box.width(context.screenWidth - 50).make(),
                  15.heightBox,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: lightGrey,
                                  child: Image.asset(
                                    socialIconList[index],
                                    width: 30,
                                  ),
                                ),
                              )))
                ],
              )
                  .box
                  .white
                  .rounded
                  .shadow3xl
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .make(),
            ),
            5.heightBox,
          ],
        ),
      ),
    ));
  }
}
