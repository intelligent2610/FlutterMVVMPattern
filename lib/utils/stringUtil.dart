String format(String template, List<Object> arguments) {
  String result = "";
  int argumentsIndex = 0;
  for (int index = 0; index < template.length; index++) {
    if (template.codeUnitAt(index) == 37 /* ascii '%' */) {
      result += arguments[argumentsIndex++].toString();
    } else {
      result += template.substring(index, index + 1);
    }
  }
  return result;
}

String validateName(String value) {
  if (value.isEmpty) return 'Name is required.';
  final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
  if (!nameExp.hasMatch(value))
    return 'Please enter only alphabetical characters.';
  return null;
}

String validateUserName(String value) {
  if (value.isEmpty) return 'Name is required.';
  return null;
}

String validateEmail(String value) {
  if (value.isEmpty) return 'Email is required.';
  final RegExp nameExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
  if (!nameExp.hasMatch(value)) return 'Invalid email address';
  return null;
}

String validatePassword(String value) {
  if (value.isEmpty) return 'Please choose a password.';
  return null;
}

String validateRePassword(String pass, String repass) {
  if (repass != pass) return 'Repassword not match with Password.';
  return null;
}
