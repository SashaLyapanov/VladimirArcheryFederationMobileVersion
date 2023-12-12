import 'package:archery_federation/features/aboutUs/aboutUs.dart';
import 'package:archery_federation/features/account/account.dart';
import 'package:archery_federation/features/auth/auth.dart';
import 'package:archery_federation/features/competitions/competitions.dart';
import 'package:archery_federation/features/drawer/drawer.dart';
import 'package:archery_federation/features/link/link.dart';
import 'package:archery_federation/features/news/news.dart';
import 'package:archery_federation/features/session/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../services/auth.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
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
            accountName: (userName != null) ? Text(userName!) : const Text("Неавторизованный пользователь"),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompetitionPage()));
              },
              child: Text('Найти соревнование', style: TextStyle(fontSize: 20)),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SessionPage()));
              },
              child: Text('Тренировка 3D', style: TextStyle(fontSize: 20)),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SessionPage()));
              },
              child: Text('Тренировка Target', style: TextStyle(fontSize: 20)),
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
              child: Text('Информационные ресурсы', style: TextStyle(fontSize: 20)),
            ),
          ),
          Divider(),
          // ListTile(title: Text('Личный кабинет', style: TextStyle(fontSize: 20))),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black), // Цвет текста кнопки
                overlayColor: MaterialStateProperty.all(Colors.transparent), // Цвет при наведении
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
              },
              child: Text('Личный кабинет', style: TextStyle(fontSize: 20)),
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
                child: (_checkAuth()) ?
                authButton("Выйти", () => signOut())
                    : authButton("Вход", () => signIn()),
               )
              // ),
            // ],
          // )
        ],
      ),
    );
  }

  signOut() async {
    await AuthService(dio: Dio()).signOut();
    Navigator.pop(context);
  }

  signIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorizationPage()));
  }

  _checkAuth() {
    if (role == 'SPORTSMAN' || role == 'ADMIN') {
      return true;
    } else {
      return false;
    }
  }
}
