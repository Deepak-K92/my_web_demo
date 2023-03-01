extension Validators on String? Function(String?)? {
  String? validateTextFieldIfEmpty(String? val) {
    if (val!.isEmpty) return 'Field is Empty';
    return null;
    // if (val!.length > StaticVal.size_30)
    //   return Static.validationIsGreaterThan30;
  }
}

class Validator {
  String? validateTextFieldIfEmpty(String? val) {
    if (val!.isEmpty) return 'Field is Empty';
    return null;
  }
}
