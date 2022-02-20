import 'dart:async';
import 'dart:io';
import 'package:motion_toast/motion_toast.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:touchofbeauty_flutter/services/updateprofile.dart';
import 'package:touchofbeauty_flutter/utils/config.dart';

class Profile extends StatefulWidget {
  var udata;

  Profile({Key? key, this.udata}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<double>? _accelerometerValues;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;
  String? phone;
  String? address;
  File? _image;

  TextEditingController editusername = TextEditingController();
  TextEditingController editemail = TextEditingController();
  TextEditingController editpassword = TextEditingController();
  TextEditingController editphone = TextEditingController();
  TextEditingController editaddress = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _streamSubscriptions.add(
    //   accelerometerEvents.listen(
    //     (AccelerometerEvent event) {
    //       setState(() {
    //         _accelerometerValues = <double>[event.x, event.y, event.z];
    //         print(_accelerometerValues);
    //         if (event.x > 0 && event.y > 9) {
    //           MotionToast.info(
    //             description: const Text('ohh.. x-axis is greater than 0'),
    //           );
    //         }
    //       });
    //     },
    //   ),
    // );
  }

  void listenData() {
    var internData = widget.udata;
    username = internData['username'];
    email = internData['email'];
    phone = internData['phone'].toString();
    address = internData['address'];
    password = internData['password'];
    _image = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    listenData();
  }

  @override
  Widget build(BuildContext context) {
    final accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
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
                // Stack(
                //   children: [
                //     CircleAvatar(
                //       radius: 50,
                //       backgroundImage: _image == null
                //           ? const AssetImage('assets/profile.png')
                //               as ImageProvider
                //           : FileImage(_image!),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 10),
                image != null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundColor: const Color(0xFFde8735),
                        child: ClipOval(
                          child: Image.file(
                            image!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),

                SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: const Text('Choose profile picture',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.underline))),
                const SizedBox(height: 50),
                TextFormField(
                  // initialValue: username,
                  maxLength: 20,
                  controller: editusername,
                  decoration: InputDecoration(
                      hintText: username,
                      labelText: 'Username',
                      border: const OutlineInputBorder()),
                ),
                TextFormField(
                  // initialValue: email,
                  controller: editemail,
                  decoration: InputDecoration(
                      hintText: email,
                      labelText: 'Email',
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  // initialValue: phone,
                  validator: (value) {
                    if (value == null) {
                      return "Password Field is Empty";
                    }
                  },

                  controller: editpassword,
                  decoration: InputDecoration(
                      hintText: password,
                      labelText: 'Password',
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  // initialValue: phone,

                  controller: editphone,
                  decoration: InputDecoration(
                      hintText: phone,
                      labelText: 'Phone',
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  // initialValue: phone,

                  controller: editaddress,
                  decoration: InputDecoration(
                      hintText: address,
                      labelText: 'Address',
                      border: const OutlineInputBorder()),
                ),
                // TextFormField(
                //   // initialValue: phone,

                //   controller: editaddress,
                //   decoration: InputDecoration(
                //       hintText: address,
                //       labelText: 'Address',
                //       border: const OutlineInputBorder()),
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Accelerometer: $accelerometer'),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: const Color(0xFFde8735),
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () async {
                        // uploadImage();
                        await uploadImage(image, URL.profile);
                        postProfile(
                          context,
                          editusername.text,
                          editemail.text,
                          editpassword.text,
                          editphone.text,
                          editaddress.text,
                        ).then((value) => {
                              if (value.success = true)
                                {
                                  MotionToast.success(
                                          description:
                                              const Text('Update Successful'))
                                      .show(context)
                                }
                            });
                        // Navigator.pushNamed(context, '');
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

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }
}

Future uploadImage(image, file) async {
  var request = http.MultipartRequest("POST", Uri.parse(URL.profile));
  // request.headers['Content-Type'] = "multipart/form-data";
  request.files.add(await http.MultipartFile.fromPath('image', file));
  var res = await request.send();
  if (res.statusCode == 200) {
    return print("good job\n\n\n\n\n\n job");
  } else {
    print("Error\n\n\n\n\n\nError");
  }
  print(res);
  return res;
}
