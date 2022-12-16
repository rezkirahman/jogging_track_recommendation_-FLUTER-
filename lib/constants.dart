import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dataj.dart';

const kBackgroundColor = Color(0xff232323);
const kButtonColor = Color(0xFF8CE0FC);
Position currentPosition;
int user;
List<TotalBorda> totalBorda = [
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
  TotalBorda(topsis: 0.0),
];
List<Dataj> bordafinal;

getPosition(){
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) {
    currentPosition = position;
  });

}

hasilBorda() {
  bordafinal = dataj;
  for (int i = 0; i < dataj.length; i += 1) {
    var a = totalBorda[i].topsis*10000;
    int temp = a.toInt();
    bordafinal[i].id = temp;
  }
  print("----------------");
  bordafinal.sort((a, b) => a.id.compareTo(b.id));
  for (int i = 0; i < dataj.length; i += 1) {
    print("${bordafinal[i].id}. ${bordafinal[i].nama}");
  }

}

class TotalBorda {
  double topsis;
  TotalBorda({this.topsis});
}

class Borda {
  double ci;
  int rank;
  int borda;
  Borda(this.ci, this.rank, this.borda);
}

topsisbordaperuser(
    double valueJarak,
    double valueTrack,
    double valueRating,
    double lat,
    double lon,
    ) async {
  List<double> normalisasiJarak = List<double>(15);
  List<double> normalisasiTrack = List<double>(15);
  List<double> normalisasiRating = List<double>(15);
  List<double> normalisasiJarakT = List<double>(15);
  List<double> normalisasiTrackT = List<double>(15);
  List<double> normalisasiRatingT = List<double>(15);
  List<double> selisihjarak = List<double>(15);
  List<double> siPlus = List<double>(15);
  List<double> siMin = List<double>(15);
  List<double> ciPlus = List<double>(15);
  List<double> jumlahSi = List<double>(15);
  List<Borda> pengali = [];
  List<double> borda = List<double>(15);

  radians(double degree) {
    var radian = degree * (pi / 180);
    return radian;
  }

  //Selisih Jarak
  print("-----JARAK-----");
  for (int i = 0; i < dataj.length; i += 1) {
    var selisih = acos(
        cos(radians(90 - dataj[i].latitude)) * cos(radians(90 - lat)) +
            sin(radians(90 - dataj[i].latitude)) *
                sin(radians(90 - lat)) *
                cos(radians(dataj[i].longitude - lon))) *
        6371;
    selisihjarak[i] = selisih;
    print("jarak ${i + 1} : ${selisihjarak[i]}");
  }
  print("----------------------");

  //---PEMBAGI----
  double jumlahJarak = 0.0, jumlahTrack = 0.0, jumlahRating = 0.0;
  double kolomJarak = 0.0, kolomTrack = 0.0, kolomRating = 0.0;
  for (int i = 0; i < dataj.length; i += 1) {
    jumlahJarak += pow(selisihjarak[i], 2);
    jumlahTrack += pow(dataj[i].panjangtrack, 2);
    jumlahRating += pow(dataj[i].rating, 2);
  }
  kolomJarak = sqrt(jumlahJarak);
  kolomTrack = sqrt(jumlahTrack);
  kolomRating = sqrt(jumlahRating);
  print("pembagi");
  print("jarak : $kolomJarak,  track : $kolomTrack,  rating: $kolomRating");

  //----NORMALISASI-----
  print("------NORMALISASI------");
  for (int i = 0; i < dataj.length; i += 1) {
    normalisasiJarak[i] = selisihjarak[i] / kolomJarak;
    normalisasiTrack[i] = dataj[i].panjangtrack / kolomTrack;
    normalisasiRating[i] = dataj[i].rating / kolomRating;
    print(
        "j : ${normalisasiJarak[i]},t: ${normalisasiTrack[i]},r: ${normalisasiRating[i]}");
  }
  print("---------------------");

  //---NORMALISASI TERBOBOT---
  print("---NORMALISASI TERBOBOT---");
  for (int i = 0; i < dataj.length; i += 1) {
    normalisasiJarak[i] =
        normalisasiJarak[i] * valueJarak; // bobotJarakNormalisasi;
    normalisasiTrack[i] =
        normalisasiTrack[i] * valueTrack; //bobotTrackNormalisasi;
    normalisasiRating[i] =
        normalisasiRating[i] * valueRating; //bobotRatingNormalisasi;

    normalisasiJarakT[i] = normalisasiJarak[i];
    normalisasiTrackT[i] = normalisasiTrack[i];
    normalisasiRatingT[i] = normalisasiRating[i];
    print(
        "j : ${normalisasiJarakT[i]},t: ${normalisasiTrackT[i]},r: ${normalisasiRatingT[i]}");
  }
  print("---------------------");

  // ---------A+ DAN A- ----------
  List<double> j, t, r;
  double aPlusJarak, aPlusTrack, aPlusRating;
  double aminJarak, aMinTrack, aMinRating;
  j = normalisasiJarak;
  t = normalisasiTrack;
  r = normalisasiRating;
  j.sort();
  t.sort();
  r.sort();
  //---- A+ -----
  aPlusJarak = j[0];
  aPlusTrack = t[14];
  aPlusRating = r[14];
  print("j : $aPlusJarak,t: $aPlusTrack,r: $aPlusRating");
  //----- A- ----
  aminJarak = j[14];
  aMinTrack = t[0];
  aMinRating = r[0];
  print("j: $aminJarak,t: $aMinTrack,r: $aMinRating");
  print("----------------------");

  //------- Si+ & Si- -------
  print("------- Si+ & Si- -------");
  double siplus = 0, simin = 0;
  for (int i = 0; i < dataj.length; i += 1) {
    double pj = normalisasiJarakT[i] - aPlusJarak;
    double pr = normalisasiTrackT[i] - aPlusTrack;
    double pt = normalisasiRatingT[i] - aPlusRating;
    siplus = pow(pj, 2) + pow(pr, 2) + pow(pt, 2);
    simin = pow((normalisasiJarakT[i] - aminJarak), 2) +
        pow((normalisasiTrackT[i] - aMinTrack), 2) +
        pow((normalisasiRatingT[i] - aMinRating), 2);
    siplus = sqrt(siplus);
    simin = sqrt(simin);
    siPlus[i] = siplus;
    siMin[i] = simin;
    jumlahSi[i] = siPlus[i] + siMin[i];
    print("Si+: ${siPlus[i]},Si-: ${siMin[i]},jum : ${jumlahSi[i]}");
  }
  print("----------------------");

  //---------Ci+----------//
  print("-------Ci+ -------");
  for (int i = 0; i < dataj.length; i += 1) {
    ciPlus[i] = siMin[i] / jumlahSi[i];
    print("Ci+: ${ciPlus[i]}");
  }
  print("----------------------");

  //------pengali-------
  print("------pengali------");

  for (int i = 0; i < dataj.length; i += 1) {
    int a = 15;
    pengali.add(Borda(ciPlus[i], a - i, i + 1));
  }
  pengali.sort((a, b) => a.ci.compareTo(b.ci));

  for (int i = 0; i < dataj.length; i += 1) {
    pengali[i].borda= i+1;

    print(
        "rank: ${pengali[i].rank}, borda : ${pengali[i].borda}, data : ${pengali[i].ci}");
  }
  //----Borda-----
  print("-----BORDA-----");
  for (int i = 0; i < dataj.length; i += 1) {
    for (int j = 0; j < dataj.length; j += 1) {
      if (ciPlus[i] == pengali[j].ci){
        borda[i] = ciPlus[i] * pengali[j].borda;
      }
    }
    print("borda: ${borda[i]}");
  }
  print("----------------------");
  for (int i = 0; i < dataj.length; i += 1) {
    totalBorda[i].topsis += borda[i];
    print("tborda: ${totalBorda[i].topsis}");
  }
  //==============================================
  normalisasiJarak = null;
  normalisasiTrack = null;
  normalisasiRating = null;
  normalisasiJarakT = null;
  normalisasiTrackT = null;
  normalisasiRatingT = null;
  selisihjarak = null;
  siPlus = null;
  siMin = null;
  ciPlus = null;
  jumlahSi = null;
  pengali = null;
  borda = null;
}
