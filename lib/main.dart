import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'people.dart';
import 'details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MobileTeam(),
    );
  }
}

class MobileTeam extends StatelessWidget {
  const MobileTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Team'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  color: Colors.blueGrey,
                  height: 100,
                  child: const Center(
                    child: Text("Meet the Mobile Team",
                      style: TextStyle(fontSize: 30,

                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return imageAsset(index, context);
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

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/team_info.json');
}

Widget imageAsset(int index, BuildContext context) {
  List<String> imageList = [
    'assets/photos/people/ahrar.png',
    'assets/photos/people/hamed.png',
    'assets/photos/people/horam.png',
    'assets/photos/people/osama.png',
    'assets/photos/people/ramin.png',
    'assets/photos/people/weng.png',
    'assets/photos/people/zohreh.png',
  ];

  if (index != imageList.length-1) {
    if (index % 2 == 0) {
      return Row(
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                loadAsset().then((value) {
                  Map map = json.decode(value);
                  People mentors = People(name: map['team_info'][index]['name'], 
                  age: map['team_info'][index]['age'], 
                  country: map['team_info'][index]['country'], 
                  desc: map['team_info'][index]['description'],
                  img: imageList[index],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(people: mentors)),
                  );
                });
              },
              child: Card(
                child: Image.asset(imageList[index],
                height: 200,
                width: 200,
                ),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {
                loadAsset().then((value) {
                  Map map = json.decode(value);
                  // print(map['team_info'][index]['name']);
                  People mentors = People(name: map['team_info'][index+1]['name'], 
                  age: map['team_info'][index+1]['age'], 
                  country: map['team_info'][index+1]['country'], 
                  desc: map['team_info'][index+1]['description'],
                  img: imageList[index+1],
                  );
            
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(people: mentors)),
                  );
                });
              },
              child: Card(
                child: Image.asset(imageList[index+1],
                height: 200,
                width: 200,
                ),
              ),
            ),
          )
        ],
      );
    }
    else {
      return Container();
    }
  }
  else {
    return Row(
    children: [
      Flexible(
        child: InkWell(
          onTap: () {
            loadAsset().then((value) {
              Map map = json.decode(value);
              // print(map['team_info'][index]['name']);
              People mentors = People(name: map['team_info'][index]['name'], 
              age: map['team_info'][index]['age'], 
              country: map['team_info'][index]['country'], 
              desc: map['team_info'][index]['description'],
              img: imageList[index],
              );

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(people: mentors)),
              );
            });
          },
          child: Card(
            child: Image.asset(imageList[index],
            height: 200,
            width: 200,
            ),
          ),
        ),
      ),
      Flexible(child: Container(
        color: Colors.white,
        )
      ),
    ],
  );
  }
}