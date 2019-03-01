import 'package:bankingassistant/Tabs/FirstTab.dart';
import 'package:bankingassistant/Tabs/SecondTab.dart';
import 'package:bankingassistant/Tabs/ThirdTab.dart';
import 'package:flutter/material.dart';
class BanksHome extends StatefulWidget {
  @override
  _BanksHomeState createState() => _BanksHomeState();
}
  TabController tabController =
      new TabController(vsync: AnimatedListState(), length: 3, initialIndex: 0);
class _BanksHomeState extends State<BanksHome> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('HomePage'),
                 bottom: new TabBar(
            //  isScrollable: true,
            controller: tabController,
            tabs: <Widget>[
              new Container(
                child: new Tab(
                  child: new Text(
                    'Cal Bank',
                    style: new TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              ),
               new Container(
                child: new Tab(
                  child: new Text(
                    'Ecobank',
                    style: new TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              ),
              new Container(
                child: new Tab(
                  child: new Text(
                    'ADB',
                    style: new TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              ),
            ]
      ),
      ),
      body: new Container(
        child: new TabBarView(  
          controller: tabController,
          children: <Widget>[
            new FirstTab(),
            new SecondTab(),
            new ThirdTab(),
          ],
        ),
      ),
    );
  }
}