import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../consts/consts.dart';

class SearchBarController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxBool isSearchOpen = false.obs;

  void toggleSearch() {
    isSearchOpen.value = !isSearchOpen.value;
    if (!isSearchOpen.value) {
      searchController.clear();
    }
  }
}
