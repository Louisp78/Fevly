final Kemail_pattern =
    RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
final Kpassword_pattern = RegExp(
    r"^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$");
const String special_characters = r'!@#$&*';
final Knumber_pattern = RegExp(r'[0-9]');
final Kletters_pattern = RegExp(r'[a-zA-Z]');

bool passwordValidate(String? value) {
  return !value!.contains(Knumber_pattern) ||
      !value.contains(Kletters_pattern) ||
      value.length < 8;
}
