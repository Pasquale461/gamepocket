
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth
{
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
User? get currentuser => _firebaseauth.currentUser;
Stream<User?> get authstatechanges => _firebaseauth.authStateChanges();

Future<void> SignInWithEmailAndPassword ({required String email , required String password}) async
{
  await _firebaseauth.signInWithEmailAndPassword(email: email, password: password);
}

Future<String?> getnameofUser () async
{


  String? Name = _firebaseauth.currentUser?.displayName;
  print(Name);
  return Name;
}

Future<void> CreateUserWithEmailAndPassword ({required String email , required String password}) async
{
  await _firebaseauth.createUserWithEmailAndPassword(email: email, password: password);
}

Future<void> SignOut () async
{
  await _firebaseauth.signOut();
}

Future<bool> checkIfLoggedIn() async {
  try {
    // Ottieni l'utente corrente da Firebase Auth
    User? user = _firebaseauth.currentUser;

    // Verifica se l'utente è già autenticato
    return user != null;
  } catch (error) {
    // Gestisci eventuali errori durante la verifica
    print("Errore durante la verifica dell'autenticazione: $error");
    return false;
  }
}

Future<User?> signInWithGoogle() async {
  try {
    // Esegui il login con Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // L'utente ha annullato il login con Google
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Effettua il login con Firebase
    final UserCredential authResult = await _firebaseauth.signInWithCredential(credential);
    final User? user = authResult.user;

    // Controlla se l'utente è già registrato nel tuo sistema
    if (user != null) {
      // Puoi eseguire ulteriori operazioni qui, ad esempio verificare nel tuo database
      // se l'utente è già registrato, e se non lo è, procedere con la registrazione.
    }

    return user;
  } catch (error) {
    print("Errore durante il login con Google: $error");
    return null;
  }
}

}