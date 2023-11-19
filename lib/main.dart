import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamepocket/Auth.dart';
import 'HomePage.dart' as HomePage;
import 'AuthPage.dart';
import 'HomePage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: Auth().checkIfLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Errore durante la verifica dell'autenticazione");
          } else {
            if (snapshot.data == true) {
              return Homepage();
            } else {
              return AuthPage();
            }
          }
        },
      ),
    );
  }
}
