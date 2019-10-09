import 'dart:async';
import '../fire_base/fire_base_auth.dart';

class AuthBloc {
  final FireBaseAuth _fireBaseAuth = FireBaseAuth();

  StreamController _nameController = StreamController();
  StreamController _phoneController = StreamController();
  StreamController _emailController = StreamController();
  StreamController _passController = StreamController();

  Stream get nameStream => _nameController.stream;

  Stream get phoneStream => _phoneController.stream;

  Stream get emailStream => _emailController.stream;

  Stream get passStream => _passController.stream;

  bool isValid(String name, String phone, String email, String pass) {
    if (name == null || name.isEmpty) {
      _nameController.sink.addError("Please enter your name !");
      return false;
    }
    _nameController.sink.addError("");

    if (phone == null || phone.isEmpty) {
      _phoneController.sink.addError("Please enter your phone !");
      return false;
    }
    _phoneController.sink.addError("");

    if (email == null || email.isEmpty) {
      _emailController.sink.addError("Please enter your email !");
      return false;
    }
    _emailController.sink.addError("");

    if (pass == null || pass.isEmpty) {
      _passController.sink.addError("Please enter your password !");
      return false;
    }
    _passController.sink.addError("");
    return true;
  }

  void registerForNewUser(String name, String phone, String email, String pass,
      Function onSuccess, Function(String) onRegisterError) {
    _fireBaseAuth.registerForNewUser(
        name, phone, email, pass, onSuccess, onRegisterError);
  }

  void login(String email, String pass, Function onSuccess,
      Function(String) onLoginErr) {
    _fireBaseAuth.login(email, pass, onSuccess, onLoginErr);
  }

  void dispose() {
    _nameController.close();
    _phoneController.close();
    _emailController.close();
    _passController.close();
  }
}
