import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../screens_login_register/login_screen.dart';
import '../blocs/authentication_bloc.dart';
import '../Dialog/loading_dialog.dart';
import '../Dialog/message_dialog.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthBloc authBloc = AuthBloc();

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  void _createNewUser() {
    var isValid = authBloc.isValid(
      _nameController.text,
      _phoneController.text,
      _emailController.text,
      _passController.text,
    );

    if (isValid == true) {
      // create user
      LoadingDialog.showLoadingDialog(context, "Loading...");
      authBloc.registerForNewUser(
        _nameController.text,
        _phoneController.text,
        _emailController.text,
        _passController.text,
        () {
          LoadingDialog.hideLoadingDialog(context);
          Navigator.of(context).pushReplacementNamed("/");
        },
        (msg) {
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, msg, "Register Account");
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 5,
                ),
                child: Text(
                  " Welcome To Register ! ",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "Register my app in single steps",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Image.asset(
                    "assets/images/pink_house.png",
                    width: 250,
                    height: 100,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: StreamBuilder(
                          stream: authBloc.nameStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.pink, width: 2),
                                ),
                                prefixIcon: Container(
                                  width: 50,
                                  child: Icon(Icons.text_fields),
                                ),
                                labelText: "Name",
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                errorStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder(
                          stream: authBloc.phoneStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Container(
                                  width: 50,
                                  child: Icon(Icons.phone_android),
                                ),
                                labelText: "Phone",
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                errorStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder(
                          stream: authBloc.emailStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Container(
                                  width: 50,
                                  child: Icon(Icons.email),
                                ),
                                labelText: "Email",
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                errorStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: StreamBuilder(
                          stream: authBloc.passStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              controller: _passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.pink,
                                    width: 2,
                                  ),
                                ),
                                prefixIcon: Container(
                                  width: 50,
                                  child: Icon(Icons.lock),
                                ),
                                labelText: "Password",
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                errorStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      width: double.infinity,
                      height: 83,
                      padding: EdgeInsets.only(top: 20, bottom: 15),
                      child: RaisedButton(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: _createNewUser,
                        color: Colors.pink,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: RichText(
                        text: TextSpan(
                          text: "Already a user ? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LogInScreen(),
                                    ),
                                  );
                                },
                              text: "Login",
                              style: TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
