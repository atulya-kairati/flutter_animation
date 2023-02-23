import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

const defaultImageWidth = 100.0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isZoomed = false;
  var _buttonText = "Zoom In";
  var _imageWidth = defaultImageWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          AnimatedContainer(
            duration: const Duration(milliseconds: 370),
            curve: _curve,
            width: _imageWidth,
            child: Image.asset(
              'assets/images/hehe.png',
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isZoomed = !_isZoomed;
                _buttonText = _isZoomed ? "Zoom Out" : "Zoom In";
                _imageWidth = _isZoomed
                    ? MediaQuery.of(context).size.width
                    : defaultImageWidth;
                _curve = _isZoomed ? Curves.bounceInOut : Curves.bounceOut;
              });
            },
            child: Text(_buttonText),
          ),
        ],
      ),
    );
  }
}
