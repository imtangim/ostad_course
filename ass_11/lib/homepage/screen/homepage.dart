import 'dart:convert';

import 'package:ass_11/homepage/model/model.dart';
import 'package:ass_11/homepage/screen/photodetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<APIModel> mainData = [];

  Future<void> getURLdata() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      List<dynamic> dataList = data
          .map(
            (e) => APIModel(
                albumid: e["albumId"],
                id: e["id"],
                url: e["url"],
                thumbnailUrl: e["thumbnailUrl"],
                title: e["title"]),
          )
          .toList();

      setState(() {
        mainData = List<APIModel>.from(dataList);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getURLdata();
  }

  Widget container(String url) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(url),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Gallert App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: mainData.length,
        itemBuilder: (context, index) {
          final data = mainData[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetail(
                      id: data.id, title: data.title, url: data.url),
                ),
              );
            },
            leading: container(data.thumbnailUrl),
            title: Text(data.title),
          );
        },
      ),
    );
  }
}
