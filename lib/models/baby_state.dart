class BabyState {
  late String state;
  late Map<String, double> predictMap;

  BabyState({required this.state, required this.predictMap});

  BabyState.fromJson(Map<String, dynamic> json) {
    var stateMap = json['stateMap'];
    predictMap = {};
    var keys = stateMap.keys.toList();

    while (keys.isNotEmpty) {
      String maxKey = keys[0];
      for (var key in keys) {
        if (stateMap[key]! > stateMap[maxKey]!) {
          maxKey = key;
        }
      }
      predictMap[maxKey] = stateMap[maxKey];
      stateMap.remove(maxKey);
      keys.remove(maxKey);
    }
    state = predictMap.keys.toList()[0];
  }

  Map<String, double> getPredictMap({int? limit}) {
    var keys = predictMap.keys.toList();
    limit ??= keys.length;

    Map<String, double> returnMap = {};
    for (var i = 0; i < limit; i++) {
      returnMap[keys[i]] = predictMap[keys[i]]!;
    }
    return returnMap;
  }
}
