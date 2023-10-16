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
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
  ];

  // List<bool> isSelected = List.generate(5, (index) => false);

  void _toggleSelection(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  int _getSelectedCount() {
    return isSelected.where((selected) => selected == true).length;
  }

  void _showSelectedItemsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int count = _getSelectedCount();
        return AlertDialog(
          title: Text('Selected Items'),
          content: Text('You have selected $count items.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable List Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            tileColor: isSelected[index] ? Colors.blue : null,
            onTap: () {
              _toggleSelection(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSelectedItemsDialog(context);
        },
        child: Icon(Icons.info),
      ),
    );
  }
}
