import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_11/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Info> mainData = [];
  Future<void> getData() async {
    final response = await http
        .get(Uri.parse("https://imtangim.github.io/apis/randomapi1.json"));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      List<dynamic> dataList = data
          .map(
            (e) => Info(
                city: e["city"],
                temperature: e["temperature"].toString(),
                condition: e["condition"].toString(),
                humidity: e["humidity"].toString(),
                windSpeed: e["windSpeed"].toString()),
          )
          .toList();
      setState(() {
        mainData = List<Info>.from(dataList);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Info"),
        actions: [
          IconButton(
            onPressed: () {
              print(mainData);
            },
            icon: const Icon(Icons.help),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: mainData.length,
          itemBuilder: (context, index) {
            final data = mainData[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "City: ${data.city} ",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Temperature: ${data.temperature}°C ",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Condition: ${data.condition} ",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Humidity: ${data.humidity}% ",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Wind Speed: ${data.windSpeed} m/s ",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
