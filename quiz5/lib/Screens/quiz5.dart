import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              color: Colors.green,
              size: 50,
            ),
            Text(
              "Jhon Doe",
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Flutter Batch 4",
              style: TextStyle(
                fontSize: 17,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
