import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  List url = [];

  Future<void> fetchimage() async {
    try {
      final response = await http
          .get(Uri.parse('https://picsum.photos/v2/list?page=1&limit=6'));
      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> apiData = json.decode(response.body);
        url.clear();
        for (var i = 0; i < apiData.length; i++) {
          if (kDebugMode) {
            if (kDebugMode) {}
            print(apiData[i]["download_url"]);
          }
          url.add(apiData[i]["download_url"]);
        }
      } else {
        if (kDebugMode) {
          print("Request failed with status: ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  @override
  void initState() {
    // setState(() {
    //   fetchimage();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Photo Gallery"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchimage(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome to my photo gallery",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Search for photos..",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: url.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.height * 0.7,
                          child: Column(
                            children: [
                              Image(
                                // height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                  url[index],
                                ),
                              ),
                              Text(
                                "Photo $index",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            url[index],
                          ),
                        ),
                        title: Text("Photo $index"),
                        subtitle: Text("Description for Photo $index"),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
