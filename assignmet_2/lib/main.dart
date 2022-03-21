import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<MyWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool open = true;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Scaffold(
          backgroundColor: Colors.red,
          key: _scaffoldKey,
          body: Stack(
            children: [my_drawer(open)],
          ),
          appBar: AppBar(
              leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              if (open) {
                _close_my_drawer();
              } else if (!open) {
                _open_my_drawer();
              }
            },
          )),
        );
      }

      return Scaffold(
        backgroundColor: Colors.red,
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 80,
              ),
              TextContainer('FIRST ELEMENT'),
              TextContainer('SECOND ELEMENT'),
              TextContainer('THIRD ELEMENT'),
              TextContainer('FOURTH ELEMENT'),
              TextContainer('FIFTHE ELEMENT'),
            ],
          ),
          backgroundColor: Colors.white54,
        ),
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _openDrawer();
          },
        )),
      );
    });
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _open_my_drawer() {
    setState(() {
      open = true;
    });
  }

  void _close_my_drawer() {
    setState(() {
      open = false;
    });
  }

  Widget my_drawer(bool open) {
    if (open) {
      return Container(
        child: ListView(
          children: [
            Container(
              height: 40,
            ),
            TextContainer('FIRST ELEMENT'),
            TextContainer('SECOND ELEMENT'),
            TextContainer('THIRD ELEMENT'),
            TextContainer('FOURTH ELEMENT'),
            TextContainer('FIFTHE ELEMENT'),
          ],
        ),
        decoration: const BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(right: getDeviceWidth(context) / 2),
      );
    }

    return Container();
  }
}

class TextContainer extends StatelessWidget {
  final String _txt;
  TextContainer(this._txt);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_txt),
      height: 50,
      padding: const EdgeInsets.only(left: 20),
    );
  }
}

double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
