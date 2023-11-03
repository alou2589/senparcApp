import 'package:SenParc/userpages/user_personnel.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../model/userModel.dart';
import '../userpages/user_home.dart';
import '../userpages/user_informatique.dart';
import 'authentication/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool login=false;
  int _currentIndex=0;
  isConnected() async{
    await UserModel.getUser();
    if(UserModel.sessionUser==null){
      setState(() {
        login=false;
      });
    }
    else{
      setState(() {
        login=true;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isConnected();
  }
  setCurrentIndex(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return login?Scaffold(
      body: [
        const UserHomePage(),
        const UserPersonnelPage(),
        const UserInformatiquePage(),
      ][_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index)=>setCurrentIndex(index),
          items:  [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined, color: Color(0xFF0288D1),),
              title: const Text("Accueil"),
              selectedColor: Color(0xFF0288D1),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.people_alt, color: Colors.teal,),
              title: const Text("Personnel"),
              selectedColor: Colors.teal,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.devices_other, color: Colors.indigo,),
              title: const Text("Parc Info"),
              selectedColor: Colors.deepPurple,
            ),
          ]
      ),

    ):const LoginPage();
  }
}
