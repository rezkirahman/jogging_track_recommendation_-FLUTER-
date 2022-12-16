import 'package:demodemo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:geolocator/geolocator.dart';
import 'inputpreferencepage.dart';

class InputUser extends StatefulWidget {
  @override
  _InputUserState createState() => _InputUserState();
}

class _InputUserState extends State<InputUser> {
  int _counter = 1;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if(_counter==1){
        return _counter;
      }else{
        return _counter--;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 10),
                child: Container(
                  child: new Image.asset("img/LOGO.png", width: 120),
                  alignment: AlignmentDirectional.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text("How many of you want to join?",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          wordSpacing: 0.5,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: FlatButton(
                          onPressed: incrementCounter,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                    Spacer(),
                    Container(
                      width: 80,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: Text(
                        '$_counter',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: FlatButton(
                          onPressed: decrementCounter,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          )),
                    ),
                    Spacer()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kButtonColor),
                  child: FlatButton(
                    onPressed: () {
                      user=_counter;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputPreference()));
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
