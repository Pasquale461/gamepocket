import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamepocket/Auth.dart';
import 'package:gamepocket/AuthPage.dart';  // Aggiunto import per AuthPage
import 'firebase_options.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String?>(future: Auth().getnameofUser(), builder: (context , snapshot) {return Text(snapshot.data ?? 'UserNotFound');}),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Auth().SignOut();
              // Naviga a MyAuthPage quando l'utente esce
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AuthPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

  



 