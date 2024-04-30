import 'package:dating_app_assignment/components/dating_card_item.dart';
import 'package:dating_app_assignment/components/dating_card_screen.dart';
import 'package:dating_app_assignment/models/card_info_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map valueFromDB;
  late List valueKeys = [];
  int _currentPage = 0;
  List titleList = [
    '101 Main Profile 01',
    '102 Main Profile 02',
    '103 Main Profile 03',
    '104 Main Profile 03'
  ];
  bool loading = false;
  // String url =
  //     "https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app/";
  @override
  void initState() {
    firebaseInitFetch();

    super.initState();
  }

  firebaseInitFetch() async {
    setState(() => loading = true);
    final databaseReference = FirebaseDatabase().refFromURL(
        'https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app/');

    await databaseReference.onValue.listen((event) {
      var data = event.snapshot.value as Map;
      setState(() =>
          {valueFromDB = data['data'], valueKeys = valueFromDB.keys.toList()});
    });
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    print('valueKeys');
    print(valueKeys);
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 11.0),
            child:
                Text(_currentPage > 3 ? titleList[3] : titleList[_currentPage]),
          ),
        ),
        valueKeys.length == 0
            ? Container(
                child: Center(
                  child: Text("110 NO CARDS"),
                ),
              )
            : PageView(
                onPageChanged: (value) =>
                    {setState(() => _currentPage = value)},
                children: valueKeys.map((key) {
                  // var info = CardInfoModel.fromJson(valueFromDB[key]);
                  return Draggable(
                    child: DatingCardItem(
                      name: valueFromDB[key]['name'],
                      description: valueFromDB[key]['description'],
                      age: valueFromDB[key]['age'],
                      likeCount: valueFromDB[key]['likeCount'],
                      location: valueFromDB[key]['location'],
                      cardImages: valueFromDB[key]['images'],
                    ),
                    feedback: DatingCardItem(
                      name: valueFromDB[key]['name'],
                      cardImages: valueFromDB[key]['images'],
                      description: valueFromDB[key]['description'],
                      age: valueFromDB[key]['age'],
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.4,
                      child: _myCard(),
                    ),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        print("swipe Left");
                        setState(() => valueKeys.removeAt(0));
                      } else {
                        print("swipe Right");
                      }
                      print("drag.velocity.pixelsPerSecond.dy");
                      if (drag.velocity.pixelsPerSecond.dy > 0) {
                        print("Swipe Donw");
                        setState(() => valueKeys.removeAt(0));
                      }
                    },
                  );
                  //
                }).toList(),
                // ),
              ),
      ],
    );
  }

  Widget _myCard({name, description, age}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
          height: 500,
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Color.fromARGB(176, 144, 144, 144),
              width: 2.0,
            ),
          ),
          child: Icon(
            Icons.delete,
            color: Colors.redAccent,
          )),
    );
  }

  Widget _buildLoading() {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(141, 255, 255, 255)),
    );
  }
}
