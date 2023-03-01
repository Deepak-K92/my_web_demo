import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_demo/common/styles/styles.dart';
import 'package:my_web_demo/common/widgets/icon_logo.dart';
import 'package:my_web_demo/screens/widgets/background_widget.dart';
import 'package:my_web_demo/static/app_strings.dart';

import '../common/styles/app_colors.dart';
import '../common/widgets/custom_2_colors_button_widget.dart';
import 'pages/login.dart';

class Directing extends StatefulWidget {
  const Directing({super.key});

  @override
  State<Directing> createState() => _DirectingState();
}

class _DirectingState extends State<Directing> {
  late ScrollController _scrollController;
  late PageController _pageController;
  late TextEditingController usernameController, passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 2.0);
    _pageController = PageController(initialPage: 0);
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 33, 49),
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: IconLogoWidget(),
        ),
        bottomOpacity: 0.0,
        elevation: 4.0,
        title: const Text(AppStrings.title),
      ),
      body: BackGroundWidget(
        context: context,
        widget: Center(
          child: Scrollbar(
            thickness: 10,
            interactive: true,
            controller: _scrollController,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              pageSnapping: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconLogoWidget(size: size.aspectRatio * 100),
                    Padding(
                        padding: EdgeInsets.only(top: size.aspectRatio * 20)),
                    _textLayout(size: size),
                    Padding(
                        padding: EdgeInsets.only(top: size.aspectRatio * 20)),
                    Custom2ColorsButtonWidget(
                        size: size,
                        primary: AppColors.kSecondaryColor,
                        secondary: AppColors.kPrimaryAccemntColor,
                        text: AppStrings.getStarted,
                        onPressed: () {},
                        textColor: AppColors.kPrimaryAccemntColor)
                  ],
                ),
                Form(
                  child: LoginPage(
                    key: _formKey,
                    size: size,
                    usernameController: usernameController,
                    passwordController: passwordController,
                    onSubmit: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_textLayout({required Size size}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: AppStrings.its.giveGap(),
          style: AppCustomTextStyles().mainHeaderTextStyle.copyWith(
            color: Colors.white,
            fontSize: size.aspectRatio * 50,
            fontStyle: FontStyle.normal,
            shadows: [
              const BoxShadow(color: Colors.grey, offset: Offset(1, 1))
            ],
          ).setGFont(style: GoogleFonts.adventPro()),
        ),
        TextSpan(
          text: AppStrings.title.giveGap().giveExclamation(),
          style: AppCustomTextStyles()
              .mainHeaderTextStyle
              .copyWith(fontSize: size.aspectRatio * 50)
              .setGFont(
                style: GoogleFonts.habibi(),
              ),
        ),
      ],
    ),
  );
}
