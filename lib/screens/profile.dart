import 'dart:io';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  var udata;

  Profile({Key? key, this.udata}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? phone;
  File? _image;

  @override
  void initState() {
    super.initState();
  }

  void listenData()  {
    var internData =  widget.udata;
    username = internData['username'];
    email = internData['email'];
    phone = internData['phone'].toString();
    _image = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    listenData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xFFde8735),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image == null
                          ? const AssetImage('assets/profile.png')
                              as ImageProvider
                          : FileImage(_image!),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: const Text('Choose profile picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.underline))),
                const SizedBox(height: 50),
                TextFormField(
                  initialValue: username,
                  maxLength: 20,
                  decoration: const InputDecoration(
                      labelText: 'Username', border: OutlineInputBorder()),
                ),
                TextFormField(
                  initialValue: email,
                  decoration: const InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: phone,
                  decoration: const InputDecoration(
                      labelText: 'Phone', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: const Color(0xFFde8735),
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '');
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: const Color(0xFFde8735),
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/logout');
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
