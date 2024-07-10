import 'package:flutter/cupertino.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:fresh_picks/consts/consts.dart';
import 'package:fresh_picks/view/auth_screen/login_screen.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color kDarkBlueColor = secondaryColor;

    return OnBoardingSlider(
      finishButtonText: 'Continue',
      onFinish: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: kDarkBlueColor,
      ),
      skipTextButton: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),

     

      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        SizedBox(
          width: 400,
          child: Image.asset(
            intro1,
            height: 500,
            //width: 400,
          ),
        ),
        SizedBox(
          width: 400,
          child: Image.asset(
            intro2,
            height: 400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: SizedBox(
            width: 400,
            child: Lottie.asset('assets/lottie/intro1.json', width: 200)
                .box
                .roundedFull
                .size(300, 300)
                .padding(EdgeInsets.all(8))
                .roundedFull
                .make(),
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 450,
              ),
              Text(
                'Shop Easily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'By discovering our lowest prices, shopping has become easier than ever.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 450,
              ),
              Text(
                'Shop Quietly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'We only care about the best products, ensuring that every product meets quality standards and the lowest prices.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 450,
              ),
              Text(
                'Start now ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome to Snapshop where your perfect find is just a click away.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
