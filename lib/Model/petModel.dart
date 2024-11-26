class PetModel {
  String name;
  String description;
  String image;

  PetModel({
    required this.name,
    required this.description,
    required this.image,
  });

  // Método para converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': description,
      'password': image,
    };
  }

}
