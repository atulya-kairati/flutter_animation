import 'package:flutter/material.dart';
import 'package:flutter_animation_practice_4/person.dart';

import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  final people = const [
    Person(name: "Manus Chaubey", age: 24, emoji: "🤑"),
    Person(name: "Zhon Xi Na", age: 45, emoji: "🍧"),
    Person(name: "Edmund Blackadder", age: 32, emoji: "🐍"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("People")),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(person: person),
                  ),
                );
              },
              leading: Hero(
                tag: person.emoji,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    person.emoji,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ),
              title: Text(
                person.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(Icons.chevron_right_outlined),
            ),
          );
        },
      ),
    );
  }
}
