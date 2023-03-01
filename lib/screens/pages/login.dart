import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_demo/common/styles/app_colors.dart';
import 'package:my_web_demo/common/styles/styles.dart';
import 'package:my_web_demo/common/validators/validators.dart';
import 'package:my_web_demo/static/app_strings.dart';

import 'widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Size size;

  final Function() onSubmit;
  const LoginPage({
    super.key,
    required this.size,
    required this.usernameController,
    required this.passwordController,
    required this.onSubmit,
  });

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
                usernameController: widget.usernameController,
                passwordController: widget.passwordController,
                context: context,
                onPressed: widget.onSubmit,
                size: size,
              ),
              SignUpPart(
                usernameController: widget.usernameController,
                passwordController: widget.passwordController,
                context: context,
                onPressed: widget.onSubmit,
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
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function() onPressed;
  final Size size;
  final BuildContext context;
  const LoginPart({
    super.key,
    required this.context,
    required this.size,
    required this.usernameController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  State<LoginPart> createState() => _LoginPartState();
}

class _LoginPartState extends State<LoginPart> {
  final _key = GlobalKey<FormState>();
  late Size size;

  @override
  Widget build(BuildContext context) {
    setState(() {
      setState(() => size = widget.size);
    });
    return Row(
      children: [
        Expanded(
          child: Center(
              child: Container(
            padding: EdgeInsets.symmetric(
                vertical: size.aspectRatio * 1,
                horizontal: size.aspectRatio * 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(
                  size: size,
                  controller: widget.usernameController,
                  obscureText: false,
                  labelText: "Enter Username",
                  validator: (val) => Validator().validateTextFieldIfEmpty(val),
                ),
                InputField(
                  size: size,
                  controller: widget.passwordController,
                  obscureText: true,
                  labelText: "Enter Password",
                  validator: (val) => Validator().validateTextFieldIfEmpty(val),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      widget.onPressed;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 5.0,
                      minimumSize:
                          Size(size.aspectRatio * 10, size.aspectRatio * 10),
                      padding: EdgeInsets.all(size.aspectRatio * 10),
                      backgroundColor: AppColors.kPrimaryAccemntColor),
                  child: Text(
                    AppStrings.login,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.aspectRatio * 10)
                        .setGFont(style: GoogleFonts.aboreto()),
                  ),
                )
              ],
            ),
          )),
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

class SignUpPart extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function() onPressed;
  final Size size;
  final BuildContext context;
  const SignUpPart({
    super.key,
    required this.context,
    required this.size,
    required this.usernameController,
    required this.passwordController,
    required this.onPressed,
  });

  @override
  State<SignUpPart> createState() => _SignUpPartState();
}

class _SignUpPartState extends State<SignUpPart> {
  late Size size;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    setState(() {
      setState(() => size = widget.size);
    });
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.signUp,
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
                  child: Icon(Icons.app_registration_rounded,
                      size: size.aspectRatio * 50,
                      color: AppColors.kSecondaryAccemntColor),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
              child: Container(
            padding: EdgeInsets.symmetric(
                vertical: size.aspectRatio * 1,
                horizontal: size.aspectRatio * 10),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputField(
                    size: size,
                    controller: widget.usernameController,
                    obscureText: false,
                    labelText: "Enter Username",
                    validator: (val) =>
                        Validator().validateTextFieldIfEmpty(val),
                  ),
                  InputField(
                    size: size,
                    controller: widget.passwordController,
                    obscureText: true,
                    labelText: "Enter Password",
                    validator: (val) =>
                        Validator().validateTextFieldIfEmpty(val),
                  ),
                  InputField(
                    size: size,
                    controller: widget.passwordController,
                    obscureText: true,
                    labelText: "Confirm Password",
                    validator: (val) =>
                        Validator().validateTextFieldIfEmpty(val),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        widget.onPressed;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        minimumSize:
                            Size(size.aspectRatio * 10, size.aspectRatio * 10),
                        padding: EdgeInsets.all(size.aspectRatio * 10),
                        backgroundColor: AppColors.kPrimaryAccemntColor),
                    child: Text(
                      AppStrings.signUp,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.aspectRatio * 10)
                          .setGFont(style: GoogleFonts.aboreto()),
                    ),
                  )
                ],
              ),
            ),
          )),
        ),
      ],
    );
  }
}
