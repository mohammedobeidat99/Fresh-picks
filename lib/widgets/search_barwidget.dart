import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../consts/consts.dart';
import '../controller/search_control.dart';

class SearchBarWidget extends StatelessWidget {
  final SearchBarController searchBarController = Get.put(SearchBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: searchBarController.isSearchOpen.value ? 250.0 : 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: searchBarController.isSearchOpen.value
                  ? TextField(
                      controller: searchBarController.searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...'.tr,
                        border: InputBorder.none,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(32.0),
                onTap: searchBarController.toggleSearch,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    searchBarController.isSearchOpen.value
                        ? Icons.close
                        : Icons.search,
                    color: mainColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
