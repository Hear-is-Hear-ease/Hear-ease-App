class BabyState {
  String state;
  Map<String, double>? predictMap;

  BabyState({required this.state, this.predictMap});

  Map<String, double> getPredictMap({int limit = 0}) {
    if (predictMap == null) {
      throw 'predictMap not exist';
    }
    return predictMap!;
  }
}
