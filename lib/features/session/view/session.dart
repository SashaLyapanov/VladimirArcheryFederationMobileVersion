import 'package:archery_federation/features/news/view/news.dart';
import 'package:flutter/material.dart';

import '../../drawer/view/drawer.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
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
          title: Center(child: Text("Тренировки", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                Column(
                    children: <Widget>[
                      (
                          Text(
                              'Регистрация',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 17,
                                decoration: TextDecoration.underline,
                              ))

                      )]),
              ],
            ),),
          ],),),);

  }
}
