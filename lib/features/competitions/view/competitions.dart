import 'package:archery_federation/features/competition/competition.dart';
import 'package:archery_federation/features/news/view/news.dart';
import 'package:archery_federation/services/competition_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../services/models/models.dart';
import '../../drawer/view/drawer.dart';

class CompetitionPage extends StatefulWidget {
  const CompetitionPage({super.key});

  @override
  State<CompetitionPage> createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {

  List<Competition>? competitionList;

  @override
  void initState() {
    _loadCompetitionList();
    super.initState();
  }

  Future<void> _loadCompetitionList() async {
    competitionList = await CompetitionService(dio: Dio()).getCompetitionList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          title: Center(child: Text("Соревнования", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
        ),
        backgroundColor: Colors.white,
        body: (competitionList == null)
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
          slivers: <Widget>[
            SliverList(delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        competitionList = await CompetitionService(dio: Dio()).getCompetitionList();
                        setState(() {});
                      },
                      child: ListView.builder(
                        itemCount: competitionList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          Color cardColor = index % 2 == 0 ? const Color.fromARGB(100, 120, 164, 255) : Colors.white;
                          return Padding(
                            padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                            child: InkWell(
                              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CompetitionInfoPage(competitionId: '${competitionList?[index].id}', competition: competitionList![index]))); },
                              child: Card(
                                color: cardColor,
                                shadowColor: Colors.white70,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color.fromARGB(100, 120, 164, 255),
                                    width: 3
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                                ),
                                child: ListTile(
                                  title: Text("Название: ${competitionList?[index].name}"),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Место проведения: ${competitionList?[index].place}"),
                                      Text("Дата проведения: ${competitionList?[index].date.toLocal().toString().split(' ')[0]}"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
              }
            ),),
          ],),),);
  }
}
