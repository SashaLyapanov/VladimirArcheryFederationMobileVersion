import 'dart:typed_data';

import 'package:archery_federation/features/admin/newPage/view/createNew.dart';
import 'package:archery_federation/services/article_service.dart';
import 'package:archery_federation/services/models/article.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../drawer/view/drawer.dart';


class NewsAdminPage extends StatefulWidget {
  const NewsAdminPage({super.key});

  @override
  State<NewsAdminPage> createState() => _NewsAdminPageState();
}

class _NewsAdminPageState extends State<NewsAdminPage> {
  List<Article>? articles;

  Future<void> _loadDataLists() async {
    articles = await ArticleService(dio: Dio()).getAllArticles();
    setState(() {});
  }

  @override
  void initState() {
    _loadDataLists();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAdminPage()));
            },
          ),
          title: const Center(child: Text("Новости", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
        ),
        backgroundColor: Colors.white,
        body: (articles == null)
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
                          articles = await ArticleService(dio: Dio()).getAllArticles();
                          setState(() {});
                        },
                        child: ListView.builder(
                          itemCount: articles?.length,
                          itemBuilder: (BuildContext context, int index) {
                            Color cardColor = Colors.white;
                            return Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                              child: InkWell(
                                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNewCreate())); },
                                child: Card(
                                  color: cardColor,
                                  shadowColor: Colors.white70,
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color.fromARGB(100, 120, 164, 255),
                                        width: 3
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: ListTile(
                                    title: Text("Заголовок: ${articles?[index].name}"),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("${articles?[index].body}"),
                                        Text("Новость от: ${articles?[index].dateTime.toLocal().toString().split(' ')[0]}"),
                                        Center(
                                          child: SizedBox(
                                            height: 200,
                                            width: 200,
                                            child: Image.memory(Uint8List.fromList(articles![0].fileData1!)),
                                          ),
                                        ),
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




  // @override
  // Widget build(BuildContext context) {
  //
  //   Widget _new() {
  //     return Container(
  //         padding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 10),
  //         child: Text("Заголовок"),
  //     );
  //   }
  //
  //
  //
  //   return MaterialApp(
  //       home: Scaffold(
  //       endDrawer: AdminDrawer(),
  //       appBar: AppBar(
  //         backgroundColor: Colors.red,
  //         leading: IconButton(
  //           icon: CircleAvatar(
  //             backgroundImage: AssetImage('assets/images/logo.jpg'),
  //             radius: 30,
  //           ),
  //           onPressed: () {
  //             null;
  //           },
  //         ),
  //         title: Center(child: Text("Новости", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
  //       ),
  //       backgroundColor: Colors.white,
  //       body: CustomScrollView(
  //         slivers: [
  //           SliverList(delegate: SliverChildBuilderDelegate(
  //               (BuildContext context, int index) {
  //                 return Padding(
  //                   padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
  //                   // child: Text("Всем привет, зовусь я Саня!!!" + index.toString()),
  //                   child: Center(
  //                     child: Image.memory(Uint8List.fromList(articles![0].fileData1!)),
  //                   ),
  //                 );
  //             },
  //             childCount: 50,
  //             ),),
  //           ],),),);
  //
  // }
}
