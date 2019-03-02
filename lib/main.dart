import 'package:bankingassistant/db/MongoDB.dart';
import 'package:bankingassistant/screens/BanksHome.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bankingassistant/db/MySQL.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.redAccent,
        textTheme: TextTheme(
            body1: TextStyle(
                color: Colors.cyan,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
                shadows: [new Shadow(color: Colors.black)]),
            body2: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.red,
              fontSize: 18.0,
            )),
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AssetImage backg = new AssetImage('assets/backg.jpg');
  AssetImage icon = new AssetImage('assets/appicon.png');

  bool hasAccount = true;

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  // MySQL mySQL = new MySQL(
  //     // host: '192.168.43.227', //for real devices
  //     // host: '192.168.122.1', //for virtual devices
  //     host: 'localhost',
  //     port: 3306,
  //     dataBaseName: 'banking',
  //     password: '',
  //     username: 'root');
  MongoDB mongoDB = new MongoDB();
  void database() async {
    // await mySQL.connect();
    // mySQL.tableHandler();
  }

  @override
  void initState() {
    database();
    mongoDB.initMongo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        backgroundColor: Colors.cyanAccent,
        body: new AnimatedCrossFade(
          crossFadeState:
              hasAccount ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: new Duration(milliseconds: 300),
          firstChild: firstChild(),
          secondChild: secondChild(),
        ));
  }

  Widget firstChild() {
    return new Stack(
      children: <Widget>[
        new Container(
            decoration: new BoxDecoration(
          image: new DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.cyanAccent.withOpacity(.08), BlendMode.dstATop),
            image: backg,
            fit: BoxFit.fitHeight,
          ),
        )),
        new Center(
          child: new Container(
              padding: EdgeInsets.only(),
              child: new Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                child: new Form(
                  child: new ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        height: 90.0,
                        child: new Image(
                          image: icon,
                        ),
                      ),
                      Center(
                          child: new Container(
                        child: TypewriterAnimatedTextKit(
                          duration: new Duration(milliseconds: 3000),
                          isRepeatingAnimation: false,
                          onTap: () {
                            print("Tap Event");
                          },
                          text: ['Bank AD/S'],
                          textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 50.0,
                              fontFamily: "d"),
                        ),
                      )),
                      new Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0),
                      ),
                      new Container(
                        child: new TextFormField(
                          style: Theme.of(context).textTheme.body2,
                          autocorrect: true,
                          controller: username,
                          decoration: new InputDecoration(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.redAccent,
                            ),
                            labelText: 'Username',
                            labelStyle: Theme.of(context).textTheme.body2,
                          ),
                        ),
                      ),
                      new Container(
                        child: new TextFormField(
                          style: Theme.of(context).textTheme.body2,
                          autocorrect: true,
                          obscureText: true,
                          controller: password,
                          decoration: new InputDecoration(
                            icon: Icon(Icons.lock, color: Colors.redAccent),
                            labelText: 'password',
                            labelStyle: Theme.of(context).textTheme.body2,
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 50.0),
                      ),
                      new Container(
                        height: 60.0,
                        width: double.infinity,
                        child: new RaisedButton(
                          color: Colors.white,
                          // shape: new RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(30.0)),
                          onPressed: () async {
                            // await mySQL.getUser(username.text, password.text);
                            // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                            //   builder: ((c){
                            //     return new BanksHome();
                            //   })
                            // ));
                            await mongoDB.initMongo();
                            await mongoDB.createCollection();
                            bool checker = await mongoDB.checkCred(
                                username.text, password.text);
                            if (checker) {
                              Navigator.of(context).pushReplacement(
                                  new MaterialPageRoute(builder: ((c) {
                                return new BanksHome();
                              })));
                            }
                          },
                          child: new Text(
                            'Login',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      new Container(
                        height: 60.0,
                        width: double.infinity,
                        child: new OutlineButton(
                          color: Colors.white,
                          // shape: new RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(30.0)),
                          onPressed: () async {
                            setState(() {
                              hasAccount = false;
                            });
                          },
                          child: new Text(
                            'Register',
                            style: Theme.of(context).textTheme.body1,
                          ),
                          borderSide: BorderSide(
                              width: 1.3,
                              style: BorderStyle.solid,
                              color: Theme.of(context).accentColor),
                        ),
                      )
                    ],
                  ),
                ),
              )
              //),
              ),
        )
      ],
    );
  }

  Widget secondChild() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.cyanAccent.withOpacity(.08), BlendMode.dstATop),
          image: backg,
          fit: BoxFit.fitHeight,
        ),
      ),
      child: new Center(
        child: new Container(
            padding: EdgeInsets.only(),
            child: new Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: new Form(
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      height: 90.0,
                      child: new Image(
                        image: icon,
                      ),
                    ),
                    Center(
                        child: new Container(
                      child: TypewriterAnimatedTextKit(
                        duration: new Duration(milliseconds: 3000),
                        isRepeatingAnimation: false,
                        onTap: () {
                          print("Tap Event");
                        },
                        text: ['Bank AD/S'],
                        textStyle: TextStyle(
                            color: Colors.red, fontSize: 50.0, fontFamily: "d"),
                      ),
                    )),
                    new Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                    ),
                    new Container(
                      child: new TextFormField(
                        style: Theme.of(context).textTheme.body2,
                        autocorrect: true,
                        controller: username,
                        decoration: new InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.redAccent,
                          ),
                          labelText: 'Username',
                          labelStyle: Theme.of(context).textTheme.body2,
                        ),
                      ),
                    ),
                    new Container(
                      child: new TextFormField(
                        style: Theme.of(context).textTheme.body2,
                        autocorrect: true,
                        obscureText: true,
                        controller: password,
                        decoration: new InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.redAccent,
                          ),
                          labelText: 'password',
                          labelStyle: Theme.of(context).textTheme.body2,
                        ),
                      ),
                    ),
                    new Container(
                      child: new TextFormField(
                        style: Theme.of(context).textTheme.body2,
                        autocorrect: true,
                        controller: email,
                        decoration: new InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.redAccent,
                          ),
                          labelText: 'email',
                          labelStyle: Theme.of(context).textTheme.body2,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 50.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    new Container(
                      height: 60.0,
                      width: double.infinity,
                      child: new OutlineButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () async {
                          // await mySQL.registerUser(
                          //     username.text, password.text, email.text);
                          await mongoDB.initMongo();
                          await mongoDB.createCollection();
                          double a = await mongoDB.insertCollection(
                              username.text, password.text, email.text);
                          if (a == 1.0) {
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: ((c) {
                              return new BanksHome();
                            })));
                          }
                        },
                        child: new Text(
                          'Register',
                          style: Theme.of(context).textTheme.body1,
                        ),
                        borderSide: BorderSide(
                            width: 1.3,
                            style: BorderStyle.solid,
                            color: Theme.of(context).accentColor),
                      ),
                    )
                  ],
                ),
              ),
            )
            //),
            ),
      ),
    );
  }
}
