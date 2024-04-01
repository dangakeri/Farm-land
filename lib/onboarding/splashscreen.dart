import 'dart:async';

import 'package:farmer/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<UserProvider>(context, listen: false);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/tractor.jpeg',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
