import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_driver_app/components/drawer/driver_drawer.dart';

import '../components/common.dart';

class UserHomePageScreen extends StatefulWidget {
  const UserHomePageScreen({super.key});

  @override
  State<UserHomePageScreen> createState() => _UserHomePageScreenState();
}

class _UserHomePageScreenState extends State<UserHomePageScreen> {
  @override
  void initState() {
    super.initState();
    // Disable the system back button
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      disableBackButton();
    });
  }

  void disableBackButton() {
    // Prevents the user from navigating back using the system back button
    WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Prevents the user from navigating back using the back button in the appBar
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          title: Text(
            'Welcome',
            style: appBarTitle,
          ),
        ),
        drawer: DriverDrawer(),
        body: Center(
          child: Text('Welcome to the User Home Page!'),
        ),
      ),
    );
  }
}
