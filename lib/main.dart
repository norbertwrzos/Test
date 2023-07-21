import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/settingsPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'screens/favoritePage.dart';
import 'screens/homePage.dart';
import 'screens/itemsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const MyHomePage(title: "Flutter Demo Home Page"),
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const ItemsPage(),
    const HomePage(),
    const FavoritePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar:GNav(
          selectedIndex: _selectedIndex,
          onTabChange: _navigateBottomBar,
          gap: 8,
          color: Colors.white,
          activeColor: Colors.white,
          backgroundColor: Colors.indigo,
          tabBackgroundColor: Colors.indigoAccent,
          tabs: const [
            GButton(
              icon: Icons.list_rounded,
              text: "Items",
            ),
            GButton(
              icon: Icons.home_filled,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Favorite",
            )
          ],
        ),
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.android_rounded, size: 40),
            SizedBox(width: 30),
            Text("App title", style: TextStyle(fontSize: 30))
          ],
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.notifications, size: 40),
              const SizedBox(width: 30),
              InkWell(
                child: const Icon(Icons.person, size: 40),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
              const SizedBox(width: 20),
            ],
          )
        ],
      ),
    );
  }
}
