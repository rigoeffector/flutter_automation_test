import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: const Color(0xFFfcfcfc),
      appBar: AppBar(
        title: const Text(
          "Auric",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'UniNeue'),
        ),
        backgroundColor: const Color(0xFF53C1E9),
        elevation: 0,
      ),
      body: Center(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _logout();
              },
              child:  Text("Logout"),
            ),
            Text("Auric Home"),
          ],
        ),
      )),
    );
  }

  void _logout() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove("email");
    _prefs.remove("cPassword");
    _prefs.remove("password");
    Navigator.of(context).pushNamed('/');
  }
}
