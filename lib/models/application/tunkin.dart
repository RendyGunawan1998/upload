import 'package:baru_nih/models/application/tunkin_potongan.dart';

class Tunkin {
  String nrp;
  String namaLengkap;
  String tahunbulan;
  String pangkat;
  String jabatan;
  String klasjabatan;
  String nilaitunkin;
  String potongantunkin;
  String persenpotongan;
  String kdsatker;
  String nmsatker;
  String kduappaw;
  String nmuappaw;

  List<TunkinPotongan> potongan;

  Tunkin.fromJson(Map<String, dynamic> jsonMap)
      : nrp = jsonMap["nrp"],
        namaLengkap = jsonMap["namaLengkap"],
        tahunbulan = jsonMap["tahunbulan"],
        pangkat = jsonMap["pangkat"],
        jabatan = jsonMap["jabatan"],
        klasjabatan = jsonMap["klasjabatan"],
        nilaitunkin = jsonMap["nilaitunkin"],
        potongantunkin = jsonMap["potongantunkin"],
        persenpotongan = jsonMap["persenpotongan"],
        kdsatker = jsonMap["kdsatker"],
        nmsatker = jsonMap["nmsatker"],
        kduappaw = jsonMap["kduappaw"],
        nmuappaw = jsonMap["nmuappaw"],
        potongan = jsonMap['potongan'] == null
            ? []
            : List<TunkinPotongan>.from(jsonMap['potongan']
            .map((data) => TunkinPotongan.fromJson(data)));

  Map<String, dynamic> toJson() => {
    "nrp": nrp,
  };
}
