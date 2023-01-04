import 'package:flutter/material.dart';
import 'package:origin/dashboard.dart';
import 'signupscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();

  bool _isObscure= false;

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Form(
      key: formkey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: Colors.amber,
                    gradient: LinearGradient(
                        colors: [
                          (new Color(0xFFFFB300)),
                          (new Color(0xFFFFB300))
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset("assets/splash.png"),
                        height: 90,
                        width: 90,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                    cursorColor: Color(0xFFFFB300),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email_rounded,
                        color: Color(0xFFFFB300),
                      ),
                      labelText: "Enter Email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                              .hasMatch(value!)) {
                        return "Enter Valid email-id";
                      } else {
                        return null;
                      }
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: TextFormField(
                      obscureText: _isObscure,
                      cursorColor: Color(0xFFFFB300),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xFFFFB300),
                          ),

                            suffixIcon: IconButton(

                                focusColor: Color(0xFFFFB300),
                              
                            icon: Icon(_isObscure ? Icons.visibility :Icons.visibility_off),
                            color: Colors.amber,
                            onPressed: () {
                            setState(() { //refresh UI
                            if(_isObscure){ //if passenable == true, make it false
                            _isObscure = false;
                            }else{
                            _isObscure = true; //if passenable == false, make it true
                            }
                            });

                        }

                      )
            ),
                validator: (value) {
                RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                if (value!.isEmpty) {
                return 'Please enter password';
                } else {
                if (!regex.hasMatch(value)) {
                return 'Enter valid password';
                } else {
                return null;
                }
                }}
                )
                ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 20),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Text("Forgot Password?"),
                  onTap: () => {},
                ),
              ),
              GestureDetector(
                onTap: () => {
                  if (formkey.currentState!.validate())
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()))
                    }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          (new Color(0xFFFFB300)),
                          (new Color(0xFFFFB300))
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 15),
                            blurRadius: 50,
                            color: Color(0xFFFFB300))
                      ]),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?"),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()))
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(color: Color(0xFF000000)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}