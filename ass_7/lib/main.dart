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
  Map cart = {};
  int _counter = 0;
  @override
  void initState() {
    for (var i = 0; i < 30; i++) {
      cart["Product ${i + 1}"] = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                title: Text("Product ${index + 1}"),
                subtitle: const Text("\$20.00"),
                trailing: Column(
                  children: [
                    Text(
                      "Counter: ${cart["Product ${index + 1}"]}",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            cart["Product ${index + 1}"] += 1;
                          });
                          print(cart);
                          cart["Product ${index + 1}"] == 5
                              ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.white,
                                      title: const Text(
                                        "Congratulation!",
                                      ),
                                      content: Text(
                                        "You've bought 5 Product ${index + 1}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      actionsPadding: const EdgeInsets.all(0),
                                      actionsAlignment: MainAxisAlignment.end,
                                      actions: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Ok",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              : "";
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size(100, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size.fromRadius(28),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MyWidget(counter: cart);
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final Map counter;
  const MyWidget({super.key, required this.counter});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  num _sum = 0;

  @override
  void initState() {
    for (var value in widget.counter.values) {
      _sum += value;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          "Total Product: ${_sum}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
