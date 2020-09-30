import 'package:baru_nih/models/application/polda.dart';

class Satker {
  String kdsatker;
  String nmsatker;
  String kduappaw;
  Polda polda;

  Satker.fromJson(Map<String, dynamic> jsonMap)
      : kdsatker = jsonMap["kdsatker"],
        nmsatker = jsonMap["nmsatker"] ?? "",
        kduappaw = jsonMap["kduappaw"] ?? "",
        polda = Polda.fromJson(jsonMap["polda"] ?? {});

  Map<String, dynamic> toJson() => {
    "kdsatker": kdsatker,
    "nmsatker": nmsatker,
  };
}
