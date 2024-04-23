class Validator {
  static String? validateEmail(String? email) {
    if (email == null) return 'Необходимо заполнить поле';

    const String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    if (!RegExp(pattern).hasMatch(email.trim())) return 'Некорректный email';

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) return 'Необходимо заполнить поле';

    if (password.trim().length < 6) {
      return 'Пароль должен содержать не менее 6 символов';
    }

    return null;
  }

  static String? validateName(String? name) {
    if (name == null) return 'Необходимо заполнить поле';
    if (name.trim().length < 3) return 'Необходимо ввести не менее 3 символов';

    return null;
  }
}
