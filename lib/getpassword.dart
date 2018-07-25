import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ForgotPassword();
  }
}

class ForgotPassword extends State<GetPassword> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new TextField(
              textAlign: TextAlign.start,
              decoration: new InputDecoration(hintText: "请输入手机号码"),
              maxLines: 1,
              maxLength: 11,
            ),
            new Container(
              child: new Flexible(
                  child: new TextField(
                textAlign: TextAlign.start,
                decoration: new InputDecoration(hintText: "请输入验证码"),
                maxLength: 4,
                maxLines: 1,
              )),
            ),
            new MaterialButton(
              onPressed: null,
              child: new Text("获取验证码"),
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  maxLength: 16,
                  maxLines: 1,
                  decoration:
                      new InputDecoration(hintText: "请设置新密码，6-16位数字或字母"),
                )),
                new Checkbox(
                  value: checked ? true : false,
                  onChanged: (bool value) {
                    setState(() {
                      checked = !value;
                    });
                  },
                  activeColor: Colors.blue,
                )
              ],
            ),
            new Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, left: 8.0, top: 12.0, right: 12.0)),
            new MaterialButton(
              color: Colors.grey,
              onPressed: null,
              child: new Text("提交"),
            )
          ],
        ),
      ),
    );
  }
}
