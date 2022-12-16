import 'package:demodemo/constants.dart';
import 'package:demodemo/recomendationpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dataj.dart';

class InputPreference extends StatefulWidget {
  @override
  _InputPreferenceState createState() => _InputPreferenceState();
}

class _InputPreferenceState extends State<InputPreference> {
  @override
  void initState() {
    jarak.clear();
    track.clear();
    rating.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    jarak.clear();
    track.clear();
    rating.clear();
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/background.png"),
                fit: BoxFit.fitHeight,
              )),
            ),
            Body(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kButtonColor,
          splashColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Recomendation()));
          },
          child: Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ));
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: GridView.builder(
          itemCount: user,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 0, childAspectRatio: 1.1),
          itemBuilder: (context, index) => PreferenceCard(
            memberKe: index,
          ),
        ))
      ],
    );
  }
}

class PreferenceCard extends StatefulWidget {
  final int memberKe;
  const PreferenceCard({Key key, this.memberKe}) : super(key: key);

  @override
  _PreferenceCardState createState() => _PreferenceCardState();
}

class _PreferenceCardState extends State<PreferenceCard> {
  TextEditingController controllerjarak = TextEditingController(text: "0.3");
  TextEditingController controllertrack = TextEditingController(text: "0.3");
  TextEditingController controllerrating = TextEditingController(text: "0.4");
  @override
  void dispose() {
    controllerjarak.dispose();
    controllerrating.dispose();
    controllertrack.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //double jarakm, trackm, ratingm;
    jarak.add(null);
    track.add(null);
    rating.add(null);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Text(
                      "Set Preferences",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    child: Text(
                      "Member ${widget.memberKe + 1}",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      controller: controllerjarak,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      decoration: InputDecoration(
                          labelText: "Jarak : ",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      controller: controllertrack,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      decoration: InputDecoration(
                          labelText: "Track :",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      controller: controllerrating,
                      keyboardType: TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      decoration: InputDecoration(
                          labelText: "Rating : ",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Peringatan",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " : total dari input preferensi maksimal adalah 1",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.5)),
                    child: FlatButton(
                      /* onPressed: () {
                        var jarakm = double.parse(controllerjarak.text);
                        var trackm = double.parse(controllerjarak.text);
                        var ratingm = double.parse(controllerjarak.text);
                        var total = jarakm + trackm + ratingm;
                        if (total == 1) {
                          jarak[widget.memberKe] =
                              double.parse("${controllerjarak.text}");
                          track[widget.memberKe] =
                              double.parse("${controllertrack.text}");
                          rating[widget.memberKe] =
                              double.parse("${controllerrating.text}");
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("saved"),
                                backgroundColor: Colors.white.withOpacity(0.8),
                              );
                            },
                          );
                        }
                        else{
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("input salah. periksa kembali inputan anda"),
                                backgroundColor: Colors.white.withOpacity(0.8),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ), */
                      onPressed: () {
                          jarak[widget.memberKe] =
                              double.parse("${controllerjarak.text}");
                          track[widget.memberKe] =
                              double.parse("${controllertrack.text}");
                          rating[widget.memberKe] =
                              double.parse("${controllerrating.text}");
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("saved"),
                                backgroundColor: Colors.white.withOpacity(0.8),
                              );
                            },
                          );
                        },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
