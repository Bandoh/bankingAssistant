import 'package:bankingassistant/logic/Bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
            // image: new DecorationImage(
            //     fit: BoxFit.contain, image: AssetImage('assets/ecoLogo.png')),
color: Colors.purple[200]),        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(10.0),
              child: new Container(
                child: new Card(
                    color: Colors.white,
                    elevation: 5.0,
                    child: CarouselSlider(
                      items: [
                        new Container(
                            child: new Barchart(
                          buy: 4.50,
                          sell: 5.0,
                          currency: "USD",
                        )),
                        new Container(
                            child: new Barchart(
                          buy: 6.4,
                          sell: 6.6,
                          currency: "GBP",
                        )),
                        new Container(
                            child: new Barchart(
                          buy: 5.5,
                          sell: 5.7,
                          currency: "ROT",
                        )),
                      ],
                      viewportFraction: 1.0,
                      initialPage: 0,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: Duration(seconds: 10),
//   onPageChanged: callbackFunction,
                    )),
                height: MediaQuery.of(context).size.height / 3,
                decoration: new BoxDecoration(
                    // color: Colors.redAccent,
                    ),
              ),
            ),
            showInfo("Student Account", ""),
            showInfo('Current Account', "GHS10.00 monthly charge\nGHS5 ATM monthly charge"),
            showInfo('Savings Account', "3% interest"),
            showInfo("Cooperate Account", ""),
            showInfo("Joint Account", ""),
            showInfo("Minor Account", ""),
            showInfo('CalBank Student Account', ""),
             showInfo('Treasury bill', "14.6285%")
          ],
        ));
  }

  Widget showInfo(String title, subtitle) {
    if (subtitle == "") {
      return new Container(
        child: new Card(
            color: Colors.white.withOpacity(0.8),
            child: new ListTile(
              title: new Text(title,style: new TextStyle(
                fontWeight: FontWeight.bold
              ),),
            )),
      );
    } else {
      return new Container(
        child: new Card(
            color: Colors.white.withOpacity(0.8),
            child: new ListTile(
              title: new Text(title,style: new TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: new Text(subtitle),
            )),
      );
    }
  }
}
