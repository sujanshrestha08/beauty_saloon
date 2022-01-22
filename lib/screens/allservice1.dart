import 'package:flutter/material.dart';

class Services extends StatefulWidget {

  final String title;
  final List<String> datas;

  const Services({required this.datas, required this.title});

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
             
              children: [
                 Text('${widget.title}'),
                ...widget.datas.map((servicedata) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          title: Text(
                            servicedata,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
