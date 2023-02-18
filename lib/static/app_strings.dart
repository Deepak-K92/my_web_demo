class AppStrings {
  static const String title = 'Bloody Riveting';
  static const String hello = 'Hello';
  // static const String title = 'Bloody Riveting';
}

extension StringExtensions on String {
  String giveGap() => '$this ';
  String giveExclamation() => '$this!';
}
