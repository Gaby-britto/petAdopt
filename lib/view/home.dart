import 'package:flutter/material.dart';
import 'package:pet_adopt/view/information.dart';
import 'package:pet_adopt/widgets/card_animals.dart';
import 'package:pet_adopt/widgets/card_donate.dart';
import 'package:pet_adopt/widgets/card_option.dart';
import 'package:pet_adopt/widgets/header.dart';
import 'package:pet_adopt/widgets/search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> animals = [
      {
        'name': 'Bello',
        'age': '9 Months old |',
        'km': '1 km away',
        'imagePath': 'assets/images/gato_persa.png',
      },
      {
        'name': 'Lara',
        'age': '3 Months old |',
        'km': '2 km away',
        'imagePath': 'assets/images/card_furao.png',
      },
      {
        'name': 'Max',
        'age': '5 Months old |',
        'km': '50 m away',
        'imagePath': 'assets/images/card_dog.png',
      },
      {
        'name': 'Kitty',
        'age': '8 Months old |',
        'km': '3 km away',
        'imagePath': 'assets/images/card_cat.png',
      },
    ];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Search(),
              card_donate(),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Categories',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CardOption( text: 'Dogs', imagePath: 'assets/images/dog_card.jpg'),
                  SizedBox(width: 10),
                  CardOption(text: 'Cats', imagePath: 'assets/images/cat_card.jpg'),
                  SizedBox(width: 10),
                  CardOption(text: 'Ferrets', imagePath: 'assets/images/furao_card.jpg'),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: animals.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InformationPage(),
                          ),
                        );
                      },
                      child: card_animals(
                        name: animals[index]['name']!,
                        age: animals[index]['age']!,
                        km: animals[index]['km']!,
                        imagePath: animals[index]['imagePath']!,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



