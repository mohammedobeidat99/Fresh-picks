import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';
import '../../consts/firebase_const.dart';
import '../auth_screen/login_screen.dart';
import '../home_screen/home.dart';
import '../home_screen/home_screen.dart';
import '../introduction/intro.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();

    // Future.delayed(const Duration(seconds: 4), () {
    //   Get.off(const Home());
    // });
    changeScreen();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              icSplashBg,
              width: 30,
            ),
          ),
          100.heightBox,
          //SizedBox(height: 100,),

          

          100.heightBox,
          ScaleTransition(
              scale: _animation,
              child: Column( mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  Container(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Make the container circular
            color: Colors.grey[200], // Set the background color of the container
          ),
          child: ClipOval(
            child: Image.asset(
              icAppLogo, // Replace with your image path
              fit: BoxFit.cover, // Adjust the image fit
            ),
          ),
        
      
    ),
                  appname.text.fontFamily(bold).size(22).white.make(),
                ],
              )
              //
              ),
              15.heightBox,
          appversion.text.white.make(),
          const Spacer(),
          credits.text.white.fontFamily(semibold).make(),
          30.heightBox,
        ],
      ),
      // backgroundColor: Color.fromARGB(255, 63, 236, 153),
      // body: Column( mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child:
      //         //const FlutterLogo(size: 200),
      //       ),
      //     ),
      //     10.heightBox,

      //   appname.text.fontFamily(bold).size(22).white.make(),
      //   10.heightBox,
      //   appversion.text.white.make(),
      //  // const Spacer(),
      //   300.heightBox,
      //   credits.text.white.fontFamily(semibold).make(),

      //   ],
      // ),
    );
  }

  changeScreen() {
    Future.delayed(const Duration(seconds: 4), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() =>  TestScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }
}
