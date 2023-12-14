import 'package:archery_federation/features/admin/competitions/competitions.dart';
import 'package:archery_federation/services/competition_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../../services/generalService.dart';
import '../../../../services/models/models.dart';
import '../../../news/view/news.dart';
import '../../drawer/view/drawer.dart';
import '../widgets/widgetsForCreate.dart';

class AdminCompetitionCreate extends StatefulWidget {
  const AdminCompetitionCreate({super.key});

  @override
  State<AdminCompetitionCreate> createState() => _AdminCompetitionCreateState();
}

class _AdminCompetitionCreateState extends State<AdminCompetitionCreate> {
  final storage = FlutterSecureStorage();
  int? response;
  List<Category>? categories;
  List<BowType>? bowTypeList;
  List<CompetitionType>? competitionTypeList;
  var _dropdownValueForBowType;
  var _dropdownValueForCompetitionType;
  String? sportsmanId;
  List<MultiSelectItem<Category>>? _itemsCategory;
  List<MultiSelectItem<BowType>>? _itemsBowTypes;

  List<Category> selectedCategory = [];
  List<BowType> selectedBowType = [];

  Future<void> _loadItemsList() async {
    _itemsCategory = await categories!.map((category) => MultiSelectItem<Category>(category, category.name)).toList();
    _itemsBowTypes = await bowTypeList!.map((bowType) => MultiSelectItem<BowType>(bowType, bowType.bowTypeName)).toList();
    setState(() {});
  }

  @override
  void initState() {
    _loadStorageData();
    _loadDataLists();
    super.initState();
  }

  Future<void> _loadStorageData() async {
    sportsmanId = await storage.read(key: 'userId');
    setState(() {});
  }

  Future<void> _loadDataLists() async {
    categories = await GeneralService(dio: Dio()).getAllCategories();
    bowTypeList = await GeneralService(dio: Dio()).getAllBowTypes();
    competitionTypeList = await GeneralService(dio: Dio()).getAllCompetitionTypes();
    _loadItemsList();
    setState(() {});
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  TextEditingController _typeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _mainJudgeController = TextEditingController();
  TextEditingController _secretaryController = TextEditingController();
  TextEditingController _zamJudgeController = TextEditingController();
  TextEditingController _judgesController = TextEditingController();

  late String name;
  late String place;
  late String date;
  late String typeId;
  late String price;
  late String mainJudge;
  late String secretary;
  late String zamJudge;
  late String judges;

  _AdminCompetitionCreateState();

  @override
  Widget build(BuildContext context) {

    Widget _selectCompetitionType(Icon icon, String hint, TextEditingController controller, List<CompetitionType> list) {
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
                    value: _dropdownValueForCompetitionType,
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
                        _dropdownValueForCompetitionType = newValue;
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
              labelText: "Выберите дату проведения",
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

    Widget _formRegistration(String label, void func()) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Название", _nameController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Место проведения", _placeController, false),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _calendar(_dateController)),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _selectCompetitionType(const Icon(Icons.call_made), "Вид соревнований", _typeController, competitionTypeList!)),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Цена", _priceController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: MultiSelectDialogField(
              items: _itemsBowTypes!,
              title: const Text("Спортивная дисциплина", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              selectedColor: Colors.blue,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              buttonIcon: const Icon(
                Icons.group_add_outlined,
                color: Colors.blue,
              ),
              buttonText: const Text(
                "Спортивная дисциплина",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              onConfirm: (results) {
                selectedBowType = results;
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: MultiSelectDialogField(
              items: _itemsCategory!,
              title: const Text("Категории участников", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              selectedColor: Colors.blue,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              buttonIcon: const Icon(
                Icons.group_add_outlined,
                color: Colors.blue,
              ),
              buttonText: const Text(
                "Категории участников",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onConfirm: (results) {
                selectedCategory = results;
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Главный судья", _mainJudgeController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Главный секретарь", _secretaryController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Заместитель судьи", _zamJudgeController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Судьи (через запятую)", _judgesController, false),
          ),
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

    void _createCompetition() async {
      name = _nameController.text;
      place = _placeController.text;
      date = _dateController.text;
      typeId = _typeController.text;
      price = _priceController.text;
      mainJudge = _mainJudgeController.text;
      secretary = _secretaryController.text;
      zamJudge = _zamJudgeController.text;
      judges = _judgesController.text;

      response = await CompetitionService(dio: Dio()).createCompetition(name, place, date, typeId, price, selectedCategory!, selectedBowType!, mainJudge, secretary, zamJudge, judges);
      setState(() {});
      if (response == 200) {
        setState(() {});
        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminCompetitionPage()));
      } else {
        //Добавить обработчик события в результате получения statusCode != 200
        //можно просто выводить диалоговое окно с предупреждением о том, что пришло в response.message
      }
    }

    return MaterialApp(
      title: "Соревнования",
      home: Scaffold(
        endDrawer: AdminDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
              radius: 30,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
            },
          ),
          title: const Center(child: Text("Новое соревнование", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
        ),
        backgroundColor: Colors.white,
        body: (categories == null)
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
                                _formRegistration('Создать', _createCompetition),
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
