import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'data/data.dart';
import 'res/res.dart';
import 'utils/navigators/navigators.dart';
import 'utils/utils.dart';

// Files to import
// connectivity_plus, device_info_plus, flutter_screenutil, flutter_secure_storage, get, http, package_info_plus, shared_preferences

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.lazyPut(SharedPreferencesManager.new);
  Get.put<DBWrapper>(DBWrapper()).init();
  Get.put<ApiWrapper>(ApiWrapper());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.purple),
          getPages: AppPages.pages,
          initialRoute: AppPages.initial,
        ),
      );
}
