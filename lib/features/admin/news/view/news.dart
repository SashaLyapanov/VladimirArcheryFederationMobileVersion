import 'package:flutter/material.dart';

import '../../drawer/view/drawer.dart';


class NewsAdminPage extends StatefulWidget {
  const NewsAdminPage({super.key});

  @override
  State<NewsAdminPage> createState() => _NewsAdminPageState();
}

class _NewsAdminPageState extends State<NewsAdminPage> {
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
        endDrawer: AdminDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.red,
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
            SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Text("Всем привет, зовусь я Саня!!!" + index.toString()),
                  );
              },
              childCount: 50,
              ),),
            ],),),);

  }
}
