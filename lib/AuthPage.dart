import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:gamepocket/Auth.dart';
import 'HomePage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sfondo_immagine.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () async {
                    await Auth().signInWithGoogle();

                    if (await Auth().checkIfLoggedIn()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Homepage()),
                      );
                    }
                  },
                  text: 'Gioca con Google',
                ),
              ),
              const SizedBox(height: 55.0), // Spazio tra il pulsante e il testo
              const Text(
                'Testo sotto il pulsante',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
