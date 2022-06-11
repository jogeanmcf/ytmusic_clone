import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytmusic_clone/controllers/theme_controller.dart';
import 'package:ytmusic_clone/screens/explore.dart';
import 'package:ytmusic_clone/screens/home.dart';
import 'package:ytmusic_clone/screens/library.dart';
import 'package:ytmusic_clone/screens/search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeControler = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeControler.getTheme,
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Main> {
  List<Widget> _screenOptions = [Home(), Explore(), Library()];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: 'Start'),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 1 ? Icons.explore : Icons.explore_outlined),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? Icons.library_music
                  : Icons.library_music_outlined),
              label: 'Library')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}

enum MusicOptions {
  training,
  energy,
  relax,
  inTransit,
  focus,
}
