import 'dart:ffi';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_driver_app/driver/home_page.dart';
import 'package:taxi_driver_app/user/user_home_page.dart';

import '../../components/buttn_component.dart';
import '../../components/common.dart';
import '../../global/alerts_and_notifications.dart';
import '../../global/global.dart';
import '../../services/login_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: appBarTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                        ),
                        prefixIcon: const Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4)
                        ),
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is Required!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    ButtonWidget(
                      btnText: 'Login',
                      btnColor: Colors.black87,
                      onButtonPres: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          // Call loginHandler with formKey
                          loginHandler(_formKey);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if ( isLoading ) const Center(
                      child: CircularProgressIndicator(), // CircularProgressIndicator for loading
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  loginHandler( formKey ) async {
    final formData = FormData.fromMap({
      'mobile': _mobileController.text,
      'password': _passwordController.text,
    });

    Response<dynamic> response = await LoginServices.loginRequest(formData);
    if( response.statusCode == 200 ) {
      setState(() {
        isLoading = false;
      });
      
      // make the loggin susccess
      loginSuccessHandle( response );
      
      successSnackBar(context, 'Login success Please wait..');
    }else{
      if (response.statusCode == 502) {
        errorSnackBar(context, 'Please check your Internet connection');
        Navigator.pop(context);
      }

      // map phone validation errors
      List<dynamic> phoneError = response.data['errors']['mobile'];
      if( phoneError.isNotEmpty ) {
        errorSnackBar(context, phoneError[0]);
      }

      // map password validation errors
      List<dynamic> passValidations = response.data['errors']['password'];
      if( passValidations.isNotEmpty ) {
        errorSnackBar(context, passValidations[0]);
      }

      setState(() {
        isLoading = false;
      });
      // errorSnackBar(context, );
    }
  }

  // login success with this function
  void loginSuccessHandle(Response response) {
    String jwtToken = response.data['access_token'];
    Map<String, dynamic> user = response.data['user'];
    String userName = user['name'];
    String userType = user['type'];
    String userId = user['id'].toString();

    saveTheToken(jwtToken);
    saveUserId(userId);
    saveUserName(userName);
    saveUserType(userType);

    if( userType == 'USER') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserHomePageScreen()),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DriverHomePage()),
      );
    }
  }
}

