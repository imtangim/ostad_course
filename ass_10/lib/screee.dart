import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> holder = [];
  TextEditingController title = TextEditingController();
  TextEditingController retitle = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController redescription = TextEditingController();

  void _showBottomSheet(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey.withOpacity(0.3),
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 250,
            child: Column(
              children: [
                TextField(
                  controller: title,
                  decoration: const InputDecoration(
                    hintText: "Add Title",
                    focusColor: Colors.lightBlue,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: description,
                  decoration: const InputDecoration(
                    hintText: "Add Description",
                    focusColor: Colors.red,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      String titleD = title.text;
                      String descriptionD = description.text;

                      Map<String, dynamic> data = {
                        "title": titleD,
                        "description": descriptionD
                      };
                      holder.add(data);
                      title.clear();
                      description.clear();
                    });
                  },
                  child: const Text("Add"),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                holder.length,
                (index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.2)),
                  child: ListTile(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          contentTextStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          content: const Text("Alert"),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 300,
                                      width: double.maxFinite,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            TextField(
                                              controller: retitle,
                                              decoration: const InputDecoration(
                                                hintText: "Add Title",
                                                focusColor: Colors.lightBlue,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              controller: redescription,
                                              decoration: const InputDecoration(
                                                hintText: "Add Description",
                                                focusColor: Colors.red,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  holder[index]["title"] =
                                                      retitle.text;
                                                  holder[index]["description"] =
                                                      redescription.text;
                                                });
                                                retitle.clear();
                                                redescription.clear();
                                              },
                                              child: const Text("Edit Done"),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text("Edit"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();

                                setState(() {
                                  holder.removeAt(index);
                                });
                              },
                              child: const Text("Delete"),
                            )
                          ],
                        ),
                      );
                    },
                    leading: const RedDot(),
                    title: Text(holder[index]["title"]),
                    subtitle: Text(holder[index]["description"]),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RedDot extends StatelessWidget {
  const RedDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
