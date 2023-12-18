import 'dart:io';

import 'package:archery_federation/services/article_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../news/view/news.dart';
import '../../drawer/view/drawer.dart';
import '../../news/view/news.dart';
import '../widgets/widgetsForCreate.dart';

class AdminNewCreate extends StatefulWidget {
  const AdminNewCreate({super.key});

  @override
  State<AdminNewCreate> createState() => _AdminNewCreateState();
}

class _AdminNewCreateState extends State<AdminNewCreate> {
  int? response;
  XFile? imageFile;


  Future<void> _loadItemsList() async {

    setState(() {});
  }

  // void setImageFileListFromFile(XFile? value) {
  //   value == null? null : imageFiles?.add(value);
  // }
  void setImageFileListFromFile(XFile? value) {
   imageFile = value == null ? null : value;
  }

  @override
  void initState() {
    _loadDataLists();
    super.initState();
  }

  Future<void> _loadDataLists() async {

    _loadItemsList();
    setState(() {});
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  late String name;
  late String body;

  _AdminNewCreateState();

  @override
  Widget build(BuildContext context) {


    _getFromGallery() async {
      ImagePicker picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          setImageFileListFromFile(pickedFile);
        });
      }
    }

    Widget _formNewCreate(String label, void func()) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Заголовок", _nameController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: input(const Icon(Icons.person), "Тело новости", _bodyController, false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: () {
                // imageFiles;
                _getFromGallery();
              },
              child: const Text("PICK IMAGE FROM GALLERY"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: imageFile != null ?
              Image.file(File(imageFile!.path))
                  : const Text('No image selected'),
            )
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,),
            child:  SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: button(label, func)
              ),
            ),
          )
        ],
      );
    }

    void _createCompetition() async {
      name = _nameController.text;
      body = _bodyController.text;


      response = await ArticleService(dio: Dio()).createArticle(name, body, imageFile!);
      setState(() {});
      if (response != null && response == 200) {
        setState(() {});
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAdminPage()));
      } else {
        //Добавить обработчик события в результате получения statusCode != 200
        //можно просто выводить диалоговое окно с предупреждением о том, что пришло в response.message
      }
    }

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
            },
          ),
          title: const Center(child: Text("Новый пост", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
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
                            Column(
                              children: <Widget>[
                                logoForRegistrationToCompetition(),
                                _formNewCreate('Создать', _createCompetition),
                              ],
                            )
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
