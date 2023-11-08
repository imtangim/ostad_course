import 'package:flutter/material.dart';

class PhotoDetail extends StatefulWidget {
  final String url;
  final String title;
  final int id;
  const PhotoDetail(
      {super.key, required this.url, required this.title, required this.id});

  @override
  State<PhotoDetail> createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Photo Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(widget.url),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Title: ${widget.title}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "ID: ${widget.id.toString()}",
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
