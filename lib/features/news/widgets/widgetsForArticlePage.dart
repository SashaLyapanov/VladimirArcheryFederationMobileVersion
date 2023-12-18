import 'package:flutter/material.dart';

Widget articleName(String name) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Align(
      child: Text(name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black ), softWrap: true, textAlign: TextAlign.center,
      ),
    ),
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