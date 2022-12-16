import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dataj.dart';

class Body extends StatelessWidget {
  final Dataj dataj;

  const Body({Key key, this.dataj}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          //GAMBAR
          padding: const EdgeInsets.all(6.0),
          child: Container(
            width: 300,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                dataj.gambar,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
        Padding(
          //NAMA
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(dataj.nama,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
        ),
        Padding(
          //RATING
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.white54,
                ),
                Text("${dataj.rating}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text("Address",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(dataj.alamat,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white54,
                  //fontWeight: FontWeight.w100,
                )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text("Operational Hours",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(dataj.jamoperasional,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white54,
                  //fontWeight: FontWeight.w100,
                )
            ),
          ),
        ),
      ],
    );
  }
}
