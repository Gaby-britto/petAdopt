import 'package:flutter/material.dart';

class card_animals extends StatelessWidget {
   final String name;
   final String age;
   final String km; 
   final String imagePath;

  const card_animals({
     Key? key,
    required this.name,
    required this.age,
    required this.km,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        ClipRRect(
          borderRadius: BorderRadius.circular(
              20), 
          child: Image.asset(
            imagePath,
            height: 200,
            width: 160,
            fit: BoxFit.cover,
          ),
        ),
        Text(name,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
        Row(
          children: [
            Text(age),
            SizedBox(width: 5),
            Text(km)
          ],
        )
      ],
    );
  }
}
