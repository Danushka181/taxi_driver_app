import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_driver_app/pages/auth_main_screen.dart';
import 'package:taxi_driver_app/pages/otp_process/mobile.dart';



class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<FlashScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    navigateToLoginScreen();
  }


  void navigateToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    // Navigate to the login screen and replace the splash screen
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const AuthMainScreen()));
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.amber,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: Image.asset(
              'assets/images/app-bg.png',

            ).image,
          ),
        ),
        child: const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 285, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'CITY TAXI SERVICE',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'inter',
                              fontSize: 33,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          Text(
                            "Srilanka's No 1 Taxi service",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
