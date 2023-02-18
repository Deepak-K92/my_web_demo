class AppStrings {
  //? Directing Screen
  static const String title = 'Bloody Riveting';
  static const String its = 'It\'s';
  static const String getStarted = 'Get Started';

  //? Login
  static const String login = 'Login';
  static const String signUp = 'Sign Up';
}

extension StringExtensions on String {
  String giveGap() => '$this ';
  String giveExclamation() => '$this!';
}
