// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences_app/home_screen.dart';
import 'package:shared_preferences_app/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print("init");
    Timer(Duration(seconds: 5), (() {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => LogInScreen())));
    }));
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            "https://images.pexels.com/photos/1400172/pexels-photo-1400172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
      ),
    );
  }
}
