//? Dashboard View
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_demo/common/styles/app_colors.dart';
import 'package:my_web_demo/common/styles/styles.dart';
import 'package:my_web_demo/static/app_strings.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DashDrawer(context: context, pageController: pageController),
      appBar: AppBar(
        backgroundColor: AppColors.kSecondaryColor,
        title: const Text(AppStrings.dashboard),
      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          _firstPage(context, color: Colors.yellow, text: 'Page 1'),
          _firstPage(context, color: Colors.orange, text: 'Page 2'),
        ],
      ),
    );
  }
}

_firstPage(BuildContext context, {required Color color, required String text}) {
  return SizedBox(
    height: 600,
    width: 500,
    child: Container(
      color: color,
      child: Center(
        child: Text(text),
      ),
    ),
  );
}

class DashDrawer extends StatelessWidget {
  final BuildContext context;
  final PageController pageController;
  const DashDrawer(
      {Key? key, required this.context, required this.pageController})
      : super(key: key);

  @override
  Widget build(context) {
    return Drawer(
      elevation: 3.0,
      child: Scrollbar(
        child: ListView(
          shrinkWrap: true,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.kPrimaryColor),
              child: Center(
                child: Text(
                  AppStrings.drawerHeader,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.kLightColor)
                      .setGFont(style: GoogleFonts.aBeeZee()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
