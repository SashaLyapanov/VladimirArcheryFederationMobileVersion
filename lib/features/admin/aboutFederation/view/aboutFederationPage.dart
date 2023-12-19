import 'dart:io';
import 'package:archery_federation/services/about_federation_service.dart';
import 'package:archery_federation/services/models/models.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../drawer/view/drawer.dart';
import '../../news/view/news.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../widgets/widgetsForAboutFederationPage.dart';

class AdminAboutFederationPage extends StatefulWidget {

  const AdminAboutFederationPage({super.key});

  @override
  State<AdminAboutFederationPage> createState() => _AdminAboutFederationPage();
}

class _AdminAboutFederationPage extends State<AdminAboutFederationPage> {
  final storage = FlutterSecureStorage();
  late String aboutFederationId;
  late AboutFederation? aboutFederation;
  String? role;

  List<AboutFederation>? aboutFederationList;

  Future<void> _loadDataLists() async {
    aboutFederationList = await AboutFederationService(dio: Dio()).getAllAboutFederation();
    setState(() {});
  }

  @override
  void initState() {
    _loadDataLists();
    _loadStorageData();
    super.initState();
  }

  Future<void> _loadStorageData() async {
    role = await storage.read(key: 'userRole');
    setState(() {});
  }


  Future<void> _downloadFile(List<int> fileBytes, String fileName) async {
    Permission.storage.request().then((status) async {
      print('Статус разрешения ${status}');
      if (status.isGranted) {
        Directory downloadsDirectory = await getApplicationDocumentsDirectory();
        String downloadsDirectoryPath = downloadsDirectory.path;
        String filePath = '$downloadsDirectoryPath/$fileName';

        // Записываем файл на диск
        File newFile = File(filePath);
        newFile.writeAsBytes(fileBytes).then((File file) => {
          debugPrint('Файл сохранен в: ${newFile.path}')
        });
        // await File(filePath).writeAsBytes(fileBytes);
      // } else if (status.isDenied) {
      //   // Разрешение отклонено, показываем диалоговое окно с объяснением
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('Разрешение не предоставлено'),
      //         content: Text('Для работы приложения необходимо разрешение на запись во внешнее хранилище.'),
      //         actions: <Widget>[
      //           ElevatedButton(
      //             child: Text('Запросить разрешение'),
      //             onPressed: () {
      //               status = PermissionStatus.granted;
      //               setState(() {});
      //             },
      //           ),
      //         ],
      //       );
      //     },
      //   );
      } else {
        debugPrint("Сутеа");
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "О федерации",
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
          title: const Center(child: Text("О федерации", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
        ),
        backgroundColor: Colors.white,
        body: (aboutFederationList == null)
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
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 100,
                                  child: InkWell(
                                      onTap: () {Navigator.pop(context);},
                                      child: const Image(
                                        image: AssetImage('assets/images/backArrow/backArrow5.png'),)
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text("Руководящий состав", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            aboutFederationManagers(aboutFederationList![0].managers),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await _downloadFile(aboutFederationList![0].fileDataForRegulation!, aboutFederationList![0].fileRegulationName);
                                },
                                child: Text("Скачать устав федерации", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await _downloadFile(aboutFederationList![0].fileDataForHistory!, aboutFederationList![0].fileHistoryName);
                                },
                                child: Text("Скачать историю федерации", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text("Контактная информация", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            aboutFederationContacts(aboutFederationList![0].contacts),
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
