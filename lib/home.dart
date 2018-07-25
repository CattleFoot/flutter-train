import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weimai/first.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "demo",
      routes: <String, WidgetBuilder>{
        "/h": (BuildContext context) {
          new Home();
        }
      },
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Container(
              child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Icon(Icons.share),
              new Padding(padding: const EdgeInsets.all(4.0)),
              new Text("微脉"),
            ],
          )),
        ),
        body: new MyHomePage(),
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('home'),
      ),
      body: new MyHomePage(),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      body: new PageView(
        children: <Widget>[
          new Microvein(),
          new Text("3333"),
          new Text("eeeeee"),
          new Text("65432")
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.share),
            title: new Text("主页"),
            backgroundColor: Colors.blue,
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.list),
              title: new Text("分类"),
              backgroundColor: Colors.grey),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.local_grocery_store),
            title: new Text("购物车"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text("我的"),
          ),
        ],
        onTap: onTap,
        currentIndex: page,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
