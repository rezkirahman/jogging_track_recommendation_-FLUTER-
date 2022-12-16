import 'package:demodemo/detailpage.dart';
import 'package:demodemo/inputuserpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'constants.dart';
import 'dataj.dart';

class Recomendation extends StatefulWidget {
  @override
  _RecomendationState createState() => _RecomendationState();
}

class _RecomendationState extends State<Recomendation> {

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < dataj.length; i += 1) {
      totalBorda[i].topsis = 0;
    }
    for (int i = 0; i < jarak.length; i += 1) {
      topsisbordaperuser(jarak[i], track[i], rating[i], currentPosition.latitude, currentPosition.longitude);
      print('-----------------------------------------------------------------------------------------------');
    }
    //topsisbordaperuser(jarak[0],track[0], rating[0], -7.94206, 112.60457);
    //topsisbordaperuser(jarak[1],track[1], rating[1], -7.94206, 112.60457);
    hasilBorda();

    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "img/LOGO.png",
            width: 80,
          ),
          backgroundColor: Colors.white12,
        ),
        body: Body(),
        backgroundColor: kBackgroundColor);
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: GridView.builder(
                itemCount: dataj.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1.2),
                itemBuilder: (context, index) => DataCard(
                  dataj: bordafinal[14-index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(datajogging: bordafinal[14-index]))),
                )))
      ],
    );
  }
}

class DataCard extends StatelessWidget {
  final Dataj dataj;
  final Function press;

  const DataCard({Key key, this.dataj, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(left:15, top:15, right: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image.asset(
                    dataj.gambar,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Container(
                height: 1,
                width: 500,
                color: Colors.white60,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left:10,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataj.nama,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        maxLines: 3,
                        //overflow: TextOverflow.ellipsis,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${dataj.rating}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          dataj.jamoperasional,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              ),
                          maxLines: 3,
                          //overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
