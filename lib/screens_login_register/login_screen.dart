import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../Dialog/loading_dialog.dart';
import '../Dialog/message_dialog.dart';
import '../screens_login_register/register_screen.dart';
import '../screens_restaurant/tab_screen.dart';
import '../blocs/authentication_bloc.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final AuthBloc authBloc = AuthBloc();

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  void _loginUser() {
    String email = _emailController.text;
    String pass = _passController.text;

    LoadingDialog.showLoadingDialog(context, "Loading...");
    authBloc.login(
      email,
      pass,
      () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
      },
      (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, msg, "Login Account");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                child: Text(" Welcome To My App ! ",
                    style: Theme.of(context).textTheme.title),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Login to continue using my app",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                height: screenHeight / 2.5,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Image.asset(
                    "assets/images/master_chef_login.jpeg",
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
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 2),
                          ),
                          prefixIcon: Container(
                            width: 50,
                            child: Icon(Icons.email),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 8),
                      child: TextFormField(
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
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 15),
                      width: double.infinity,
                      height: 83,
                      child: RaisedButton(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        onPressed: _loginUser,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        color: Colors.pink,
                      ),
                    ),
                    Container(
                      child: RichText(
                        text: TextSpan(
                          text: "New User ? ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ),
                                  );
                                },
                              text: "Sign up for a new account",
                              style: TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                              ),
                            ),
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
