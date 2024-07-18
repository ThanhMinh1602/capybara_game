class GridConfigModel {
  final int gridSize;
  final int numPairs;
  final double maxScore;
  final int tries;
  final int matchCount;

  GridConfigModel({
    required this.maxScore,
    required this.gridSize,
    required this.numPairs,
    required this.tries,
    required this.matchCount,
  });
}
