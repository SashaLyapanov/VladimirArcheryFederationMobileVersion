import 'package:flutter/material.dart';

import '../../drawer/view/drawer.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {

    Widget _new() {
      return Container(
          padding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 10),
          child: Text("Заголовок"),
      );
    }





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
              null;
            },
          ),
          title: Center(child: Text("Новости", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
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
                      height: 300,
                      child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                              child: Text("Всем привет, зовусь я Саня!!!" + index.toString()),
                            );
                          }),
                    )
                  )]),
                ],
              ),),
            ],),),);

  }
}
