import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_demo/common/styles/styles.dart';
import 'package:my_web_demo/common/widgets/icon_logo.dart';
import 'package:my_web_demo/screens/widgets/background_widget.dart';
import 'package:my_web_demo/static/app_routers.dart';
import 'package:my_web_demo/static/app_strings.dart';

import '../common/styles/app_colors.dart';
import '../common/widgets/custom_2_colors_button_widget.dart';

class Directing extends StatefulWidget {
  const Directing({super.key});

  @override
  State<Directing> createState() => _DirectingState();
}

class _DirectingState extends State<Directing> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const IconLogoWidget(size: 150),
              _textLayout(size: size),
              Padding(padding: EdgeInsets.only(top: size.aspectRatio * 20)),
              Custom2ColorsButtonWidget(
                  size: size,
                  primary: Colors.black,
                  secondary: AppColors.kPrimaryColor,
                  text: 'Login',
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRouters.dashboard),
                  textColor: AppColors.kPrimaryColor)
            ],
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
          text: AppStrings.hello.giveGap(),
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
