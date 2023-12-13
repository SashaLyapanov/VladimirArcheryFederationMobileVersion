import 'package:archery_federation/services/sportsman_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../services/generalService.dart';
import '../../../services/models/models.dart';
import '../../competitions/view/competitions.dart';
import '../../drawer/view/drawer.dart';
import '../../news/view/news.dart';
import '../widgets/widgets.dart';

class CompetitionRegistrationForm extends StatefulWidget {
  final String competitionId;
  const CompetitionRegistrationForm({super.key, required this.competitionId});

  @override
  State<CompetitionRegistrationForm> createState() => _CompetitionRegistrationFormState(competitionId);
}

class _CompetitionRegistrationFormState extends State<CompetitionRegistrationForm> {
  final storage = FlutterSecureStorage();
  String? response;
  List<Sex>? genderList;
  List<BowType>? bowTypeList;
  var _dropdownValueForBowType;
  String? sportsmanId;
  late String competitionId;

  @override
  void initState() {
    _loadStorageData();
    _loadDataLists();
    super.initState();
  }

  Future<void> _loadStorageData() async {
    sportsmanId = await storage.read(key: 'userId');
    _nameController.text = (await storage.read(key: 'userName'))!;
    _surnameController.text = (await storage.read(key: 'userSurname'))!;
    _patronymicController.text = (await storage.read(key: 'userPatronymic'))!;
    setState(() {});
  }


  Future<void> _loadDataLists() async {
    genderList = await GeneralService(dio: Dio()).getSexList();
    bowTypeList = await GeneralService(dio: Dio()).getAllBowTypeByCompetition(competitionId!);
    setState(() {});
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _patronymicController = TextEditingController();

  TextEditingController _bowTypeController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _regionController = TextEditingController();

  late String bowType;
  late String gender;
  late String region;
  late String club;
  late bool showLogin = true;

  _CompetitionRegistrationFormState(this.competitionId);

  @override
  Widget build(BuildContext context) {

    Widget _selectBowType(Icon icon, String hint, TextEditingController controller, List<BowType> list) {
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
                    value: _dropdownValueForBowType,
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
                            child: Text(list[element].bowTypeName, style: const TextStyle(color: Colors.black), softWrap: true, textAlign: TextAlign.left,),
                          ),
                        ),
                      ),).toList()
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        _dropdownValueForBowType = newValue;
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

    Widget _formRegistration(String label, void func()) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Фамилия", _surnameController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Имя", _nameController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Отчество", _patronymicController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _selectBowType(const Icon(Icons.call_made), "Спортивная дисциплина", _bowTypeController, bowTypeList!)),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,),
            child:  SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: button(label, func)
              ),
            ),
          )
        ],
      );
    }

    void _registerParticipant() async {
      bowType = _bowTypeController.text;
      gender = _genderController.value.text;
      region = _regionController.value.text;

      response = await SportsmanService(dio: Dio()).registrateInCompetition(sportsmanId!, competitionId!, bowType);
      setState(() {});
      if (response != "Вы уже зарегистрированы на данных соревнованиях") {
        setState(() {});
        Navigator.pop(context);
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CompetitionPage()));
      }
    }


    return MaterialApp(
      title: "Соревнования",
      home: Scaffold(
        endDrawer: MainDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
              radius: 30,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
            },

          ),
          title: const Center(child: Text("Соревнования", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
        ),
        backgroundColor: Colors.white,
        body: (genderList == null)
            ? const Center(child: CircularProgressIndicator())
        : CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    (
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                logoForRegistrationToCompetition(),
                                _formRegistration('Зарегистрироваться', _registerParticipant),
                              ],
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
