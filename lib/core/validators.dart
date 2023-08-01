class Validator {
  //Private constructor
  Validator._();
  //Instantiation of the class
  static final Validator _instance = Validator._();
  //Handle for calling it
  factory Validator() => _instance;

  String? emailValidator(String? input) {
    if (input == null || input.isEmpty) {
      return 'Email field cannot be empty';
    } else if (input.length < 6) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }
}
