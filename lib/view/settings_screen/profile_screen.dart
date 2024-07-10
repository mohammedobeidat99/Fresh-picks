import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_picks/consts/list.dart';
import 'package:fresh_picks/controller/auth_control.dart';
import 'package:fresh_picks/controller/location_control.dart';
import 'package:fresh_picks/view/settings_screen/edit_profile.dart';
import 'package:fresh_picks/view/settings_screen/support_page.dart';
import 'package:fresh_picks/widgets/bg_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../components/dealog.dart';
import '../../consts/consts.dart';
import '../../controller/profile_control.dart';
import '../../controller/websitecontrol.dart';
import '../../widgets/custom_button_title.dart';
import 'about_screen.dart';
import 'order_hestory.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? currentUser;
  late Stream<DocumentSnapshot> userDataStream;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      userDataStream = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    final WebsiteController _websiteController = Get.put(WebsiteController());

    return Scaffold(
      backgroundColor: Colors.white, // New background color
      body: Stack(
        children: [
          bgWidget(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Profile'.tr,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 20),
                  StreamBuilder<DocumentSnapshot>(
                    stream: userDataStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(mainColor),
                          ),
                        );
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: Text('No data available'),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        var data = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: data['imageUrl'] == ''
                                      ? AssetImage(imgnot) as ImageProvider
                                      : NetworkImage(data['imageUrl']),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                         color: Colors.white
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      data['email'],
                                      style: TextStyle(
                                        fontSize: 16,
                                         color: Colors.white
                                        
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 150.0),
                            customTitle(
                              title: Profiletitle[0].tr,
                              i: ProfileButtonsIcons[0],
                              onPress: () {
                                Get.to(() => EditProfileScreen(
                                      data: data,
                                      email: data['email'],
                                    ));
                              },
                            ),
                            customTitle(
                              title: Profiletitle[1].tr,
                              i: ProfileButtonsIcons[1],
                              onPress: () {
                                Get.to(() => AboutPage());
                              },
                            ),
                            customTitle(
                              title: Profiletitle[2].tr,
                              i: ProfileButtonsIcons[2],
                              onPress: () {
                                Get.to(() => SupportPage());
                              },
                            ),
                            customTitle(
                              title: Profiletitle[3].tr,
                              i: ProfileButtonsIcons[3],
                              onPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => LanguageDialog(),
                                );
                              },
                            ),
                            customTitle(
                              title: Profiletitle[4].tr,
                              i: ProfileButtonsIcons[4],
                              onPress: () {
                                _websiteController.openWebsite();
                              },
                            ),
                            customTitle(
                              title: Profiletitle[5].tr,
                              i: ProfileButtonsIcons[5],
                              onPress: () {
                                _openMaps();
                              },
                            ),
                            customTitle(
                              title: Profiletitle[6].tr,
                              i: ProfileButtonsIcons[6],
                              onPress: () {
                                Get.to(() => OrderHistoryPage());
                              },
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            right: 10,
            child: OutlinedButton(
              onPressed: () async {
                await Get.put(AuthController()).signoutMethod(context);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
              ),
              child: Text(
                'Logout'.tr,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openMaps() async {
    try {
      final LocationController locationController =
          Get.put(LocationController());

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Open maps app
      locationController.openMapsApp(position);

      // Upload to Firestore
      locationController.uploadToFirestore(position);
    } catch (e) {
      print(e.toString());
    }
  }
}
