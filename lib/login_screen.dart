// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/home_screen.dart';
import 'package:shared_preferences_app/student_screen.dart';
import 'package:shared_preferences_app/teacher_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("email", emailController.text.toString());
                  sp.setBool("isLogIn", true);
                  //admin,student,teacher
                  sp.setString("userType", "teacher");
                  if (sp.getString("userType") == 'teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherScreen(),
                        ));
                  } else if (sp.getString("userType") == 'student') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentScreen(),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentScreen(),
                        ));
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: Center(
                    child: Text('Sign Up'),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

/*
   print("shared preference");
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("name", "Jitendra");
                  sp.setString("class", "MCA");
                  sp.setInt("salary", 1000000);
                  sp.setBool("isLogin", true);

                  print(sp.getString("name"));
                  print(sp.getString("class"));
                  print(sp.getInt("salary"));
                  print(sp.getBool("isLogin"));
*/