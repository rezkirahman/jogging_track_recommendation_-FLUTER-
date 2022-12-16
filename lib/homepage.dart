import 'package:demodemo/detailpage.dart';
import 'package:demodemo/inputuserpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'constants.dart';
import 'dataj.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map<PermissionGroup, PermissionStatus> permissions;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
  }

void getPermission() async {
  permissions = await PermissionHandler().requestPermissions([
    PermissionGroup.location,
    PermissionGroup.locationAlways
  ]);
}

  @override
  Widget build(BuildContext context) {
    getPosition(); //get user position
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
            Body(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: FlatButton(
                    onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InputUser()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.group,
                          size: 27.0,
                          color: Colors.white,
                        ),
                        Text(
                          " Cari Rekomendasi",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
        ),
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
                    childAspectRatio: 2.5),
                itemBuilder: (context, index) => DataCard(
                      dataj: dataj[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(datajogging: dataj[index]))),
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
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    dataj.gambar,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        dataj.nama,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        maxLines: 3,
                        //overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 27.0,
                            color: Colors.amber,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${dataj.rating}",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Spacer()
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
