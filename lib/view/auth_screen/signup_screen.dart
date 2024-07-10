import 'package:fresh_picks/view/home_screen2/home.dart';
import 'package:fresh_picks/widgets/our_button_signup.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../controller/auth_control.dart';

import '../../widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool ischick = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordControler = TextEditingController();
  var numberController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              (context.screenHeight * 0.05).heightBox,
              //applogoWidget(),
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                     Text(
                      "Welcome Back".tr,
                      style: TextStyle(
                        fontFamily:
                            'dms_reguler', // Change to your desired font family
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10), // Adjust the spacing as needed
                     Text(
                      "Sign Up to Your Email And Password".tr,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(106, 173, 171, 171),
                      ),
                    ),
                    const SizedBox(height: 15), // Adjust the spacing as needed

                    customTextField(
                      hint: hintname,
                      title: name.tr,
                      controller: nameController,
                      ispass: false,
                      shapicon: const Icon(Icons.person_2_outlined),
                    ),
                    customTextField(
                        shapicon: const Icon(Icons.email_outlined),
                        hint: emailHint,
                        title: email.tr,
                        controller: emailController,
                        ispass: false),
                    customTextField(
                      shapicon: const Icon(Icons.phone_iphone_rounded),
                      ispass: false,
                      hint: "+962-772319071",
                      title: "Mobile".tr,
                      controller: numberController,
                    ),
                    customTextField(
                      shapicon: const Icon(Icons.location_on_sharp),
                      ispass: false,
                      hint: "Amman",
                      title: "Adrees".tr,
                      controller: addressController,
                    ),
                    customTextField(
                        shapicon: const Icon(Icons.lock_outline),
                        hint: passwordHint,
                        title: password.tr,
                        controller: passwordControler,
                        ispass: true),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: secondaryColor,
                            checkColor: whiteColor,
                            value: ischick,
                            onChanged: (newValue) {
                              setState(() {
                                ischick = newValue!;
                              });
                            }),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "I agree to the".tr,
                              style: const TextStyle(
                                  fontFamily: regular, color: fontGrey)),
                          TextSpan(
                              text: " Terms & privcy ".tr,
                              style: const TextStyle(
                                  fontFamily: regular, color: secondaryColor))
                        ]))
                      ],
                    ),
                    5.heightBox,
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(mainColor))
                        : // Inside your SignupScreen class

                        ourBouttonsginup(
                            color: ischick == true ? secondaryColor : lightGrey,
                            title: signup.tr,
                            textcolor: whiteColor,
                            onPress: () async {
                              if (ischick != false) {
                                var userCredential =
                                    await controller.signupMethod(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordControler.text,
                                  name: nameController.text,
                                  imageUrl: '',
                                  number: numberController.text,
                                  address: addressController.text,
                                );

                                if (userCredential != null) {
                                  // Registration successful
                                  Get.offAll(() => const Home());
                                } else {
                                  // Registration failed, handle as needed
                                }
                              }
                            },
                          ).box.width(context.screenWidth - 50).make(),

                    10.heightBox,
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account ? ".tr,
                            style: const TextStyle(
                                color: fontGrey, fontFamily: regular)),
                        TextSpan(
                            text: login.tr,
                            style: const TextStyle(
                                color: secondaryColor, fontFamily: regular)),
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
      ),
    );
  }
}
