class TunkinPotongan {
  String nrp;
  String tahunbulan;
  String kdpotongan;
  String namapotongan;
  String jumlahhari;
  String totalpersen;
  String totalrupiah;

  TunkinPotongan.fromJson(Map<String, dynamic> jsonMap)
      : nrp = jsonMap["nrp"],
        tahunbulan = jsonMap["tahunbulan"],
        kdpotongan = jsonMap["kdpotongan"],
        namapotongan = jsonMap["namapotongan"],
        jumlahhari = jsonMap["jumlahhari"],
        totalpersen = jsonMap["totalpersen"],
        totalrupiah = jsonMap["totalrupiah"] ?? "0.0";
}
