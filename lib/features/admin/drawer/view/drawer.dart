import 'package:archery_federation/features/aboutUs/aboutUs.dart';
import 'package:archery_federation/features/drawer/drawer.dart';
import 'package:archery_federation/features/link/link.dart';
import 'package:archery_federation/features/news/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../services/auth.dart';
import '../../competitions/view/competitions.dart';
import '../../news/view/news.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({super.key});

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  final storage = FlutterSecureStorage();
  String? role;
  String? userName;
  String? userEmail;

  @override
  void initState() {
    _loadStorageData();
    super.initState();
  }

  Future<void> _loadStorageData() async {
    role = await storage.read(key: 'userRole');
    userName = await storage.read(key: "userName");
    userEmail = await storage.read(key: "userEmail");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            accountName: const Text("Вы здесь Босс"),
            accountEmail: (userEmail != null) ? Text(userEmail!) : null,
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black), // Цвет текста кнопки
                overlayColor: MaterialStateProperty.all(Colors.transparent), // Цвет при наведении
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNewCreate()));
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAdminPage()));
              },
              child: Text('Новости', style: TextStyle(fontSize: 20)),
            ),
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black), // Цвет текста кнопки
                overlayColor: MaterialStateProperty.all(Colors.transparent), // Цвет при наведении
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
              child: Text('О федерации', style: TextStyle(fontSize: 20)),
            ),
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black), // Цвет текста кнопки
                overlayColor: MaterialStateProperty.all(Colors.transparent), // Цвет при наведении
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminCompetitionPage()));
              },
              child: Text('Соревнования', style: TextStyle(fontSize: 20)),
            ),
          ),
          Divider(),
          // ListTile(title: Text('Ссылки на информационные ресурсы', style: TextStyle(fontSize: 20))),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black), // Цвет текста кнопки
                overlayColor: MaterialStateProperty.all(Colors.transparent), // Цвет при наведении
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LinksPage()));
              },
              child: const Text('Информационные ресурсы', style: TextStyle(fontSize: 20)),
            ),
          ),
          // Divider(),
          // check(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [IconButton(
                      onPressed: () {
                        launch('https://vk.com/arbalet33');
                      },
                      icon: Image.asset('assets/images/vk.png')
                  ),
                    IconButton(
                        onPressed: () {
                          launch('mailto:roofslvo@mail.ru');
                        },
                        icon: Image.asset('assets/images/mail.png')
                    )],
               ),
          Align(
                alignment: Alignment.center,
                child: (
                authButton("Выйти", () => signOut())
                ))
              // ),
            // ],
          // )
        ],
      ),
    );
  }

  signOut() async {
    await AuthService(dio: Dio()).signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewsPage()));
  }
}
