import 'package:archery_federation/services/models/competition.dart';
import 'package:flutter/material.dart';
import '../../../services/models/models.dart';

Widget competitionName(String name) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Align(
      child: Text(name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black ), softWrap: true, textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget sportsmanLabel() {
  return const Padding(
    padding: EdgeInsets.only(top: 10),
    child: Align(
      alignment: Alignment.center,
      child: Text("Зарегистрированные спортсмены", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black ), softWrap: true, textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget button(String text, void func()) {
  return SizedBox(
      width: 150,
      height: 75,
      child: ElevatedButton(
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
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15), softWrap: true, textAlign: TextAlign.center,
      )
  ));
}

Widget dropDownButton(List<Category> categories, String selectedValue) {
  return DropdownButton(
      // текущее значение
      value: selectedValue,
      // список элементов
      items: categories.map((category)
  {
    return DropdownMenuItem(
      value: category,
      child: Text(category.name),
    );
  }).toList(),
  // обработчик изменения значения
  onChanged: (newValue) {
    // setState(() {
    //   selectedValue = newValue;
    // );
  },
  );
}

Widget infoAboutPage(Competition competition) {
  const Color subtitleColor = Color.fromARGB(255, 52, 49, 49);
  return Card(
    color: Colors.white,
    shadowColor: Colors.white70,
    shape: const RoundedRectangleBorder(
      side: BorderSide(
          color: Color.fromARGB(100, 120, 164, 255),
          width: 3
      ),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: ListTile(
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Название:", style: TextStyle(color: Colors.black, fontSize: 20,),),
          Text(competition!.name, style: const TextStyle(color: subtitleColor, fontSize: 18,),),
          const Text("Место проведения:", style: TextStyle(color: Colors.black, fontSize: 20,),),
          Text(competition!.place, style: const TextStyle(color: subtitleColor, fontSize: 18,),),
          const Text("Дата проведения:", style: TextStyle(color: Colors.black, fontSize: 20,),),
          Text(competition!.date.toLocal().toString().split(' ')[0], style: const TextStyle(color: subtitleColor, fontSize: 18,),),
          const Text("Вид соревнований:", style: TextStyle(color: Colors.black, fontSize: 20,),),
          Text(competition!.type.name, style:  const TextStyle(color: subtitleColor, fontSize: 18,),),
          const Text("Спортивные дисциплины (класс лука) :", style: TextStyle(color: Colors.black, fontSize: 20,)),
          Text("${competition!.bowTypeList.map((e) => e.bowTypeName)}", style: const TextStyle(color: subtitleColor, fontSize: 18,),),
          const Text("Категории участников:", style: TextStyle(color: Colors.black, fontSize: 20,)),
          Text("${competition!.categories.map((e) => e.name)}", style: const TextStyle(color: subtitleColor, fontSize: 18,),),
          const Text("Цена:", style: TextStyle(color: Colors.black, fontSize: 20,)),
          Text(competition!.price.toString() + " руб.", style: const TextStyle(color: subtitleColor, fontSize: 18,),),
        ],
      ),
    ),
  );
}

Widget participantList(Competition competition, List<Sportsman> sportsmen) {
  const Color subtitleColor = Color.fromARGB(255, 52, 49, 49);
  return Card(
    color: Colors.white,
    shadowColor: Colors.white70,
    shape: const RoundedRectangleBorder(
      side: BorderSide(
          color: Color.fromARGB(100, 120, 164, 255),
          width: 3
      ),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: Container(
      height: 300,
        child: CustomScrollView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      slivers: [
        SliverList(delegate: SliverChildListDelegate(
          [Column(
            children: <Widget>[
              (
                Column(
                  children: <Widget>[
                            for(Sportsman sportsman in sportsmen)
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${sportsman.surname} ${sportsman.surname} ${sportsman.birthDate.toLocal().toString().split(' ')[0]}", style: const TextStyle(color: subtitleColor, fontSize: 18,), softWrap: true, textAlign: TextAlign.center,),
                              ),
                          ]
                        )
                      )
                    ]
                  )
            ]
          ),
        )
      ]
    ))
  );
}