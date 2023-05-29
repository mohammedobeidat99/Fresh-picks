import 'dart:ui';

import 'package:get/get_navigation/src/root/internacionalization.dart';

class TranslationService extends Translations {
  static final locale = Locale('en', 'US');
  static final fallbackLocale = Locale('ar', 'SA');

  static final langs = ['en', 'ar'];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'Support': 'Support',
          'About': 'About',
          'Edit Profile': 'Edit Profile',
          'Home': 'Home',
          'Cart': 'Cart',
          'Settings': 'Settings',
          "Language":'Language',
          'Logout':'Logout',
          'Categories':'Categories',
          'Total':'Total',
          'Aboutus':'About As',
          'empty':'Cart is empty',
          
        },
        'ar_SA': {
          'hello': 'مرحبا',
          'Support': 'دعم',
          'About': 'حول',
          'Edit Profile': 'تعديل الملف الشخصي',
          'Home': 'الرئيسية',
          'Cart': 'العربة',
          'Settings': 'الأعدادت',
          "Language":'اللغة',
          'Logout':'خروج',
          'Categories':'المعرض',
          'Total':'المجموع',
          'Aboutus':'من نحن',
          'empty':'العربة فارغة'
        },
      };
}
