import 'package:flutter/material.dart';
import 'package:moving_arts/pages/moving_blob_field/moving_blob_page.dart';

// import 'pages/moving_particle/moving_particles_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moving Art',
      theme: ThemeData.dark(),
      home: const MovingBlobPage(),
    );
  }
}
