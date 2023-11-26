import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../drawer/view/drawer.dart';
import '../../news/view/news.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _patronymicController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passswordController = TextEditingController();
  TextEditingController _birthYearController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _clubController =  TextEditingController();

  late String name;
  late String surname;
  late String patronymic;
  late String email;
  late String password;
  late String birthYear;
  late String gender;
  late String title;
  late String region;
  late String club;
  late bool showLogin = true;

  @override
  Widget build(BuildContext context) {

    Widget _logoForLogin() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text('Вход', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black ),
            ),
          ),
        ),
      );
    }

    Widget _logoForRegistration() {
      return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(
          child: Align(
            child: Center(
              child: Text('Регистрация в системе', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            )
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
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
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

    Widget _formLogin(String label, void func()) {
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

    Widget _formRegistration(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.person), "Имя", _nameController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.person), "Фамилия", _surnameController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.person), "Отчество", _patronymicController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.email), "Email", _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.lock), "Password", _passswordController, true),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.calendar_month), "Год рождения", _birthYearController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.male), "Пол", _genderController, true),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.arrow_upward), "Разряд/звание", _titleController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.flag), "Регион", _regionController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: _input(Icon(Icons.home), "Клуб/организация", _clubController, false),
            ),
            SizedBox(height: 10,),
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

    void _registerUser() {
      name = _nameController.text;
      surname = _surnameController.text;
      patronymic = _patronymicController.text;
      email = _emailController.text;
      password = _passswordController.text;
      birthYear = _birthYearController.text;
      gender = _genderController.text;
      title = _titleController.text;
      region = _regionController.text;
      club = _clubController.text;

      _nameController.clear();
      _surnameController.clear();
      _patronymicController.clear();
      _emailController.clear();
      _passswordController.clear();
      _birthYearController.clear();
      _genderController.clear();
      _titleController.clear();
      _regionController.clear();
      _clubController.clear();
    }


    return MaterialApp(
      title: "Личный кабинет",
      home: Scaffold(
      endDrawer: MainDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.jpg'),
            radius: 30,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
          },

        ),
        title: Center(child: Text("Личный кабинет", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    (
                        showLogin ?
                        Column(
                          children: <Widget>[
                            _logoForLogin(),
                            _formLogin('Войти', _loginUser),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
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
                                          setState(() {
                                            showLogin = false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(30),
                              child: Image.asset("assets/images/arch.jpg", width: 180, height: 240,),
                            ),
                          ],
                        ) :
                        Column(
                          children: <Widget>[
                            _logoForRegistration(),
                            _formRegistration('Зарегистрироваться', _registerUser),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Уже есть аккаунт? ',
                                    style: TextStyle(color: Colors.black, fontSize: 17),
                                    children: [
                                      TextSpan(
                                        text: 'Войти в систему',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = () {
                                          setState(() {
                                            showLogin = true;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
