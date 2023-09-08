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
      home: const AssignmentFive(),
    );
  }
}

class AssignmentFive extends StatelessWidget {
  const AssignmentFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 70,
        toolbarHeight: 70,
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.add_business_sharp,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const SizedBox(
          height: 100,
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This is mod 5 Assignment",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "My ",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 19,
                    ),
                  ),
                  Text("phone ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 10,
                      )),
                  Text("name ",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 12,
                      )),
                  Text("I dont have any",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 19,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
