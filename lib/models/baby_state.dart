class BabyState {
  String state;
  Map<String, double> predictMap;

  BabyState({required this.state, required this.predictMap});

  Map<String, double> getPredictMap({int limit = 0}) {
    return predictMap;
  }
}
