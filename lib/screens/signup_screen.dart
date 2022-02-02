import 'package:flutter/material.dart';
import 'package:touchofbeauty_flutter/http/httpuser.dart';
import 'package:touchofbeauty_flutter/models/user.dart';
import 'package:touchofbeauty_flutter/screens/login_screen.dart';
import 'package:motion_toast/motion_toast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  String username = " ";
  String email = " ";
  String phone = " ";
  String password = " ";

  Future<bool> registerUser(User u) {
    var res = HttpConnectUser().registerPost(u);
    return res;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: Color(0xffF5591F),
                  gradient: LinearGradient(
                    colors: [(new Color(0xffF5591F)), (new Color(0xffF2861E))],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  )),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: const CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.yellowAccent,
                        backgroundImage:
                            AssetImage('assets/touchofbeautylogo1.jpg'),
                      ),
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 20),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        'Signup',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 5), blurRadius: 10)
                        ]),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        username = value!;
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person, color: Color(0xffF5591F)),
                          hintText: 'Username',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 5), blurRadius: 10)
                        ]),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email, color: Color(0xffF5591F)),
                          hintText: 'Enter email',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 5), blurRadius: 10)
                        ]),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        phone = value!;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.phone, color: Color(0xffF5591F)),
                          hintText: 'Phone Number',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 5), blurRadius: 10)
                        ]),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.vpn_key, color: Color(0xffF5591F)),
                          hintText: 'Enter password',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        User u = User(
                          username: username,
                          email: email,
                          phone: phone,
                          password: password,
                        );

                        bool isCreated = await registerUser(u);
                        if (isCreated) {
                          Navigator.pushNamed(context, '/login');
                          MotionToast.success(
                                  description: Text('New user created'))
                              .show(context);
                        } else {
                          MotionToast.error(
                                  description: Text('Failed to register'))
                              .show(context);
                        }
                      }
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 26),
                      alignment: Alignment.center,
                      height: 54,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              (new Color(0xffF5591F)),
                              (new Color(0xffF2861E))
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 40,
                                color: Color(0xffEEEEEE))
                          ]),
                      child: const Text(
                        "SIGNUP",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already Have an Account?"),
                        const SizedBox(width: 5),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Color(0xffF5591F)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
