import 'package:archery_federation/services/models/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../services/sportsman_service.dart';
import '../../competitionRegistration/view/competitionRegistration.dart';
import '../../drawer/view/drawer.dart';
import '../../news/view/view.dart';
import '../widgets/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CompetitionInfoPage extends StatefulWidget {
  final String competitionId;
  final Competition? competition;

  const CompetitionInfoPage({super.key, required this.competitionId, required this.competition});

  @override
  State<CompetitionInfoPage> createState() => _CompetitionInfoPageState(competitionId, competition!);
}

class _CompetitionInfoPageState extends State<CompetitionInfoPage> {
  final storage = FlutterSecureStorage();
  late String competitionId;
  late Competition competition;
  String dropDownValue = "all";
  List<Sportsman>? sportsmen;
  String? role;

  @override
  void initState() {
    _loadStorageData();
    _loadSportsmanList();
    super.initState();
  }

  Future<void> _loadStorageData() async {
    role = await storage.read(key: 'userRole');
    setState(() {});
  }

  Future<void> _loadSportsmanList() async {
    sportsmen = await SportsmanService(dio: Dio()).getSportsmanListByCompetitionAndBowType(competition.id, dropDownValue);
    setState(() {});
  }

  _CompetitionInfoPageState(this.competitionId, this.competition);

  @override
  Widget build(BuildContext context) {
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
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    (
                        Column(
                          children: <Widget>[
                            competitionName(competition.name),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                              child: infoAboutPage(competition)
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: sportsmanLabel(),
                            ),
                            Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 150,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: DropdownButton<String>(
                                    value: dropDownValue,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    icon: const Icon(Icons.arrow_drop_down_sharp),
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16,),
                                    isExpanded: true,
                                    dropdownColor: Colors.blue,
                                    // dropdownColor: Color.fromARGB(100, 100, 0, 0),
                                    onChanged: (String? newValue) async {
                                      setState(() {
                                        dropDownValue = newValue!;
                                      });
                                    },
                                    items: [
                                      const DropdownMenuItem(
                                          value: "all",
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text("Все", style: TextStyle(color: Colors.white), softWrap: true, textAlign: TextAlign.center,),)
                                      ),
                                      ...List.generate(competition.bowTypeList.length, (index) => index)
                                        .map((element) => DropdownMenuItem(
                                          value: competition.bowTypeList[element].bowTypeName,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(competition.bowTypeList[element].bowTypeName, style: const TextStyle(color: Colors.white), softWrap: true, textAlign: TextAlign.center,),
                                          )
                                      ),).toList()
                                    ],
                                ),)
                                ),

                                button("Зарегистрироваться", () => {
                                  if (role == "SPORTSMAN") {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => CompetitionRegistrationForm(competitionId: competitionId,)))
                                    }
                                  }
                                ),

                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                                child: RefreshIndicator(
                                    onRefresh: () async {
                                      sportsmen = await SportsmanService(dio: Dio()).getSportsmanListByCompetitionAndBowType(competition.id, dropDownValue);
                                      setState(() {});
                                    }, child: (sportsmen != null) ? participantList(competition, sportsmen!)
                                    : const Text("На данный момент на данные соревнования никто не зарегистрировался в данной категории", style: TextStyle(color: Colors.black, fontSize: 18,), softWrap: true, textAlign: TextAlign.center,),
                                )



                            ),
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
