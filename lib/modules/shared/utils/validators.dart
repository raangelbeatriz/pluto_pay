class Validators {
  Validators._();

  static bool isNotEmpty(String? text) {
    return text != null && text.isNotEmpty;
  }
}
