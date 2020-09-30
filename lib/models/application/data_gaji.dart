/*import 'package:puskeu/models/tunkin.dart';*/
import 'package:baru_nih/models/application/user_info.dart';

class DataGaji {
  UserInfo gaji;
  //Tunkin tunkin;

  DataGaji.fromJson(Map<String, dynamic> jsonMap)
      : gaji = UserInfo.fromJson(jsonMap["gaji"] ?? {});
        //tunkin = Tunkin.fromJson(jsonMap["tunkin"] ?? {});
}
