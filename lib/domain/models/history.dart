

class History {

  final String data;
  final int wordCount;
  final bool wasWordsExplored;


  History({
    required this.data,
    required this.wordCount,
    required this.wasWordsExplored
  });

  @override
  String toString() {
    return 'History{data: $data, wordCount: $wordCount, wasWordsExplored: $wasWordsExplored}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is History &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          wordCount == other.wordCount &&
          wasWordsExplored == other.wasWordsExplored;

  @override
  int get hashCode =>
      data.hashCode ^ wordCount.hashCode ^ wasWordsExplored.hashCode;
}