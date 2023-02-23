import 'package:flutter/material.dart';
import 'package:flutter_animation_practice_4/person.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.fastOutSlowIn)),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: toHeroContext.widget,
                  ),
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: fromHeroContext.widget,
                );
            }
          },
          tag: person.emoji,
          child: Text(
            person.emoji,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 24,
          ),
          Text(person.name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text('Is ${person.age} years old',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
