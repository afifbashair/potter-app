import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/app_pages.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('favorites');

  runApp(const MyApp());
}

Future<bool> checkLogin() async {

  SharedPreferences prefs =
      await SharedPreferences.getInstance();

  return prefs.getBool('isLogin') ?? false;
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Potter App',

      home: FutureBuilder<bool>(

        future: checkLogin(),

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return Scaffold(
              body: Center(
                child:
                    CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.data == true) {
            return HomeView(username: AutofillHints.username,);
          }

          return LoginView();
        },
      ),

      getPages: AppPages.routes,
    );
  }
}