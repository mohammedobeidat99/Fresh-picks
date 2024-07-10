import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fresh_picks/consts/consts.dart';
import 'package:fresh_picks/view/home_screen2/home.dart';
import 'package:fresh_picks/view/introduction/intro.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    // Animation for logo and spinner
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    
    // Start animation
    _controller.forward();

    // Call the function to check user login status after animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkUserLoginStatus();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Animated logo with shadow
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    Logoapp,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Adding some spacing
            // Loading circle animation with animated opacity
            FadeTransition(
              opacity: _animation,
              child: SpinKitCircle(
                color: mainColor,
                size: 40.0,
              ),
            ),
            SizedBox(height: 20),
            TyperAnimatedTextKit(
              text: ['Welcome Snapshop'],
              textStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: mainColor
              ),
              textAlign: TextAlign.center,
              speed: Duration(milliseconds: 100),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkUserLoginStatus() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      // User is logged in, navigate to home screen using GetX
      Get.offAll(() => Home());
    } else {
      // User is not logged in, navigate to onboarding screen using GetX
      Get.offAll(() => OnBoarding());
    }
  }
}
