
import 'package:bankingassistant/logic/Bar.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: new BoxDecoration(

            // image: new DecorationImage(
            //     fit: BoxFit.contain, image: AssetImage('assets/calLogo.png')),
            // color: Colors.redAccent[100]
            ),
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
                         new Container(child: new Barchart(buy: 4.85,sell: 5.08,currency: "USD",)),
                         new Container(child: new Barchart(buy: 6.42,sell: 6.63,currency: "GBP",)),
                         new Container(child: new Barchart(buy: 5.583,sell: 5.74,currency: "EUR",)),
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
            showInfo('Current Account', "rate -0.05%"),
            showInfo("Flexi save Account", "rate 9%"),
            showInfo("Fixed Deposit Account", "rate 10%"),
            showInfo("'Cal Motor Insurance'", "rate 30%"),
            showInfo("CalBank Student Account", "rate 19%")
          ],
        ));
  }
  Widget showInfo(String title, subtitle) {
    if (subtitle == "") {
      return new Container(
        child: new Card(
                    elevation: 5.0,

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
          elevation: 5.0,
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
