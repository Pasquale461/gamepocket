import 'package:flutter/material.dart';
import 'package:gamepocket/Auth.dart';
import 'HomePage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth hgvsdjgc'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await Auth().signInWithGoogle();

            if (await Auth().checkIfLoggedIn()) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            }
          },
          child: Text('Login with Google'),
        ),
      ),
    );
  }
}
