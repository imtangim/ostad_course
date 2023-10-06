import 'package:ass_9/utils.dart';
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
  int total = 0;
  int tempprice = 0;
  // int totalamount = 0;

  Map cart = {
    "Prd1": {"total": 1, "total_amount": 51, "price": 51},
    "Prd2": {"total": 1, "total_amount": 30, "price": 30},
    "Prd3": {"total": 1, "total_amount": 43, "price": 43},
  };
  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! Your order has been checked out.'),
        duration: Duration(seconds: 3), // Snackbar duration
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(size: 30),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Bag",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 130,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2prKrJTYlcg3fCwvmnv2yPvUFd0PGCUEt9w&usqp=CAU"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pullover",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Color: ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "Black",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Size: ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "L",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_vert_rounded,
                                    size: 26,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            elevation: 3,
                                            shadowColor: Colors.black,
                                            shape: const CircleBorder(),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              cart["Prd1"]["total"] == 1
                                                  ? cart["Prd1"]["total"] = 1
                                                  : cart["Prd1"]["total"]--;

                                              cart["Prd1"]["total_amount"] =
                                                  cart["Prd1"]["price"] *
                                                      cart["Prd1"]["total"];
                                            });
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                        Text(
                                          cart["Prd1"]["total"].toString(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            elevation: 3,
                                            shadowColor: Colors.black,
                                            shape: const CircleBorder(),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.grey,
                                          ),
                                          onPressed: () {
                                            // print(total);
                                            setState(() {
                                              cart["Prd1"]["total"]++;
                                              cart["Prd1"]["total_amount"] =
                                                  cart["Prd1"]["price"] *
                                                      cart["Prd1"]["total"];
                                            });
                                            print(cart["Prd1"]["total_amount"]);
                                            // print(totalamount);
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${cart["Prd1"]["total_amount"]}\$",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 130,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            // padding: EdgeInsets.only(top: 20.0),
                            child: Image(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1618517351616-38fb9c5210c6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHQlMjBzaGlydHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "T-Shirt",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Color: ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "Gray",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Size: ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "L",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_vert_rounded,
                                    size: 26,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            elevation: 3,
                                            shadowColor: Colors.black,
                                            shape: const CircleBorder(),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              cart["Prd2"]["total"] == 1
                                                  ? cart["Prd2"]["total"] = 1
                                                  : cart["Prd2"]["total"]--;

                                              cart["Prd2"]["total_amount"] =
                                                  cart["Prd2"]["price"] *
                                                      cart["Prd2"]["total"];
                                            });
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                        Text(
                                          cart["Prd2"]["total"].toString(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            elevation: 3,
                                            shadowColor: Colors.black,
                                            shape: const CircleBorder(),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.grey,
                                          ),
                                          onPressed: () {
                                            // print(total);
                                            setState(() {
                                              cart["Prd2"]["total"]++;
                                              cart["Prd2"]["total_amount"] =
                                                  cart["Prd2"]["price"] *
                                                      cart["Prd2"]["total"];
                                            });
                                            print(cart["Prd2"]["total_amount"]);
                                            // print(totalamount);
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${cart["Prd2"]["total_amount"]}\$",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 130,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Image(
                              image: NetworkImage(
                                  "https://i.pinimg.com/736x/d2/4c/5e/d24c5e0f987da86b1cef8c69161b3d71.jpg"),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sport Dress",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Color: ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "Black",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Size: ",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "M",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_vert_rounded,
                                    size: 26,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            elevation: 3,
                                            shadowColor: Colors.black,
                                            shape: const CircleBorder(),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              cart["Prd3"]["total"] == 1
                                                  ? cart["Prd3"]["total"] = 1
                                                  : cart["Prd3"]["total"]--;

                                              cart["Prd3"]["total_amount"] =
                                                  cart["Prd3"]["price"] *
                                                      cart["Prd3"]["total"];
                                            });
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                        Text(
                                          cart["Prd3"]["total"].toString(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            elevation: 3,
                                            shadowColor: Colors.black,
                                            shape: const CircleBorder(),
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.grey,
                                          ),
                                          onPressed: () {
                                            // print(total);
                                            setState(() {
                                              cart["Prd3"]["total"]++;
                                              cart["Prd3"]["total_amount"] =
                                                  cart["Prd3"]["price"] *
                                                      cart["Prd3"]["total"];
                                            });
                                            print(cart["Prd3"]["total_amount"]);
                                            // print(totalamount);
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${cart["Prd3"]["total_amount"]}\$",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  "Total amount: ",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const Spacer(),
                Text(
                  "${cart["Prd1"]["total_amount"] + cart["Prd2"]["total_amount"] + cart["Prd3"]["total_amount"]}\$",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(360, 50),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                _showSnackbar(context);
              },
              child: Text("CHECK OUT"),
            )
          ],
        ),
      ),
    );
  }
}
