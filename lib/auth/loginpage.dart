import 'package:farmer/auth/signup.dart';
import 'package:flutter/material.dart';

import '../screens/bottom_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final navigatorKey = GlobalKey<NavigatorState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    emailController;
    passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool rememberMe = false;
    // final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(children: [
          const SizedBox(height: 50),
          const Text(
            'Login In to Your Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            'Email',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(.5)),
          ),
          const SizedBox(height: 10),
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  decoration: const InputDecoration(
                    focusColor: Colors.black,
                    hintText: 'example@gmail.com',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Password',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(.5)),
          ),
          const SizedBox(height: 10),
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    focusColor: Colors.black,
                    hintText: 'Enter password',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BottomScreen()));
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SignUpPage()),
                  );
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
