import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_weimai/home.dart';
import 'package:flutter_weimai/login.dart';

class SmsLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SmsLogin();
  }
}

class _SmsLogin extends State<SmsLogin> {
  bool phoneDone = false;
  bool codeGot = false;
  TextEditingController phoneController = new TextEditingController();
  TextEditingController controller = new TextEditingController();
  String code;

  @override
  Widget build(BuildContext context) {
    Column column = new Column(
      children: <Widget>[
        new Image.asset("images/monitor_normal.png"),
        new Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            new TextField(
              textAlign: TextAlign.start,
              maxLength: 11,
              maxLines: 1,
              controller: phoneController,
              decoration: new InputDecoration(hintText: "输入手机号码"),
              onChanged: (String value) {
                setState(() {
                  if (value.length == 11) {
                    phoneDone = true;
                  } else {
                    phoneDone = false;
                  }
                });
              },
            ),
          ],
        ),
        new Padding(padding: const EdgeInsets.only(top: 8.0, bottom: 8.0)),
        new Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            new TextField(
              textAlign: TextAlign.start,
              maxLines: 1,
              controller: new TextEditingController(text: code),
              maxLength: 4,
              decoration: new InputDecoration(hintText: "输入验证码"),
            ),
            new RaisedButton(
              onPressed: phoneDone
                  ? () {
                      setState(() {
                        codeGot = true;
                        code = "1234";
                      });
                    }
                  : null,
              child: new Text("获取验证码"),
            )
          ],
        ),
        new Padding(padding: const EdgeInsets.only(top: 8.0, bottom: 8.0)),
        codeGot
            ? new Column(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerRight,
                    child: new Text("收不到短信？试试语音验证码"),
                  ),
                  new Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0)),
                ],
              )
            : new Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0)),
        new MaterialButton(
          color: codeGot && phoneDone ? Colors.blue : Colors.deepPurple,
          textColor: codeGot && phoneDone ? Colors.white : Colors.grey,
          height: 40.0,
          minWidth: 120.0,
          onPressed: codeGot && phoneDone
              ? () {
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (context) {
                        return new Scaffold(
                          body: new Home(),
                        );
                      },
                    ),
                  );
                }
              : null,
          child: new Text(
            "登陆",
            style: new TextStyle(fontSize: 16.0, color: Colors.deepPurple),
          ),
        ),
        new Padding(padding: const EdgeInsets.only(top: 8.0, bottom: 8.0)),
        new RaisedButton(
          onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (context) {
                  return new Scaffold(
                    body: new Login(),
                  );
                },
              ),
            );
          },
          child: new Text("用密码登陆"),
        )
      ],
    );
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15.0),
        child: column,
      ),
    );
  }

  void _showMessage(String message) {
    showDialog<Null>(
        context: context,
        builder: (con) {
          return new AlertDialog(
            content: new Text(message),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("确定"))
            ],
          );
        });
  }
}
