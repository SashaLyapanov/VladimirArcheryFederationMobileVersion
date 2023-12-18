import 'dart:typed_data';

import 'package:archery_federation/services/models/models.dart';
import 'package:flutter/material.dart';
import '../../drawer/view/drawer.dart';
import '../../news/view/news.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../widgets/widgetsForArticlePage.dart';

class AdminArticlePage extends StatefulWidget {
  final String articleId;
  final Article? article;

  const AdminArticlePage({super.key, required this.articleId, required this.article});

  @override
  State<AdminArticlePage> createState() => _AdminArticlePage(articleId, article!);
}

class _AdminArticlePage extends State<AdminArticlePage> {
  final storage = FlutterSecureStorage();
  late String articleId;
  late Article article;
  String? role;

  @override
  void initState() {
    _loadStorageData();
    super.initState();
  }

  Future<void> _loadStorageData() async {
    role = await storage.read(key: 'userRole');
    setState(() {});
  }

  _AdminArticlePage(this.articleId, this.article);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Новости",
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
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    (
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 100,
                                  child: InkWell(
                                      onTap: () {Navigator.pop(context);},
                                      child: const Image(
                                        image: AssetImage('assets/images/backArrow/backArrow1.png'),)
                                  ),
                                ),
                              ),
                            ),
                            articleName(article.name),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Image.memory(Uint8List.fromList(article.fileData1!)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                              child: articleBody(article.body),
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
