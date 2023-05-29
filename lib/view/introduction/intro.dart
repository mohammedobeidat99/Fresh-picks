import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_picks/consts/colors.dart';
import 'package:fresh_picks/consts/consts.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:lottie/lottie.dart';

import '../../consts/images.dart';
import '../auth_screen/login_screen.dart';



class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      titleTextStyle: TextStyle(color: mainColor ,fontFamily: semibold,fontSize: 26,),
      title: 'Fresh Picks ' ,
      subTitle: 'Explore top organic fruts & grab them',subTitleTextStyle: TextStyle(fontSize: 18,color: Colors.grey,),
      imageUrl: icAppLogo,
      

    ),
    Introduction(
      titleTextStyle: TextStyle(color: mainColor,fontFamily: semibold,fontSize: 26,),
      title: 'Shop from our store',
      subTitle: 'Enjoy our fresh products',subTitleTextStyle: TextStyle(fontSize: 18,color: Colors.grey,),
      imageUrl: 'assets/images/intro.jpeg',
    ),
    
    Introduction(
      titleTextStyle: TextStyle(color: mainColor,fontFamily: semibold,fontSize: 26,),
      title: 'Welcome Application',
      subTitle: 'Fresh vegetables&fruits ',subTitleTextStyle: TextStyle(fontSize: 18,color: Colors.grey,),
      imageUrl: 'assets/images/DeliveryArrived.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: Colors.white,
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}