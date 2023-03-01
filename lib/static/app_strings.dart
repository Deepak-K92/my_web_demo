class AppStrings {
  static const String title = 'Bloody Riveting';
  static const String hello = 'Hello';

  //? DASHBOARD
  static const String dashboard = 'Dashboard';
  static const String drawerHeader = 'Drawer Header';
}

extension StringExtensions on String {
  String giveGap() => '$this ';
  String giveExclamation() => '$this!';
}
