import 'dart:typed_data';

import 'package:archery_federation/services/article_service.dart';
import 'package:archery_federation/services/models/article.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../drawer/view/drawer.dart';
import 'articlePage.dart';



class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
        endDrawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
              radius: 30,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
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
                            return Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                              child: InkWell(
                                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    ArticlePage(articleId: '${articles?[index].id}', article: articles![index]))); },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.black.withOpacity(0.2)),
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          )
                                        ]
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          child: Image.memory(Uint8List.fromList(articles![index].fileData1!)),
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text("${articles?[index].name}",
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                  maxLines: 1 ,
                                                  overflow: TextOverflow.ellipsis,),
                                                SizedBox(height: 5),
                                                Text("${articles?[index].dateTime.toLocal().toString().split(' ')[0]}",
                                                  style: TextStyle(color: Colors.grey), softWrap: true,),
                                                SizedBox(height: 10),
                                                Text("${articles?[index].body}",
                                                  style: TextStyle(),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(width: 15),
                                      ],
                                    )
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                }
            ),),
          ],),
      ),);
  }

}