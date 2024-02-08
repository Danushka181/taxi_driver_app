import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common.dart';

class DriverDrawer extends StatefulWidget {
  const DriverDrawer({super.key});

  @override
  State<DriverDrawer> createState() => _DriverDrawerState();
}

class _DriverDrawerState extends State<DriverDrawer> {
  String _driverName = '';

  @override
  void initState() {
    super.initState();
    _loadName(); // Call _loadName function when the widget initializes
  }

  // Function to load the name from SharedPreferences
  Future<void> _loadName() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      _driverName = storage.getString('UNAME')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Text(
              _driverName,
              style: appBarTitle,
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Add your item 1 action here
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Add your item 2 action here
            },
          ),
          // Add more ListTiles for additional drawer items
        ],
      ),
    );;
  }
}
