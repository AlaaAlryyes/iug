import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(
            children: [
              TopImage(),
              Container(
                child: const Text('القدس',
                    style: TextStyle(color: Colors.black54, fontSize: 20)),
                alignment: Alignment.center,
              ),
              TableItem("الاسم", "القدس"),
              TableItem("المساحة", "125كم"),
              TableItem("السكان", "358000كم"),
              TableItem("الدولة", "فلسطين"),
              TableItem("اسم الطالب", "علاء الدين الريس")
            ],
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}

class TableItem extends StatelessWidget {
  final String _val;
  final String _tag;
  TableItem(this._tag, this._val);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [TableItemValue(_val), TableItemTag(_tag)],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black54)),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
    );
  }
}

class TableItemValue extends StatelessWidget {
  String value;
  TableItemValue(this.value, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(value),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black54)),
      constraints: BoxConstraints.tight(Size(300, 40)),
      margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      alignment: Alignment.center,
    );
  }
}

class TableItemTag extends StatelessWidget {
  String value;
  TableItemTag(this.value, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(value),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black54)),
        constraints: BoxConstraints.tight(const Size(140, 40)),
        margin: const EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
        alignment: Alignment.center);
  }
}

class TopImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'عاصمة فلسطين',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            decoration: BoxDecoration(color: Colors.purple[400]),
            width: 375,
            height: 50,
            alignment: Alignment.center,
          ),
          Image.asset('assets\\images\\jerusalem.jpg')
        ],
      ),
    );
  }
}
