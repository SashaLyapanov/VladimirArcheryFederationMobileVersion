import 'package:archery_federation/aJsons/constants.dart';
import 'package:archery_federation/services/models/models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService{
  final storage = FlutterSecureStorage();

  AuthService({
    required this.dio,
  });

  final Dio dio;

  String ip = Constants.ip;


  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await dio.post(
          'http://$ip:8080/api/v1/auth/signin', data: {
        "email": email,
        "password": password
      });
      storage.write(key: "userId", value: response.data['id']);
      storage.write(key: "userEmail", value: response.data['email']);
      storage.write(key: "userRole", value: response.data['role']);
      storage.write(key: "userName", value: response.data['name']);
      storage.write(key: "userSurname", value: response.data['surname']);
      storage.write(key: "userPatronymic", value: response.data['patronymic']);
      storage.write(key: "userBirthDate", value: response.data['birthDate']);
      return User.fromJson(response.data);
    } catch (e) {
      print("Введены неверные даднные пользователя: $e");
    }
  }

  Future<int?> signUp(String name, String surname, String patronymic, String email, String password, String birthYear, String gender, String title, String region) async {
    try {
      final response = await dio.post(
        'http://$ip:8080/api/v1/auth/signup', data: {
        "firstName": name,
        "surname": surname,
        "patronymic": patronymic,
        "email": email,
        "password": password,
        "region": {
          "id": region
        },
        "sex": {
          "id": gender
        },
        "sportsTitle": {
          "id": title
        },
        "birthDate": birthYear
      });
      debugPrint(response.toString());
      return response.statusCode;
    } catch (e) {
      print("Что-то пошло не так: $e");
    }
  }

  Future<void> signOut() async {
    storage.delete(key: "userId");
    storage.delete(key: "userEmail");
    storage.delete(key: "userRole");
    storage.delete(key: "userName");
    storage.delete(key: "userSurname");
    storage.delete(key: "userPatronymic");
    storage.delete(key: "userBirthDate");
  }
}