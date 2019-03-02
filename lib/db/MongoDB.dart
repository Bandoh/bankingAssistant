import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class MongoDB {
  String connUrl;
  mongo.Db db;
  mongo.DbCollection collec;
  MongoDB({url}) {
    this.connUrl = url;
  }
  void initMongo() async {
    this.db = new mongo.Db('mongodb://192.168.43.228:27017/banking');
    await this.db.open();
  }

  void createCollection() async {
    collec = await this.db.collection('user');
  }

  Future<bool> checkCred(username, pass) async {
    bool isvalid = false;
    var user =
        await collec.findOne({"username": "$username", "password": "$pass"});
    print(user);
    if(user['username']!=''){
      isvalid=true;
    }
    return isvalid;
  }

  Future<double> insertCollection(username, pass, email) async {
    var check = await collec.insertAll([
      {'username': '$username', 'password': '$pass', 'email': '$email'},
    ]);
    double a = check['ok'];
    return a;
  }
}

// mongod --bind_ip 0.0.0.0 -v

