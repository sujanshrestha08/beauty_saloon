import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage: Image.network('').image,
                  radius: 60,
                ),
              ), const SizedBox(height: 10),
              Text('Riya Ranjit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              Text('riyaranjit00@gmail.com', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              Text('98573465743', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
    );
  }
}
