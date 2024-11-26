import 'dart:convert';
import 'package:http/http.dart' as http;
import 'petModel.dart';

class PetController {
  final String baseUrl = 'https://pet-adopt-dq32j.ondigitalocean.app';

  // Método para registrar um pet
  Future<bool> registerPet(PetModel pet) async {
    final String url = '$baseUrl/pets';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(pet.toJson()),
      );

      if (response.statusCode == 201) {
        print('Pet registrado com sucesso!');
        return true;
      } else {
        print('Erro ao registrar pet: ${response.statusCode}');
        print('Resposta: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Erro na chamada à API: $e');
      return false;
    }
  }

  // Método para validar os campos do modelo
  String? validateFields(PetModel pet) {
    if (pet.name.isEmpty) {
      return 'O nome do pet é obrigatório.';
    }
    if (pet.description.isEmpty) {
      return 'A descrição do pet é obrigatória.';
    }
    if (pet.image.isEmpty) {
      return 'A URL da imagem do pet é obrigatória.';
    }
    return null;
  }
}
