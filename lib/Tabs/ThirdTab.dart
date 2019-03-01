import 'package:bankingassistant/logic/Bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.contain, image: AssetImage('assets/ecoLogo.png')),
            color: Colors.red[200]),
        child: new ListView(
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
                          buy: 4.87,
                          sell: 5.08,
                          currency: "USD",
                        )),
                        new Container(
                            child: new Barchart(
                          buy: 5.08,
                          sell: 5.89,
                          currency: "GBP",
                        )),
                        new Container(
                            child: new Barchart(
                          buy: 6.03,
                          sell: 6.38,
                          currency: "EUR",
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
            showInfo("Student Account", "15% interest"),
            showInfo('Current Account', "-0.05% interest"),
            showInfo('Savings Account', "0.05% interest"),
            showInfo("Personal Investment plan", "13.4% interest"),
            showInfo('Business Investment plan', "20.1% interest"),
            showInfo("Mimfra Account", "10% interest"),
            showInfo('Treasury bill', "14.18")
          ],
        ));
  }

  Widget showInfo(String title, subtitle) {
    if (subtitle == "") {
      return new Container(
        child: new Card(
            color: Colors.white.withOpacity(0.8),
            child: new ListTile(
              title: new Text(
                title,
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
      );
    } else {
      return new Container(
        child: new Card(
            color: Colors.white.withOpacity(0.8),
            child: new ListTile(
              title: new Text(
                title,
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: new Text(subtitle),
            )),
      );
    }
  }
}
