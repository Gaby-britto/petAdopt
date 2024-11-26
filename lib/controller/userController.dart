import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'userModel.dart';

class UserController {
  final String baseUrl = 'https://pet-adopt-dq32j.ondigitalocean.app';

  // Método para registrar um usuário
  Future<bool> registerUser(UserModel user) async {
    final String url = '$baseUrl/register';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        // Sucesso no registro
        print('Usuário registrado com sucesso!');
        return true;
      } else {
        // Tratamento de erro
        print('Erro no registro: ${response.statusCode}');
        print('Resposta: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Erro na chamada à API: $e');
      return false;
    }
  }

  // Método para validar os campos do formulário
  String? validateFields(UserModel user) {
    if (user.name.isEmpty) {
      return 'O nome é obrigatório.';
    }
    if (user.email.isEmpty || !user.email.contains('@')) {
      return 'E-mail inválido.';
    }
    if (user.password.isEmpty || user.password.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }
    return null;
  }
}
