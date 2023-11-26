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
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                Column(
                    children: <Widget>[
                      (
                          Container(
                              child: ElevatedButton(
                                  style: (
                                      ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                      )
                                  ),
                                  onPressed: () async {
                                    competitionList = await CompetitionService(dio: Dio()).getCompetitionList();
                                    setState(() {});
                                    // CompetitionService(dio: Dio()).getCompetition("Первое");
                                  },
                                  child: Text(
                                    "Вывести соревнования",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                                  )
                              ),
                          )

                      )]),
              ],
            ),),
          ],),),);

  }
}
