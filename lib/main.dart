import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toppicks/routes.dart';
import 'package:toppicks/service_locator.dart';
import 'package:toppicks/src/views/dashboard/dashboard.dart';

import 'bindings.dart';

void main() async {
// get_it setup
  setUp();

// get storage
  await GetStorage.init('utils');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: Routes.getRoutes(),
      initialBinding: InitDependencies(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
        fontFamily: 'Poppins',

        // colorScheme: ColorScheme(
        //     primary: primary,
        //     primaryVariant: primaryVariant,
        //     secondary: secondary,
        //     secondaryVariant: secondaryVariant,
        //     surface: surface,
        //     background: background,
        //     error: error,
        //     onPrimary: onPrimary,
        //     onSecondary: onSecondary,
        //     onSurface: onSurface,
        //     onBackground: onBackground,
        //     onError: onError,
        //     brightness: brightness),
      ),
      home: const Dashboard(),
    );
  }
}
