class Polda {
  String kduappaw;
  String nmuappaw;
  String latitude;
  String longitude;

  Polda.fromJson(Map<String, dynamic> jsonMap)
      : kduappaw = jsonMap["kduappaw"],
        nmuappaw = jsonMap["nmuappaw"] ?? "",
        latitude = jsonMap["latitude"] ?? "0.0",
        longitude = jsonMap["longitude"] ?? "0.0";

  Map<String, dynamic> toJson() => {
    "kduappaw": kduappaw,
    "nmuappaw": nmuappaw,
  };
}
