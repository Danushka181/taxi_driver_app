import 'package:flutter/material.dart';
import 'package:taxi_driver_app/Pages/register/register_screen.dart';
import 'package:taxi_driver_app/driver/home_page.dart';
import 'package:taxi_driver_app/pages/Login/Login.dart';
import 'package:taxi_driver_app/pages/auth_main_screen.dart';
import 'package:taxi_driver_app/pages/flash_screen.dart';
import 'package:taxi_driver_app/pages/otp_process/mobile.dart';
import 'package:taxi_driver_app/pages/otp_process/mobile_verify.dart';
import 'package:taxi_driver_app/user/user_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
      ),
      routes: {
        // '/' : (context) => const FlashScreen(),
        '/' : (context) => const AuthMainScreen(),
        '/otp' : (context) => const MobileNumberEnter(),
        '/otp-verify' : (context) => const MobileNumberVerification(),
        '/login' : (context) => const LoginScreen(),
        '/register' : (context) => const RegisterScreen(),
        '/driver-homepage' : (context) => const DriverHomePage(),
        '/user-homepage' : (context) => const UserHomePageScreen(),
      },
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
