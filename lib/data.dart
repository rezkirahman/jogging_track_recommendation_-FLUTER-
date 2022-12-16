import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class data extends StatefulWidget {
  @override
  _dataState createState() => _dataState();
}

class _dataState extends State<data> {

  Future<List> getData() async {
    final response = await http.get("http://10.0.3.2/joggingtrack/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Datap {
  int id;
  String nama, alamat, jamoperasional, gambar;
  double rating, panjangtrack, longitude, latitude;


  Datap(
      {this.id,
        this.nama,
        this.alamat,
        this.jamoperasional,
        this.gambar,
        this.rating,
        this.panjangtrack,
        this.longitude,
        this.latitude});
}

