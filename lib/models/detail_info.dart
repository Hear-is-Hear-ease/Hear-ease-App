class DetailInfo {
  String state;
  Map<String, double> predictionMap;
  String iconPath;
  String iconDesc;
  String iconTitle;
  String description;

  DetailInfo({
    required this.state,
    this.predictionMap = const {'': 0, ' ': 0},
    required this.iconPath,
    required this.iconDesc,
    required this.iconTitle,
    required this.description,
  });

  void updatePredictionMap(Map<String, double> predictMap) =>
      predictionMap = predictMap;
}
