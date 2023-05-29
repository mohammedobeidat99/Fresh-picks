import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_picks/consts/firebase_const.dart';
import 'package:fresh_picks/view/home_screen/home.dart';
import 'package:fresh_picks/view/home_screen/home_screen.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../controller/auth_control.dart';
import '../../widgets/applogo_widget.dart';
import '../../widgets/bg_widget.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool ischick = false;
  var controller = Get.put(AuthCotroller());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordControler = TextEditingController();
  var numberController = TextEditingController();
  var AdreesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child:
         Column( 
          children: [
            (context.screenHeight * 0.08).heightBox,
            applogoWidget(),
            
            
            15.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                      hint: hintname,
                      title: name,
                      controller: nameController,
                      ispass: false),
                  customTextField(
                      hint: emailHint,
                      title: email,
                      controller: emailController,
                      ispass: false),
                  customTextField(
                    ispass: false,
                    hint: "+962-772319071",
                    title: "Number",
                    controller: numberController,
                  ),
                  customTextField(
                    ispass: false,
                    hint: "Amman",
                    title: "Adrees",
                    controller: AdreesController,
                  ),
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      controller: passwordControler,
                      ispass: true),
                 
                  Row(
                    children: [
                      Checkbox(
                          activeColor: mainColor,
                          checkColor: whiteColor,
                          value: ischick,
                          onChanged: (newValue) {
                            setState(() {
                              ischick = newValue!;
                            });
                          }),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "I agree to the",
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: " Terms & privcy ",
                            style:
                                TextStyle(fontFamily: regular, color: redColor))
                      ]))
                    ],
                  ),
                  5.heightBox,
                  controller.isloading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(mainColor))
                      : ourBoutton(
                          color: ischick == true ? mainColor : lightGrey,
                          title: signup,
                          textcolor: whiteColor,
                          onPress: () async {
                            if (ischick != false) {
                              controller.isloading(true);
                              try {
                                controller
                                    .signupMethod(
                                        context: context,
                                        email: emailController.text,
                                        password: passwordControler.text)
                                    .then((value) {
                                  return controller.storeUserData(
                                      name: nameController.text,
                                      password: passwordControler.text,
                                      email: emailController.text,
                                      number: numberController.text,
                                      addres: AdreesController.text,
                                      );
                                }).then((value) {
                                  
                                  
                            
                                  Get.offAll(() => const Home());
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isloading(false);
                              }
                            }
                          }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "Already have an account ? ",
                          style:
                              TextStyle(color: fontGrey, fontFamily: regular)),
                      TextSpan(
                          text: login,
                          style:
                              TextStyle(color: mainColor, fontFamily: regular)),
                    ]),
                  ).onTap(() {
                    Get.back();
                  })
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
