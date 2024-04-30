import 'package:dating_app_assignment/constants/colors.dart';
import 'package:dating_app_assignment/pages/homepage.dart';
import 'package:dating_app_assignment/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import Firebase options from the firebase_options.dart file
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Use Firebase options from firebase_options.dart
  );
  // ignore: deprecated_member_use

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  Color _selectedColor = Color(0xFFFF016B);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("목이길어슬픈기린님의 새로운 스팟"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: mypink,
                  ),
                  Text('323,233')
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_sharp),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _getPage(_selectedIndex),
        ),
        bottomNavigationBar: BottomAppBar(
          // shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/homeicon.png',
                      color: _selectedIndex == 0 ? _selectedColor : Colors.grey,
                    ),
                    onPressed: () => _onItemTapped(0),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/locationicon.png',
                      color: _selectedIndex == 1 ? _selectedColor : Colors.grey,
                    ),
                    onPressed: () => _onItemTapped(1),
                  ),
                ],
              ),

              Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/chaticon.png',
                      color: _selectedIndex == 2 ? _selectedColor : Colors.grey,
                    ),
                    onPressed: () => _onItemTapped(2),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/profileicon.png',
                      color: _selectedIndex == 3 ? _selectedColor : Colors.grey,
                    ),
                    onPressed: () => _onItemTapped(3),
                  ),
                ],
              ),
              // SizedBox(width: 10), // This empty SizedBox is for spacing
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Container(
              padding: EdgeInsets.all(17),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(colors: [
                    Colors.grey,
                    const Color.fromARGB(255, 51, 51, 51)
                  ])),
              child: Icon(Icons.star_rate_rounded)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return MyHomePage();
      // Add more cases for additional pages if needed
      default:
        return Container();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
