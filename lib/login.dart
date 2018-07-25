import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weimai/getpassword.dart';
import 'package:flutter_weimai/home.dart';
import 'package:flutter_weimai/smslogin.dart';

class ForLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "demo",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Container(
              child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text("微脉"),
            ],
          )),
        ),
        body: new Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Login();
  }
}

class _Login extends State<Login> {
  String phone;
  String password;
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool phoneDone = false;
  bool passDone = false;

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  bool phoneLength = false;

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passController.dispose();
  }

  void _handleSubmitted(String phone, String pass) {
    if (phone != null && phone.length > 0 && pass != null && pass.length > 0) {
      print("aaaa " + phone + "  " + pass);
      _passController.clear();
      _phoneController.clear();

      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Suggestions'),
              ),
              body: new MyHomePage(),
            );
          },
        ),
      );
      /*new MaterialButton(
          color: Colors.blue,
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.people),
              new Padding(padding: const EdgeInsets.all(2.0)),
              new Text("登陆")
            ],
          ));*/
      //!!!!不行
      //Navigator.of(context).pushNamed("/h");
      //不行
      /*Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) {
          new MyHomePage();
        }),
      );*/

      /*new Timer(const Duration(seconds: 6), () {

      });*/

    } else {
      _showMessage("请输入账号密码");
    }
  }

  @override
  Widget build(BuildContext context) {
    Column column = new Column(
      children: <Widget>[
        new Image.asset("images/monitor_normal.png"),
        new Padding(padding: const EdgeInsets.all(32.0)),
        new TextField(
          textAlign: TextAlign.start,
          controller: _phoneController,
          maxLines: 1,
          onChanged: (str) {
            if (str.length != 11) {
              setState(() {
                this.phoneDone = false;
              });
            } else {
              setState(() {
                this.phoneDone = true;
              });
            }
          },
          maxLength: 11,
          keyboardType: TextInputType.number,
          decoration:
              new InputDecoration(hintText: "please input phone number"),
        ),
        new Padding(padding: const EdgeInsets.all(4.0)),
        new TextField(
          controller: _passController,
          keyboardType: TextInputType.number,
          maxLines: 1,
          onChanged: (text) {
            if (text.length < 6 || text.length > 16) {
              setState(() {
                this.passDone = false;
              });
            } else {
              setState(() {
                this.passDone = true;
              });
            }
          },
          decoration: new InputDecoration(hintText: "please input password"),
        ),
        new Padding(padding: const EdgeInsets.all(15.0)),
        new RaisedButton(
          color: Colors.blue,
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.people),
              new Padding(padding: const EdgeInsets.all(2.0)),
              new Text("登陆")
            ],
          ),
          onPressed: phoneDone && passDone
              ? () {
                  _handleSubmitted(_phoneController.text, _passController.text);
                }
              : null,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );

    Column form = new Column(
      children: <Widget>[
        new Image.asset("images/monitor_normal.png"),
        new Padding(padding: const EdgeInsets.all(32.0)),
        new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new TextField(
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  decoration:
                      new InputDecoration(hintText: "please input password"),
                  onSubmitted: (String text) {
                    phone = text;
                  },
                ),
                new Padding(padding: const EdgeInsets.all(4.0)),
                new TextField(
                  maxLines: 1,
                  decoration:
                      new InputDecoration(hintText: "please input password"),
                  onSubmitted: (String text) {
                    password = text;
                  },
                ),
                new Padding(padding: const EdgeInsets.all(15.0)),
                new RaisedButton(
                  color: Colors.blue,
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.people),
                      new Padding(padding: const EdgeInsets.all(2.0)),
                      new Text("登陆")
                    ],
                  ),
                  onPressed: () {
                    _handleSubmitted(
                        _phoneController.text, _passController.text);
                    /* if (phone == null ||
              phone.length == 0 ||
              password == null ||
              password.length == 0) {
            _showMessage("请输入账号密码");
          }*/
                  },
                ),
              ],
            ))
      ],
    );

    Row row = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return new Scaffold(
                    appBar: new AppBar(
                      title: new Text('忘记密码'),
                    ),
                    body: new GetPassword(),
                  );
                },
              ),
            );
          },
          child: new Text("忘记密码"),
        ),
        new Padding(padding: const EdgeInsets.all(4.0)),
        new Text("|"),
        new Padding(padding: const EdgeInsets.all(4.0)),
        new MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return new Scaffold(
                    appBar: new AppBar(
                      title: new Text("用短信登陆"),
                    ),
                    body: new SmsLogin(),
                  );
                },
              ),
            );
          },
          child: new Text("用短信登陆"),
        ),
      ],
    );

    Stack stack = new Stack(children: <Widget>[
      new Align(
        alignment: new FractionalOffset(0.0, 0.0),
        child: new Container(
          margin: const EdgeInsets.all(15.0),
          child: column,
        ),
      ),
      new Align(
        alignment: FractionalOffset.bottomRight,
        child: new Container(
          margin: const EdgeInsets.all(15.0),
          child: row,
        ),
      ),
    ]);

    return stack;
  }

  void _showMessage(String name) {
    showDialog<Null>(
        context: context,
        child: new AlertDialog(content: new Text(name), actions: <Widget>[
          new FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: new Text('确定'))
        ]));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个页面'),
        backgroundColor: Colors.brown,
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('返回'),
        ),
      ),
    );
  }
}
