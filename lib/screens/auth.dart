import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passswordController = TextEditingController();

  late String email;
  late String password;
  late Bool showLogin;

  @override
  Widget build(BuildContext context) {

    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 200),
        child: Container(
          child: Align(
            child: Text('Вход', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black ),
            ),
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool visible) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: visible,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade200, width: 1)
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.blue.shade200),
                child: icon,
              ),
            )
          ),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return ElevatedButton(
        style: (
          ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          )
        ),
        onPressed: (){
          func();
        },
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        )
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(Icon(Icons.email), "Email", _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(Icon(Icons.lock), "Password", _passswordController, true),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20,),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: _button(label, func)
                ),
              ),
            )
          ],
        ),
      );
    }

    void _loginUser() {
     email = _emailController.text;
     password = _passswordController.text;

     _emailController.clear();
     _passswordController.clear();
    }


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _logo(),
          _form('Войти', _loginUser),
          SizedBox(height: 20,),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Ещё нет аккаунта? ',
                style: TextStyle(color: Colors.black, fontSize: 17),
                children: [
                  TextSpan(
                    text: 'Регистрация',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      // Обработчик нажатия на ссылку
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
