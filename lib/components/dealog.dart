import 'package:get/get.dart';

import '../consts/consts.dart';

class  LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      content: Column(
         
        mainAxisSize: MainAxisSize.min,
        children: [

         Row(children: [ const Icon(Icons.language), 
         25.widthBox,
         
      Text('Change Language'.tr, style: const TextStyle(color: mainColor ,fontFamily: semibold),),],),
          ListTile(
            title:const Text('English'),
            onTap: () {
              Get.updateLocale(const Locale('en', 'US'));
              Get.back();
            },
          ),
          ListTile(
            title:const  Text('العربية'),
            onTap: () {
              Get.updateLocale( const Locale('ar', 'SA'));
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
