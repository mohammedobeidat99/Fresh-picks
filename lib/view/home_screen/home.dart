import 'package:fresh_picks/controller/home_control.dart';
import 'package:fresh_picks/view/cart_screen/cart_screen.dart';
import 'package:fresh_picks/view/home_screen/home_screen.dart';
import 'package:fresh_picks/view/settings_screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';
import '../categorie_screen/categorie_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'.tr),
      // BottomNavigationBarItem(
      //     icon: Image.asset(
      //       icCategories,
      //       width: 21,
      //     ),
      //     label: 'Categories'.tr),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'.tr),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'.tr),
    ];
    var navbody = [
      //HomeScreen(),
      CategorieScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                child: navbody.elementAt(controller.currntNavIndex.value))),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currntNavIndex.value,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            selectedItemColor: mainColor,
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items: navbarItem,
            onTap: (value) {
              controller.currntNavIndex.value = value;
            },
          ),
        ));
  }
}
