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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List text = ['xl', 'L', 'Xm', "x", "s"];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemCount: text.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(8),
                height: 20,
                width: 40,
                decoration: BoxDecoration(
                  color: index == selected ? Colors.yellow : Colors.red,
                ),
                child: Center(
                    child: Text(
                  text[index],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
