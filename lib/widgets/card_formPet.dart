import 'package:flutter/material.dart';
import 'petModel.dart';
import 'petController.dart';

class PetRegister extends StatelessWidget {
  PetRegister({super.key});

  // Controladores de texto para capturar os dados
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final PetController _petController = PetController();

  void _registerPet(BuildContext context) async {
    
    // Cria um objeto PetModel com os dados do formulário
    final pet = PetModel(
      name: _nameController.text,
      description: _descriptionController.text,
      image: _imageController.text,
    );

    // Valida os campos
    final validationError = _petController.validateFields(pet);
    if (validationError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationError)),
      );
      return;
    }

    // Envia o pet para o servidor
    bool success = await _petController.registerPet(pet);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pet registrado com sucesso!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao registrar o pet.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter the name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter the description',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter the image URL',
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _registerPet(context),
            child: const Text('Register Pet'),
          ),
        ],
      ),
    );
  }
}
