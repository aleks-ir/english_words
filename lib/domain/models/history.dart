

class History {

  String date;
  int wordExploringCount;
  int wordRepeatingCount;
  int wordToExploreCount;
  bool awardWasReceived;


  History({
    required this.date,
    this.wordExploringCount = 0,
    this.wordRepeatingCount = 0,
    this.wordToExploreCount = 10,
    this.awardWasReceived = false
  });

  @override
  String toString() {
    return 'History{data: $date, wordExploredCount: $wordExploringCount, wordExploringCount: $wordToExploreCount, awardWasReceived: $awardWasReceived}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is History &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          wordExploringCount == other.wordExploringCount &&
          wordToExploreCount == other.wordToExploreCount &&
          awardWasReceived == other.awardWasReceived;

  @override
  int get hashCode =>
      date.hashCode ^
      wordExploringCount.hashCode ^
      wordToExploreCount.hashCode ^
      awardWasReceived.hashCode;
}