import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool click = false;

  final TextEditingController name1 = TextEditingController();
  final TextEditingController age1 = TextEditingController();


  void clickButton(){
    setState(() {
      click = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenW/2,
            child: TextField(
              controller: name1,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                border: OutlineInputBorder(),
                labelText: 'enter name',
                hintText: 'abbas',
              ),
          ),),
          ElevatedButton(
            child: Text('Button'),
            onPressed: () {

              // Person person = Person(name: 'Abbas', age: 24);
              // print(person.name);
              Person(name: name1.text, age: 16);
              print(name1.text);
              print(click);
              clickButton();
            },
          ),
          click == true ? Text('${name1.text}') : Container(),
        ],
      ),
    );
  }
}


class Person extends StatelessWidget{

  late final int age;
  late final String name;

  Person({required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }



}

