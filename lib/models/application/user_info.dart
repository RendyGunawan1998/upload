import 'dart:convert';

import 'package:baru_nih/models/application/satker.dart';

// OK
class UserInfo {
  Satker satker;

  String nrp;
  String nmpeg;
  String kdanak;
  String kdgol;
  String nmgol1;
  String kdjab;
  String sebutjab;
  String rekening;
  String npwp;
  String tgllhr;
  String alamat;
  String tmtpangkat;
  String bulan;
  String tahun;
  String ketgaji;
  String nogaji;
  String kdjns;
  String tglgaji;
  String kdkawin;
  String gapok;
  String tistri;
  String tanak;
  String tumum;
  String tstruktur;
  String tfungsi;
  String tpapua;
  String tpencil;
  String bulat;
  String tberas;
  String tlauk;
  String tpajak;
  String tbatas;
  String tbrevet;
  String tsandi;
  String tbabin;
  String tpolwan;
  String tkhusus;
  String potberas;
  String iwp;
  String pph;
  String sewarmh;
  String kembali;
  String utang;
  String potlain;
  String tgr;
  String kdgapok;
  String ckali;
  String blnawal;
  String thnawal;
  String blnakhir;
  String thnakhir;
  String bpjs;

  UserInfo.fromJson(Map<String, dynamic> jsonMap)
      : nrp = jsonMap["nrp"] ?? jsonMap["nip"],
        nmpeg = jsonMap["nmpeg"],
        kdanak = jsonMap["kdanak"],
        kdgol = jsonMap["kdgol"],
        nmgol1 = jsonMap["nmgol1"],
        kdjab = jsonMap["kdjab"],
        sebutjab = jsonMap["sebutjab"],
        rekening = jsonMap["rekening"],
        npwp = jsonMap["npwp"],
        tgllhr = jsonMap["tgllhr"],
        alamat = jsonMap["alamat"],
        tmtpangkat = jsonMap["tmtpangkat"],
        bulan = jsonMap["bulan"],
        tahun = jsonMap["tahun"],
        ketgaji = jsonMap["ketgaji"],
        nogaji = jsonMap["nogaji"],
        kdjns = jsonMap["kdjns"],
        tglgaji = jsonMap["tglgaji"],
        kdkawin = jsonMap["kdkawin"],
        gapok = jsonMap["gapok"],
        tistri = jsonMap["tistri"],
        tanak = jsonMap["tanak"],
        tumum = jsonMap["tumum"],
        tstruktur = jsonMap["tstruktur"],
        tfungsi = jsonMap["tfungsi"],
        tpapua = jsonMap["tpapua"],
        tpencil = jsonMap["tpencil"],
        bulat = jsonMap["bulat"],
        tberas = jsonMap["tberas"],
        tlauk = jsonMap["tlauk"],
        tpajak = jsonMap["tpajak"],
        tbatas = jsonMap["tbatas"],
        tbrevet = jsonMap["tbrevet"],
        tsandi = jsonMap["tsandi"],
        tbabin = jsonMap["tbabin"],
        tpolwan = jsonMap["tpolwan"],
        tkhusus = jsonMap["tkhusus"],
        potberas = jsonMap["potberas"] ?? jsonMap["pberas"],
        iwp = jsonMap["iwp"],
        pph = jsonMap["pph"],
        sewarmh = jsonMap["sewarmh"],
        kembali = jsonMap["kembali"],
        utang = jsonMap["utang"],
        potlain = jsonMap["potlain"],
        tgr = jsonMap["tgr"],
        kdgapok = jsonMap["kdgapok"],
        ckali = jsonMap["ckali"],
        blnawal = jsonMap["blnawal"],
        thnawal = jsonMap["thnawal"],
        blnakhir = jsonMap["blnakhir"],
        thnakhir = jsonMap["thnakhir"],
        bpjs = jsonMap["bpjs"] ?? "0",
        satker = Satker.fromJson(jsonMap["satker"] ?? {});

  Map<String, dynamic> toJson() => {
    "nrp": nrp,
    "nmpeg": nmpeg,
  };
}

UserInfo fromJson(String str) {
  var jsonData = json.decode(str);
  return UserInfo.fromJson(jsonData);
}

// data personel
//     "nmpeg": "BUDI SUWARTO",
//     "nrp": "69090091",
//     "tgllhr": "1969-09-16",
//     "kdgol": "31",
//     "nmgol1": "IPDA",
//     "kdjab": "00142",
//     "sebutjab": "KANIT RESKRIM",
//     "tmtpangkat": "2015-12-23",
//     "npwp": "698223716331000",
//     "rekening": "002001089845500",
//     "alamat": "ASPOL TELANAI PURA"
//     "kdanak": "00",

// data gaji
//     "bulan": "01",
//     "tahun": "2020",
//     "ketgaji": "POLRI BULAN JANUARI 2020",
//     "nogaji": "000423",
//     "kdjns": "1",
//     "tglgaji": "2019-12-11",
//     "kdkawin": "1102",

//     "gapok": "4031700",
//     "tistri": "403170",
//     "tanak": "161268",
//     "tumum": "0",
//     "tstruktur": "490000",
//     "tfungsi": "0",
//     "tpapua": "0",
//     "tpencil": "0",
//     "bulat": "88",
//     "tberas": "347616",
//     "tlauk": "1860000",
//     "tpajak": "54291",
//     "tbatas": "0",
//     "tbrevet": "0",
//     "tsandi": "0",
//     "tbabin": "0",
//     "tpolwan": "0",
//     "tkhusus": "0",
//     "potberas": "0",
//     "iwp": "-367691",
//     "pph": "-54291",
//     "sewarmh": "0",
//     "kembali": "0",
//     "utang": "0",
//     "potlain": "0",
//     "tgr": "0",
//     "kdgapok": "3A25",
//     "ckali": "1",
//     "blnawal": "0",
//     "thnawal": "0",
//     "blnakhir": "0",
//     "thnakhir": "0",

// total = gapok + tistri + tanak + tumum + tstruktur + tfungsi + tpapua +
//  tpencil + bulat + tberas + tlauk + tbatas + tbrevet + tsandi +
//  tbabin + tpolwan + tkhusus

//  - tpajak - iwp - pph - potberas - sewarmh - kembali - utang - potlain - tgr

// data POL
// {
//     "kdsatker": "641401",
//     "kdanak": "00",
//     "kdgol": "31",
//     "nmgol1": "IPDA",
//     "kdjab": "00142",
//     "sebutjab": "KANIT RESKRIM",
//     "nmpeg": "BUDI SUWARTO",
//     "nrp": "69090091",
//     "rekening": "002001089845500",
//     "npwp": "698223716331000",
//     "tgllhr": "1969-09-16",
//     "alamat": "ASPOL TELANAI PURA",
//     "tmtpangkat": "2015-12-23",
//     "bulan": "01",
//     "tahun": "2020",
//     "ketgaji": "POLRI BULAN JANUARI 2020",
//     "nogaji": "000423",
//     "kdjns": "1",
//     "tglgaji": "2019-12-11",
//     "kdkawin": "1102",
//     "gapok": "4031700",
//     "tistri": "403170",
//     "tanak": "161268",
//     "tumum": "0",
//     "tstruktur": "490000",
//     "tfungsi": "0",
//     "tpapua": "0",
//     "tpencil": "0",
//     "bulat": "88",
//     "tberas": "347616",
//     "tlauk": "1860000",
//     "tpajak": "54291",
//     "tbatas": "0",
//     "tbrevet": "0",
//     "tsandi": "0",
//     "tbabin": "0",
//     "tpolwan": "0",
//     "tkhusus": "0",
//     "potberas": "0",
//     "iwp": "367691",
//     "pph": "54291",
//     "sewarmh": "0",
//     "kembali": "0",
//     "utang": "0",
//     "potlain": "0",
//     "tgr": "0",
//     "kdgapok": "3A25",
//     "ckali": "1",
//     "blnawal": "0",
//     "thnawal": "0",
//     "blnakhir": "0",
//     "thnakhir": "0",
//     "satker": {
//         "kdsatker": "641401",
//         "nmsatker": "POLRESTA JAMBI",
//         "kduappaw": "060011000KD",
//         "polda": {
//             "kduappaw": "060011000KD",
//             "nmuappaw": "POLDA JAMBI",
//             "latitude": "-1.6120199000",
//             "longitude": "103.6221936000",
//             "namabank": null,
//             "norek": null
//         }
//     }
// }

// data PNS
// {
//     "kdsatker": "641241",
//     "kdanak": "01",
//     "kdgol": "34",
//     "nmgol1": "III/d",
//     "kdjab": "00132",
//     "nmpeg": "DESI KURNIASIH,SH",
//     "nip": "198012012006042004",
//     "rekening": "002001087795505",
//     "npwp": "781054861331000",
//     "tgllhr": "1980-12-01",
//     "alamat": "JL.LINGKAR SELATAN RT 27 N0 24 PAAL MERAH LAMA",
//     "tmtpangkat": "2018-04-01",
//     "bulan": "12",
//     "tahun": "2019",
//     "ketgaji": "DESEMBER 2019",
//     "nogaji": "000336",
//     "kdjns": "1",
//     "tglgaji": "2019-11-19",
//     "kdkawin": "1102",
//     "gapok": "3518100",
//     "tistri": "351810",
//     "tanak": "140724",
//     "tumum": "0",
//     "tstruktur": "980000",
//     "tfungsi": "0",
//     "tpapua": "0",
//     "tpencil": "0",
//     "bulat": "60",
//     "tberas": "289680",
//     "tlauk": "0",
//     "tpajak": "583436",
//     "tbatas": "0",
//     "tbrevet": "0",
//     "tsandi": "0",
//     "tbabin": "0",
//     "tpolwan": "0",
//     "tkhusus": "0",
//     "potberas": "0",
//     "iwp": "320850",
//     "pph": "583436",
//     "sewarmh": "0",
//     "kembali": "0",
//     "utang": "0",
//     "potlain": "0",
//     "tgr": "0",
//     "kdgapok": "3D12",
//     "ckali": "1",
//     "blnawal": "0",
//     "thnawal": "0",
//     "blnakhir": "0",
//     "thnakhir": "0",
//     "satker": {
//         "kdsatker": "641241",
//         "nmsatker": "SPRIPIM POLDA JAMBI",
//         "kduappaw": "060011000KD",
//         "polda": {
//             "kduappaw": "060011000KD",
//             "nmuappaw": "POLDA JAMBI",
//             "latitude": "-1.6120199000",
//             "longitude": "103.6221936000",
//             "namabank": null,
//             "norek": null
//         }
//     }
// }

// beda fieldnya hanya nrp => nip saja
