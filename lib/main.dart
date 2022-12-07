import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'controller/themeNotifier.dart';
import 'views/home_tabbar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //providers:ChangeNotifierProvider(create: (_) =>            ThemeNotifier()),
      providers: [
        ChangeNotifierProvider(create: (_) =>            ThemeNotifier()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
           return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
             //theme:notifier.dark! ? "Your dark theme" : "Your light theme",

             home: HomeTabbarScreen(),
          );
        }
      ),
    );
  }
}

