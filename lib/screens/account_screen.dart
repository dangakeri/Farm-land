import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../onboarding/splashscreen.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textSelectionTheme.selectionColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/account.jpeg',
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.email,
                color: Theme.of(context).textSelectionTheme.selectionColor,
              ),
              title: Text(
                'Email Address',
                style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                ),
              ),
              subtitle: Text(
                'user@gmail.com',
                style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SplashScreen()));
              },
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              subtitle: const Text('Log out from the app'),
            )
          ],
        ),
      ),
    );
  }
}
