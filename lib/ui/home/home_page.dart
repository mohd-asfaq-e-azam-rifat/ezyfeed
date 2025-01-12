import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int pageIndex;

  const HomePage({
    super.key,
    this.pageIndex = 0,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _pageIndex;

  @override
  void initState() {
    _pageIndex = widget.pageIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Python Developer Community"),
        titleTextStyle: textStyleAppBarTitle,
      ),
      body: <Widget>[
        Container(color: Colors.redAccent),
        Container(color: Colors.greenAccent),
        Container(color: Colors.yellowAccent),
      ][_pageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: _pageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
    );
  }

  void _onNavigationBarItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
