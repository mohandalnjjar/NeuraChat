abstract class Validators {
  //email validator
  static String? emailValidator(String? value) {
    if (RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value!)) {
      return null;
    } else {
      return "enter a valid email";
    }
  }

  //Password validator
  static String? passwordValidator(String? value) {
    if (RegExp(r'^(?=.*[A-Za-z])(?=.*\d).+$').hasMatch(value!)) {
      return null;
    } else {
      return "Strong valid password";
    }
  }

  //name validator
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Corrct Name';
    } else if (value.length < 3 || value.length > 20) {
      return 'Enter Name between 3 to 20 characters';
    } else {
      return null;
    }
  }

  //description Validator
  static String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a description';
    } else if (value.length < 15) {
      return 'Description must be at least 15 characters long';
    } else if (value.length > 500) {
      return 'Description must be 500 characters or less';
    } else {
      return null;
    }
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^\+?\d{1,4}?[ -]?\(?\d{1,3}?\)?[ -]?\d{1,4}[ -]?\d{1,4}[ -]?\d{1,9}$')
            .hasMatch(value)) {
      return 'Please enter your phone number';
    } else if (value.length < 7 || value.length > 15) {
      return 'Phone number should be between 7 to 15 digits';
    } else {
      return null;
    }
  }

//address Validator
  static String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid address';
    } else if (value.length < 10 || value.length > 100) {
      return 'Enter an address between 10 to 100 characters';
    } else if (!RegExp(r'^[a-zA-Z0-9\s,.-]+$').hasMatch(value)) {
      return 'Address contains invalid characters';
    } else {
      return null;
    }
  }
}
