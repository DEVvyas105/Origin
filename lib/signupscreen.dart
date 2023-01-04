import 'package:flutter/material.dart';
import 'package:origin/loginScreen.dart';
import 'package:origin/signupscreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();


}
class InitState extends State<SignUpScreen>{

  final formkey = GlobalKey<FormState>();

  final TextEditingController pass = TextEditingController();
  final TextEditingController cnfpass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget(){
  return Form(
    key: formkey,
    child: Scaffold
      (
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                gradient: LinearGradient(
                  colors: [(new Color(0xFFFFB300)), (new Color(0xFFFFB300))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
            ),
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
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.only(left: 20,right: 20, top: 70),
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
            ),

            Container(
              margin: EdgeInsets.only(left: 20,right: 20, top: 42),
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextFormField(
                cursorColor: Color(0xFFFFB300),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email_rounded,
                    color: Color(0xFFFFB300),

                  ),
                  labelText: "Enter Your Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                validator: (value){
                  if(value!.isEmpty ||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                    return "Enter Valid email-id";
                  }else{
                    return null;
                  }
                },


              )),

            Container(
              margin: EdgeInsets.only(left: 20,right: 20, top: 40),
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextFormField(
                obscureText: true,
                cursorColor: Color(0xFFFFB300),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key_rounded,
                    color: Color(0xFFFFB300),

                  ),
                  labelText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                  validator: (value) {
                    RegExp regex =
                    RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  }),
            ),

            Container(
              margin: EdgeInsets.only(left: 20,right: 20, top: 35),
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child:TextFormField(
                obscureText: true,
                cursorColor: Color(0xFFFFB300),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key_rounded,
                    color: Color(0xFFFFB300),

                  ),
                  labelText: "Confirm Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                  validator: (value) {
                    RegExp regex =
                    RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  }  ),
            ),

            GestureDetector
              (
              onTap: () => {
                if(formkey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LoginScreen()
                  ))
                }
              },
              child: Container
                (
                margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                padding: EdgeInsets.only(left: 20,right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [(new Color(0xFFFFB300)), (new Color(0xFFFFB300))],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xFFFFB300)
                    )]
                ),
                child: Text
                  (
                  "SIGN UP",
                  style: TextStyle
                    (
                      color: Colors.black

                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already an user ?"),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pop(context)
                    },
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                          color: Color(0xFF000000)
                      ),
                    ),
                  )
                ],
              ),
            )


          ],
        )
        ),
      ),
  );
  }

}