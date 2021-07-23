bool containsInString(String source, String comparator) {
  final List<String> sourceList = source.split('');
  for (final String element in sourceList) {
    if (comparator.contains(element)) {
      return true;
    }
  }
  return false;
}
