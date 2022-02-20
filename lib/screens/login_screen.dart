import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:touchofbeauty_flutter/http/httpuser.dart';
import 'package:touchofbeauty_flutter/screens/dashboard.dart';
import 'package:touchofbeauty_flutter/screens/homepage.dart';
import 'package:touchofbeauty_flutter/screens/homepage2.dart';
import 'package:touchofbeauty_flutter/screens/signup_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:touchofbeauty_flutter/services/login_services.dart';
import 'package:touchofbeauty_flutter/utils/shared_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String username = " ";
  String password = " ";

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
                        'Login',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 60),
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 5), blurRadius: 10)
                        ]),
                    child: TextFormField(
                      onSaved: (value) {
                        username = value!;
                      },
                      validator: RequiredValidator(errorText: "Text required"),
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email, color: Color(0xffF5591F)),
                          hintText: 'Enter username',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 5), blurRadius: 10)
                        ]),
                    child: TextFormField(
                      obscureText: true,
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: MinLengthValidator(6,
                          errorText: "should be atleast 6 character"),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.vpn_key, color: Color(0xffF5591F)),
                          hintText: 'Enter password',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      _formkey.currentState!.save();
                      var res = await loginPost(username, password);
                      if (res) {
                        // print(res);

                        Navigator.pushNamed(context, '/dashboard');
                        MotionToast.success(
                                description: Text('Login Successful'))
                            .show(context);
                      } else {
                        MotionToast.error(
                                description: Text('Login Unsuccessfull'))
                            .show(context);
                      }
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 70),
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
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't Have an Account?"),
                        const SizedBox(width: 5),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: const Text(
                              'Register Now',
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
