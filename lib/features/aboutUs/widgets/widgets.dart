import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget aboutFederationManagers(String managers) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(managers, style: const TextStyle(fontSize: 16, color: Colors.black ), softWrap: true,
      ),
    ),
  );
}
Widget aboutFederationContacts(String contacts) {
  return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(contacts, style: const TextStyle(fontSize: 16, color: Colors.black ), softWrap: true,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
                children: [
                  Text("РОО 'ФСЛВО'/клуб 'Стрела и Болт'", style: const TextStyle(fontSize: 16, color: Colors.black ), softWrap: true,),
                  IconButton(
                      onPressed: () {
                        launch('https://vk.com/arbalet33');
                      },
                      icon: Image.asset('assets/images/vk.png')),
                ]
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
                children: [
                  Text("Нижегородский стрелковый клуб", style: const TextStyle(fontSize: 16, color: Colors.black ), softWrap: true,),
                  IconButton(
                      onPressed: () {
                        launch('https://vk.com/arbalet33');
                      },
                      icon: Image.asset('assets/images/vk.png')),
                ]
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
                children: [
                  Text("Наша электронная почта", style: const TextStyle(fontSize: 16, color: Colors.black ), softWrap: true,),
                  IconButton(
                      onPressed: () {
                        launch('mailto:roofslvo@mail.ru');
                      },
                      icon: Image.asset('assets/images/mail.png')
                  ),
                ]
            ),
          ),
        ],
      )
  );
}

Widget articleBody(String body) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(body, style: const TextStyle(fontSize: 16, color: Colors.black ), softWrap: true, textAlign: TextAlign.left,
      ),
    ),
  );
}