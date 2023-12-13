import 'package:archery_federation/services/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import '../../../services/generalService.dart';
import '../../admin/news/view/view.dart';
import '../../drawer/view/drawer.dart';
import '../../news/view/news.dart';
import '../../aboutUs/view/view.dart';
import 'package:archery_federation/services/models/models.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  User? user;
  final storage = FlutterSecureStorage();
  int? response;
  List<Sex>? genderList;
  List<SportsTitle>? sportsTitleList;
  List<Region>? regionList;
  var _dropdownValue;
  var _dropdownValue1;
  var _dropdownValue2;

  @override
  void initState() {
    _loadDataLists();
    super.initState();
  }

  Future<void> _loadDataLists() async {
    genderList = await GeneralService(dio: Dio()).getSexList();
    sportsTitleList = await GeneralService(dio: Dio()).getSportsTitleList();
    regionList =  await GeneralService(dio: Dio()).getRegionList();
    setState(() {});
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _patronymicController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passswordController = TextEditingController();
  TextEditingController _birthYearController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _regionController = TextEditingController();

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
          child: const Align(
            child: Text('Вход', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black ),
            ),
          ),
        ),
      );
    }

    Widget _logoForRegistration() {
      return const Padding(
        padding: EdgeInsets.only(top: 30),
        child: Align(
          child: Center(
            child: Text('Регистрация в системе', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          )
          ),
        ),
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool visible) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          width: 345,
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
                    borderSide: BorderSide(color: Colors.blue, width: 1)
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: IconTheme(
                    data: IconThemeData(color: Colors.blue),
                    child: icon,
                  ),
                )
            ),
          ),
        ),
      );
    }

    Widget _selectSex(Icon icon, String hint, TextEditingController controller, List<Sex> list) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Card(
          shadowColor: Colors.white70,
          shape: const RoundedRectangleBorder(
          side: BorderSide(
          color: Colors.blue,
          width: 1
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 5, right: 20, bottom: 5),
            child: Row (
              children: [
                IconTheme(
                  data: IconThemeData(color: Colors.blue),
                  child: Padding(padding: EdgeInsets.only(right: 10), child: icon,)),
                DropdownButton(
                  value: _dropdownValue,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                  hint: Text(hint, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black), softWrap: true, textAlign: TextAlign.left,),
                  items: [
                    ...List.generate(list.length, (index) => index)
                        .map((element) => DropdownMenuItem(
                      value: list[element].id,
                      child: SizedBox(
                        width: 250,
                        height: 40,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(list[element].name, style: const TextStyle(color: Colors.black), softWrap: true, textAlign: TextAlign.left,),
                        ),
                      ),
                    ),).toList()
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                      controller.text = newValue.toString();
                    });
                  },
                ),
              ],
            )
          ) ,
        ),
      );
    }


    Widget _selectSportsTitle(Icon icon, String hint, TextEditingController controller, List<SportsTitle> list) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Card(
          shadowColor: Colors.white70,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blue,
                width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 10, top: 5, right: 20, bottom: 5),
              child: Row (
                children: [
                  IconTheme(
                      data: IconThemeData(color: Colors.blue),
                      child: Padding(padding: EdgeInsets.only(right: 10), child: icon,)),
                  DropdownButton(
                    value: _dropdownValue1,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    hint: Text(hint, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black), softWrap: true, textAlign: TextAlign.left,),
                    items: [
                      ...List.generate(list.length, (index) => index)
                          .map((element) => DropdownMenuItem(
                        value: list[element].id,
                        child: SizedBox(
                          width: 250,
                          height: 40,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(list[element].name, style: const TextStyle(color: Colors.black), softWrap: true, textAlign: TextAlign.left,),
                          ),
                        ),
                      ),).toList()
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        _dropdownValue1 = newValue;
                        controller.text = newValue.toString();
                      });
                    },
                  ),
                ],
              )
          ) ,
        ),
      );
    }

    Widget _selectRegion(Icon icon, String hint, TextEditingController controller, List<Region> list) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Card(
          shadowColor: Colors.white70,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blue,
                width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 10, top: 5, right: 20, bottom: 5),
              child: Row (
                children: [
                  IconTheme(
                      data: IconThemeData(color: Colors.blue),
                      child: Padding(padding: EdgeInsets.only(right: 10), child: icon,)),
                  DropdownButton(
                    value: _dropdownValue2,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    hint: Text(hint, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black), softWrap: true, textAlign: TextAlign.left,),
                    items: [
                      ...List.generate(list.length, (index) => index)
                          .map((element) => DropdownMenuItem(
                        value: list[element].id,
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(list[element].name, style: const TextStyle(color: Colors.black), softWrap: true, textAlign: TextAlign.left,),
                          ),
                        ),
                      ),).toList()
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        _dropdownValue2 = newValue;
                        controller.text = newValue.toString();
                      });
                    },
                  ),
                ],
              )
          ) ,
        ),
      );
    }


    Widget _calendar(TextEditingController controller) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          width: 345,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue),
                  child: Icon(Icons.calendar_month),
                ),
              ),
              labelText: "Выберите дату рождения",
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3)
              ),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              if (pickedDate != null) {
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                debugPrint(formattedDate); //formatted date output using intl package =>  2021-03-16
                setState(() {
                  controller.text = formattedDate;
                });
              } else {}
            },
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
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _input(const Icon(Icons.person), "Имя", _nameController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _input(const Icon(Icons.person), "Фамилия", _surnameController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _input(const Icon(Icons.person), "Отчество", _patronymicController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _input(const Icon(Icons.email), "Email", _emailController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _input(const Icon(Icons.lock), "Password", _passswordController, true),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _calendar(_birthYearController)),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
            child: _selectSex(const Icon(Icons.male), "Пол", _genderController, genderList!),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _selectSportsTitle(const Icon(Icons.arrow_upward), "Разряд/звание", _titleController, sportsTitleList!),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _selectRegion(const Icon(Icons.flag), "Регион", _regionController, regionList!),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,),
            child:  SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: _button(label, func)
              ),
            ),
          )
        ],
      );
    }

    Future<void> _loginUser() async {
     email = _emailController.text;
     password = _passswordController.text;

     user = await AuthService(dio: Dio()).signInWithEmailAndPassword(email, password);
     setState(() {});
     String? role = await storage.read(key: 'userRole');

      if (role == "SPORTSMAN") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
      } else if (role == "ADMIN") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewsAdminPage()));
      }
    }

    void _registerUser() async {
      name = _nameController.text;
      surname = _surnameController.text;
      patronymic = _patronymicController.text;
      email = _emailController.text;
      password = _passswordController.text;
      birthYear = _birthYearController.text;
      gender = _genderController.value.text;
      title = _titleController.value.text;
      region = _regionController.value.text;

      response = await AuthService(dio: Dio()).signUp(name, surname, patronymic, email, password, birthYear, gender, title, region);
      setState(() {});
      if (response == 200) {
        showLogin = true;
        setState(() {});
      }
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
