import 'package:flutter/material.dart';

Widget authButton(String text, void func()) {
  return ElevatedButton(
      style: (
          ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          )
      ),
      onPressed: (){
        func();
      },
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      )
  );
}