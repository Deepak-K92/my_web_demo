import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_demo/common/styles/app_colors.dart';
import 'package:my_web_demo/common/styles/styles.dart';
import 'package:my_web_demo/static/app_strings.dart';

class LoginPage extends StatefulWidget {
  final Size size;
  const LoginPage({super.key, required this.size});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TabController controller;
  late Size size;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    size = widget.size;
  }

  @override
  Widget build(BuildContext context) {
    setState(() => size = widget.size);
    return Center(
      child: SizedBox(
        height: size.height * 0.80,
        width: size.width * 0.80,
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.4),
          appBar: TabBar(
            indicatorColor: AppColors.kPrimaryAccemntColor,
            controller: controller,
            tabs: [
              Tab(
                child: Text(
                  AppStrings.login,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 20, color: Colors.white)
                      .setGFont(style: GoogleFonts.abel()),
                ),
              ),
              Tab(
                child: Text(
                  AppStrings.signUp,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 20, color: Colors.white)
                      .setGFont(style: GoogleFonts.abel()),
                ),
              ),
            ],
          ),
          body: TabBarView(
            controller: controller,
            children: [
              LoginPart(
                context: context,
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPart extends StatefulWidget {
  final Size size;
  final BuildContext context;
  const LoginPart({
    super.key,
    required this.context,
    required this.size,
  });

  @override
  State<LoginPart> createState() => _LoginPartState();
}

class _LoginPartState extends State<LoginPart> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    setState(() {
      setState(() => size = widget.size);
    });
    return Row(
      children: [
        const Expanded(
          child: Center(
            child: Text('Login Part'),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.login,
                  style: TextStyle(
                          color: AppColors.kPrimaryAccemntColor,
                          fontSize: size.aspectRatio * 20)
                      .setGFont(
                    style: GoogleFonts.notoSansJavanese(),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.aspectRatio * 10)),
                CircleAvatar(
                  radius: size.aspectRatio * 50,
                  backgroundColor: AppColors.kPrimaryAccemntColor,
                  child: Icon(Icons.login_rounded,
                      size: size.aspectRatio * 50,
                      color: AppColors.kSecondaryAccemntColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
