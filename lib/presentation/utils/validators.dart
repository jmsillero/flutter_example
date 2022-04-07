class Validators {
  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) return "The email can not be empty";

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(input.trim())) {
      return 'Please check your email!';
    }
    return null;
  }

  /// Check if the password length is less than 4 characters
  String? validatePassword(String? input) {
    if (input == null || input.isEmpty) return "The email can not be empty";

    if (input.length < 4) {
      return "Password can not be less than 4 characters";
    }
    return null;
  }
}
