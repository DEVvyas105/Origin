import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:origin/loginScreen.dart';
import 'package:origin/pages/categories.dart';
import 'package:origin/pages/home.dart';
import 'package:origin/pages/more.dart';
import 'package:origin/pages/show.dart';
import 'package:origin/pages/vendor.dart';
import 'package:origin/signupscreen.dart';

class Dashboard extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => InitState();
}

  class InitState extends State<Dashboard>{

  final items  = const[
    Icon(Icons.home_filled, size: 30,),
    Icon(Icons.person_pin, size: 30,),
    Icon(Icons.list, size: 30,),
    Icon(Icons.category, size: 30,),
    Icon(Icons.more, size: 30,),

  ];

  int index = 1;


  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Welcome to Origin'),
        backgroundColor: Colors.amber,

      ),

      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectedIndex){
          setState(() {
            index = selectedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.amber,
        animationDuration: const Duration(microseconds: 300),
      ),

      drawer: Drawer(

        child: ListView(
          children: [

            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber
                ),
                accountName: Text('Devarsh Vyas'), accountEmail: Text ('devarshvyas02@gmail,com'),),

            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text(' Payment method '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Address'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Household'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()) , (route) => false);
              },
            ),
          ],

        ),
      ),

      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),


    );
  }
  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const Home();
        break;
      case 1:
        widget = const Vendor();
        break;
      case 2:
        widget = const Display();
        break;
      case 3:
        widget = const More();
        break;
      case 4:
        widget = const Categories();
        break;
      default:
        widget = const Home();
        break;
    }
    return widget;
  }
}