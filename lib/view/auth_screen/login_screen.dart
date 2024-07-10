import 'package:fresh_picks/controller/auth_control.dart';
import 'package:fresh_picks/view/auth_screen/signup_screen.dart';
import 'package:fresh_picks/widgets/our_button.dart';
import 'package:get/get.dart';
import '../../consts/consts.dart';
import '../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
      bool _isArabic = false;
      List<bool> _isSelected = [false, false];


    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                // ToggleButtons for language switching
            Padding(
              padding: const EdgeInsets.only( bottom: 14.0),
              child: ToggleButtons(
                
                selectedColor: Colors.green,
              fillColor: mainColor,
              borderColor: mainColor,
              borderRadius: BorderRadius.circular(10),
                
                
                
                
                
              
                
                onPressed: (int index) {
                  setState(() {
                    _isSelected = List.generate(_isSelected.length, (i) => i == index);
                    if (index == 1) {
                      _isArabic = true;
                      Get.updateLocale(const Locale('ar', 'SA'));
                    } else {
                      _isArabic = false;
                      Get.updateLocale(const Locale('en', 'US'));
                    }
                  });
                },
                isSelected: _isSelected,
                children: [
                  Text(' English '),
                  Text(' العربية '),
                ],
              ),
            ),
                Text(
                  "Welcome Back".tr,
                  style: TextStyle(
                    fontFamily:
                        'dms_reguler', // Change to your desired font family
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 46, 46, 46),
                    shadows: [
                      Shadow(
                        color: Colors.grey.withOpacity(0.25),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),

                Container(
                    padding: EdgeInsets.all(20),
                    width: 300,
                    child: Image.asset(
                      loginimage,
                    )),
                // SizedBox(height: 20),
                Text(
                  "${'Sign in to Your Email And Password'.tr} ",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(106, 173, 171, 171),
                  ),
                ),
                SizedBox(height: 10),
                customTextField(
                  hint: emailHint,
                  shapicon: Icon(Icons.email_outlined),
                  title: email.tr,
                  ispass: false,
                  controller: controller.emailController,
                ),
                SizedBox(height: 10),
                customTextField(
                  shapicon: Icon(Icons.lock_outline),
                  hint: passwordHint,
                  title: password.tr,
                  ispass: true,
                  controller: controller.passwordController,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      forgetpass.tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: darkFontGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Inside your LoginScreen class

                controller.isloading.value
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(mainColor),
                      )
                    : ourButton(
                        color: mainColor,
                        title: login.tr,
                        textcolor: whiteColor,
                        onPress: () async {
                          await controller.loginMethod(context: context);
                        },
                      ),

                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignupScreen());
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: loginwith.tr,
                          style: TextStyle(
                            fontSize: 14,
                            color: fontGrey,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' ${'SignUp'.tr}', // Added space before 'Sign Up'
                          style: TextStyle(
                            fontSize: 14,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

                // ourButton(
                //   color: redColor,
                //   title: signup.tr,
                //   textcolor: whiteColor,
                //   onPress: () {
                //     Get.to(() => const SignupScreen());
                //   },

                // ),
                //  SizedBox(height: 15),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: List.generate(
                //     3,
                //     (index) => Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: CircleAvatar(
                //         radius: 25,
                //         backgroundColor: lightGrey,
                //         child: Image.asset(
                //           socialIconList[index],
                //           width: 30,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
