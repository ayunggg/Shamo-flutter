// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:shamo_flutter/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final baseUrl = Uri.parse('https://shamo-backend.buildwithangga.id/api');

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw ('Email Atau Password Salah');
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String name,
    required String password,
    required String username,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'username': username,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      if (email == user.email) {
        throw ('Email Telah Di Gunakan');
      } else if (username == user.username) {
        throw ('User Name Telah Digunakan');
      } else {
        throw ('Gagal Register');
      }
    }
  }
}
