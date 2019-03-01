import 'package:meta/meta.dart';
import 'package:mysql1/mysql1.dart';

class MySQL {
  final String name = 'username TEXT NOT NULL';
  final String password = 'password TEXT NOT NULL';
  final String email = 'email TEXT NOT NULL';
  final String id = 'user_id INT AUTO_INCREMENT';
  String _host;
  int _port;
  String _username;
  String _password;
  String _dbName;
  MySqlConnection _conn;
  MySQL(
      {@required String host,
      @required int port,
      @required String username,
      @required String password,
      @required String dataBaseName}) {
    this._dbName = dataBaseName;
    this._host = host;
    this._password = password;
    this._port = port;
    this._username = username;
  }
  Future connect() async {
    var settings;
    try {
      settings = new ConnectionSettings(
          host: this._host,
          port: this._port,
          user: this._username,
          password: this._password,
          db: this._dbName);
      this._conn = await MySqlConnection.connect(settings);
      _checkTables();
    } catch (e) {
      print('thiiiiiiiiisssssssssssssssssss$e');
    }
  }

  Future<bool> _checkTables() async {
    bool tableExists = true;
    try {
      Results d = await this._conn.query('select * from banking.users;');
      print(d.length);
    } catch (e) {
      tableExists = false;
      print('not here');
      //print(e);
    }
    return tableExists;
  }

  Future registerUser(String username,password,email) async {
    var result = await this._conn.query(
        'insert into users (username, password, email) values (?, ?, ?)',
        [username, password, email]);
        print('success!!!!');
  }
    Future getUser(String username,password) async {
    var result = await this._conn.query('''select * from ${this._dbName}.users where(username='$username' and password='$password');''');
        print(result.toList()[0]);
  }

  void tableHandler() async {
    if (!await _checkTables()) {
      Results r = await this._conn.query('''CREATE TABLE users(
       $name,
       $password,
       $email,
       $id,
       PRIMARY KEY (user_id)
       )
       ''');
      print(r.length);
    }
  }
}

// mysql -u root -p
// Enter password: <enter password>
// GRANT ALL ON *.* to root@'192.168.232.2' IDENTIFIED BY 'donttry';
// FLUSH PRIVILEGES;
// mysql>exit

// sudo ufw allow mysql
// 
// SELECT * from information_schema.user_privileges where grantee like "'root'%";
