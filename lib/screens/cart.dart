import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.card_travel))],
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {},
        child: Text("Book"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [],
      ),
    );
  }
}
