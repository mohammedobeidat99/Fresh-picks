import 'package:firebase_core/firebase_core.dart';
import 'package:fresh_picks/consts/consts.dart';
import 'package:fresh_picks/translations/localization.dart';
import 'package:fresh_picks/view/splash_screen/splash_screen2.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: TranslationService(),
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales:
            TranslationService.langs.map((lang) => Locale(lang, '')).toList(),
        title: appname,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: darkFontGrey),
            backgroundColor: Colors.white,
          ),
          fontFamily: regular,
        ),
        home: SplashScreen2() 
        );
  }
}
