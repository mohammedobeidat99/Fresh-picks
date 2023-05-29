import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_picks/consts/firebase_const.dart';
import 'package:fresh_picks/consts/list.dart';
import 'package:fresh_picks/controller/auth_control.dart';
import 'package:fresh_picks/view/auth_screen/login_screen.dart';
import 'package:fresh_picks/view/settings_screen/edit_profile.dart';
import 'package:fresh_picks/view/settings_screen/support_page.dart';
import 'package:fresh_picks/widgets/bg_widget.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/dealog.dart';
import '../../components/detals_card.dart';
import '../../consts/consts.dart';
import '../../controller/profile_control.dart';
import '../../services/firestore_services.dart';
import '../../widgets/custom_button_title.dart';
import 'about_screen.dart';
import 'map_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedLanguage = 'en';

  void changeLanguage(String language) {
    Get.updateLocale(Locale(language));
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
        child: Scaffold(
      body: StreamBuilder(
          stream: Firestoreservices.getUser(currntUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(mainColor)),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                  child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Stack(alignment: Alignment.topRight, children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: whiteColor)),
                          onPressed: () async {
                            await Get.put(AuthCotroller())
                                .signoutMethod(context);
                          },
                          child:
                              logout.tr.text.fontFamily(semibold).white.make()),
                      Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            15.heightBox,
                            Container(height: 140,
                              child:
                            data['imageUrl'] == ''
                                ? Image.asset(
                                    imgnot,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make()
                                : Image.network(
                                    data['imageUrl'],
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make(),),
                            10.heightBox,
                            "${data['name']}"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            5.heightBox,
                            "${data['email']}"
                                .text
                                .white
                                .fontFamily(semibold)
                                .make(),
                            5.heightBox,
                          ]).box.makeCentered(),
                    ]),
                    50.heightBox,
                    //20.heightBox,
                    customTitle(
                        title: Profiletitle[0].tr,
                        i: ProfileButtonsIcons[0],
                        onPress: () {
                          //Get.to(()=> const EditProfileScreen());
                          controller.nameController.text = data['name'];
                          controller.passController.text = data['password'];
                          Get.to(() => EditProfileScreen(
                                data: data,
                                email: data['email'],
                                number: data['number'],
                                addres: data['addres'],
                              ));
                        }),
                    customTitle(
                        title: Profiletitle[1].tr,
                        i: ProfileButtonsIcons[1],
                        onPress: () {
                          Get.to(() => AboutPage());
                        }),
                    customTitle(
                        title: Profiletitle[2].tr,
                        i: ProfileButtonsIcons[2],
                        onPress: () {
                          Get.to(() => SupportPage());
                        }),
                    customTitle(
                        title: Profiletitle[3].tr,
                        i: ProfileButtonsIcons[3],
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => LanguageDialog(),
                          );
                        }),
                    customTitle(
                        title: Profiletitle[4].tr,
                        i: ProfileButtonsIcons[4],
                        onPress: () {
                          launchWebsite();
                        }),

                    customTitle(
                        title: Profiletitle[5],
                        i: ProfileButtonsIcons[5],
                        onPress: () {
                          Get.to(() => LocationScreen());
                        }),
                  ],
                ),
              ));
            }
          }),
    ));
  }

  void launchWebsite() async {
    const url = 'https://www.htu.edu.jo/#/'; // Replace with your website URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        'Error',
        'Failed to launch website.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
