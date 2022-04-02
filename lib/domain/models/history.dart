

class History {

  final String date;
  final int wordExploredCount;
  final int wordToExploreCount;
  final bool awardWasReceived;


  History({
    required this.date,
    this.wordExploredCount = 0,
    this.wordToExploreCount = 10,
    this.awardWasReceived = false
  });

  @override
  String toString() {
    return 'History{data: $date, wordExploredCount: $wordExploredCount, wordExploringCount: $wordToExploreCount, awardWasReceived: $awardWasReceived}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is History &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          wordExploredCount == other.wordExploredCount &&
          wordToExploreCount == other.wordToExploreCount &&
          awardWasReceived == other.awardWasReceived;

  @override
  int get hashCode =>
      date.hashCode ^
      wordExploredCount.hashCode ^
      wordToExploreCount.hashCode ^
      awardWasReceived.hashCode;
}