import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage() : super();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKeySingUp = GlobalKey<FormState>();
  final _loginFormKeySingIn = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appbar(),
        body: TabBarView(
          children: [
            _loginViewFirstTab(_loginFormKeySingIn, context),
            _loginViewSecondTab(_loginFormKeySingUp, context),
          ],
        ),
      ),
    );
  }
}

Widget _loginViewSecondTab(_loginFormKey, context) => Column(
      children: [
        Center(
          child: Form(
            key: _loginFormKey,
            child: Container(
              width: (MediaQuery.of(context).size.width / 3) * 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  _textFieldEmail(),
                  Padding(padding: EdgeInsets.all(10)),
                  _textFieldPassword(),
                  Padding(padding: EdgeInsets.all(10)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Center(
              child: _loginButton(_loginFormKey, 'Sign-up'),
            ),
          ),
        )
      ],
    );

Widget _loginViewFirstTab(_loginFormKey, context) => Column(
      children: [
        Center(
          child: Form(
            key: _loginFormKey,
            child: Container(
              width: (MediaQuery.of(context).size.width / 3) * 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  _textFieldEmail(),
                  Padding(padding: EdgeInsets.all(10)),
                  _textFieldPassword(),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Colors.orange[900],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Center(
              child: _loginButton(_loginFormKey, 'Login'),
            ),
          ),
        )
      ],
    );

Widget _loginButton(_loginFormKey, String text) => ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.only(left: 100, top: 15, right: 100, bottom: 15)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[900]),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.orange[900]))),
      ),
      onPressed: () {
        if (_loginFormKey.currentState.validate()) {
          print('entrar');
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );

Widget _appbar() => AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: Colors.white,
      toolbarHeight: 350,
      title: Center(
        child: Container(
            width: 300,
            child: Image.asset('assets/logo.jpg', fit: BoxFit.cover)),
      ),
      bottom: TabBar(
        indicatorColor: Colors.orange[900],
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(
            child: Container(
              width: 100,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              width: 100,
              child: Center(
                child: Text(
                  'Sign-up',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget _textFieldEmail() => TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
        labelText: 'Email Adress',
        hintText: 'example@email.com',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      validator: (value) {
        return _validator(value);
      },
    );

Widget _textFieldPassword() => TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
        labelText: 'Password',
        hintText: '***',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      validator: (value) {
        return _validator(value);
      },
    );

String _validator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}
