import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Microvein extends StatefulWidget {
  Microvein({Key key}) : super(key: key);

  @override
  createState() {
    return new _Microvein();
  }
}

class _Microvein extends State<Microvein> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new RefreshIndicator(
        child: new ListView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          },
          itemCount: widgets.length,
        ),
        onRefresh: () {},
      ),
    );
  }

  Widget getRow(int i) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0), child: new Text("Row $i")),
      onTap: () {
        setState(() {
          widgets = new List.from(widgets);
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }

  loadData() async {
    String dataUrl = "";
    http.Response response = await http.get(dataUrl);
  }
}
