import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurants_app/app/core/app_config/app_config.dart';
import 'app/core/constants/app_size..dart';
import 'app/core/themes/app_theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  // 🟢 ১. সবার আগে ফ্লাটার বাইন্ডিং সুনিশ্চিত করতে হবে
  WidgetsFlutterBinding.ensureInitialized();

  // 🟢 ২. এরপর GetStorage ইনিশিয়ালাইজ করতে হবে
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,

      // ── Theme ──
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,

      // ── Navigation ──
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      transitionDuration: AppDuration.normal,
    ),
  );
}