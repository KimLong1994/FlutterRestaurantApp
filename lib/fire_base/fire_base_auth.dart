import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// TODO: create user and write new user on database
class FireBaseAuth {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  void registerForNewUser(String name, String phone, String email, String pass,
      Function onSuccess, Function(String) onRegisterError) {
    // TODO: write new user on database
    _fireBaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) => {
              _handleAddNamePhoneOnDatabaseForNewUser(
                  user.user.uid, name, phone, onSuccess, onRegisterError),
            })
        .catchError((err) => {
              _handleErrorRegisterForNewUser(err.code, onRegisterError),
            });
  }

  _handleAddNamePhoneOnDatabaseForNewUser(String userId, String name,
      String phone, Function onSuccess, Function(String) onRegisterError) {
    var user = {"name": name, "phone": phone};

    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user) {
      onSuccess();
    }).catchError((err) {
      onRegisterError("Register fail, please try again");
    });
  }

  _handleErrorRegisterForNewUser(
      String code, Function(String) onRegisterError) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        {
          onRegisterError("Invalid email");
          break;
        }
      case "ERROR_EMAIL_ALREADY_IN_USE":
        {
          onRegisterError("Email has existed");
          break;
        }
      case "ERROR_WEAK_PASSWORD":
        {
          onRegisterError("The password is not strong enough");
          break;
        }
      default:
        onRegisterError("Register fail, please try again");
        break;
    }
  }

  void login(String email, String pass, Function onSuccess,
      Function(String) onLoginErr) {
    _fireBaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) => {
              onSuccess(),
            })
        .catchError((err) => {
              onLoginErr("Login fail, please try again"),
            });
  }
}
