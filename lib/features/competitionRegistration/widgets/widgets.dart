import 'package:flutter/material.dart';

Widget logoForRegistrationToCompetition() {
  return const Padding(
    padding: EdgeInsets.all(30),
    child: Align(
      child: Align(
          alignment: Alignment.center,
          child: Text('Регистрация на соревнования', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black), softWrap: true, textAlign: TextAlign.center,
          )
      ),
    ),
  );
}


Widget input(Icon icon, String hint, TextEditingController controller, bool visible) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, bottom: 2),
    child: SizedBox(
      width: 345,
      child: TextField(
        readOnly: true,
        controller: controller,
        obscureText: visible,
        style: TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 3)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1)
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.blue),
                child: icon,
              ),
            )
        ),
      ),
    ),
  );
}


Widget button(String text, void func()) {
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