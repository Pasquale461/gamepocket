import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamepocket/Auth.dart';
import 'AuthPage.dart';
import 'HomePage.dart';
import 'firebase_options.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade200),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: Auth().checkIfLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text("Errore durante la verifica dell'autenticazione");
          } else {
            if (snapshot.data == true) {
              return const Homepage();
            } else {
              return const AuthPage();
            }
          }
        },
      ),
    );
  }
}
