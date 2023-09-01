import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_google_auth/auth.dart';
import 'package:firebase_google_auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            SizedBox(
              height: 20,
            ),
            Text('${FirebaseAuth.instance.currentUser!.displayName}'),
            Text('${FirebaseAuth.instance.currentUser!.email}'),
            ElevatedButton(
              onPressed: () async {
                await AuthServices().signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginPage(),
                  ),
                );
              },
              child: Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
