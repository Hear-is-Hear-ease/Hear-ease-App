import 'package:hear_ease_app/models/detail_info.dart';

abstract class DetailInfoLang {
  late DetailInfo diaperInfo;
  late DetailInfo hungryInfo;
  late DetailInfo awakeInfo;
  late DetailInfo hugInfo;
  late DetailInfo sadInfo;
  late DetailInfo sleepyInfo;
  late DetailInfo uncomfortableInfo;

  DetailInfo getDetailInfo(String state) {
    switch (state.toLowerCase()) {
      case 'diaper':
        return diaperInfo;
      case 'hungry':
        return hungryInfo;
      case 'awake':
        return awakeInfo;
      case 'hug':
        return hugInfo;
      case 'sad':
        return sadInfo;
      case 'sleepy':
        return sleepyInfo;
      case 'uncomfortable':
        return uncomfortableInfo;
      default:
        throw "Unknown type of baby state";
    }
  }
}
