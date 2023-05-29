import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final RxString selectedLanguage = ''.obs;

  Future<void> selectLanguage(String language) async {
    selectedLanguage.value = language;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('selectedLanguage', language);
  }

  Future<void> loadSelectedLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    final language = preferences.getString('selectedLanguage');
    if (language != null) {
      selectedLanguage.value = language;
    }
  }
}
