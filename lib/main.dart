import 'package:flutter/material.dart';
import 'package:my_web_demo/common/styles/app_colors.dart';
import 'package:my_web_demo/screens/directing.dart';
import 'package:my_web_demo/static/app_routers.dart';
import 'package:my_web_demo/static/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: AppColors.kPrimaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black.withOpacity(0.2),
        ),
      ),
      initialRoute: AppRouters.directing,
      routes: {
        AppRouters.directing: (context) => const Directing(),
      },
    );
  }
}
