import 'package:flutter/material.dart';
import 'people.dart';

class DetailsPage extends StatelessWidget {
  final People people;
  const DetailsPage({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details"),),
      body: Center(
       child: Column(children: [
          Image.asset(people.getImg),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name: ${people.getName}",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Age: ${people.getAge.toString()}",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Image.asset(getCountryImg(people.getCountry,),
                    height: 50,
                  ),
                ),
                Text(people.getCountry,
                  style: const TextStyle(
                      fontSize: 30,
                    ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Text("Bio: ${people.getDesc}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],)
      ),
    );
  }
}

String getCountryImg(String country) {
  return ("assets/photos/countries/$country.png");
}