import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_driver_app/components/border_buttn_component.dart';
import 'package:taxi_driver_app/components/buttn_component.dart';
import 'package:taxi_driver_app/pages/otp_process/mobile.dart';

import 'Login/Login.dart';



class AuthMainScreen extends StatefulWidget {
  const AuthMainScreen({super.key});

  @override
  State<AuthMainScreen> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<AuthMainScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    loginCLick() async {
        print('object');
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png')
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(top: 40, bottom: 10),
                                child: Text(
                                  'CITY TAXI SERVICE',
                                  style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black87
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(top: 0),
                                    child: Text(
                                      'Start your Ride Now!',
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ButtonWidget(
                            btnText: 'Login',
                            onButtonPres: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                                ),
                              ),
                            },
                            btnColor: Colors.black,
                          ),
                          const SizedBox(height: 15),
                          BorderButtonWidget(
                              btnText: 'Register',
                              btnColor: Colors.black,
                              onButtonPres: () => {
                                loginCLick()
                              })
                        ],
                      )
                    ],
                  ),


                ],
              ),
            )
        ),
      )
    );
  }
}
