import 'dart:math';

String generateRandomPseudo({required String prefix, required int length}) {
  final String alphabet = 'abcdefghijklmnopqrstuvwxyz';
  final String numbers = '0123456789';
  final String symbols = '_';
  final String allChars = symbols + numbers;
  final String randomString = String.fromCharCodes(
    List.generate(
      length,
      (index) => allChars.codeUnitAt(Random().nextInt(allChars.length)),
    ),
  );
  return '$prefix$randomString';
}

void main() {
  print(generateRandomPseudo(prefix: 'louis', length: 3));
}
