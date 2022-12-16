import 'package:demodemo/constants.dart';
import 'package:demodemo/dataj.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'detailpagebody.dart';

class DetailPage extends StatelessWidget {
  final Dataj datajogging;
  const DetailPage({Key key, this.datajogging}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "img/LOGO.png",
          width: 80,
        ),
        backgroundColor: Colors.white12,
      ),
      body: Stack(
        children: [
          Body(dataj: datajogging,),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: FlatButton(
                    onPressed: () async {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  maps(data: datajogging))); */
                      var coords = Coords(datajogging.latitude, datajogging.longitude);
                      if (await MapLauncher.isMapAvailable(MapType.google)) {
                      await MapLauncher.launchMap(
                      mapType: MapType.google,
                      coords: coords,
                      title: "",
                      description: "",
                      );
                      }else{
                        CircularProgressIndicator();
                      }
                    },
                    //color: kButtonColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions,
                          size: 27.0,
                          color: Colors.white,
                        ),
                        Text(
                          " Direction",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              alignment: Alignment.bottomCenter,
            ),
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}
