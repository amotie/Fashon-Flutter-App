class Validation {
  static bool emailValidation(String value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool passwordValidation(String value) {
    if (RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$").hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool userValidation(String value) {
    if (RegExp(r"^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$")
        .hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool confermPasswordValidation(String value, String password) {
    if (value == password) {
      return false;
    } else {
      return true;
    }
  }


  static List checkDropMenu(List items) {
    print(items);
    List newItems;
    newItems = items.toSet().toList();
    return newItems;
  }
}
