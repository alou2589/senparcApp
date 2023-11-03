import 'package:SenParc/widgets/DashBoardStock.dart';
import 'package:SenParc/widgets/dashboard_informatique.dart';
import 'package:flutter/material.dart';

import '../model/userModel.dart';
import '../screens/home.dart';
import '../services/infos.dart';
import '../widgets/dashboard_agent.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  UserModel? userModel;
  String? directionLength;
  String? sousStructureLength;
  String? agenceLength;
  String? agentsLength;
  String? divisionsLength;

  getData() async{
    var directiondata=await Info.getDirections();
    var sousStructuredata=await Info.getCellules();
    var agentdata=await Info.getAgents();
    var agencedata=await Info.getAgences();
    //var divisiondata=await Info.getDivisions();
    setState(() {
      directionLength=directiondata?.length.toString();
    });
    setState(() {
      sousStructureLength=sousStructuredata.length.toString();
    });
    setState(() {
      agenceLength=agencedata?.length.toString();
    });

    setState(() {
      agentsLength=agentdata.length.toString();
    });
    setState(() {
      //divisionsLength=divisiondata.length.toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserModel.getUser();
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return  DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF0288D1),
              title: const Text("Accueil", style: TextStyle(fontSize: 20,color: Colors.white),),
              actions: [
                IconButton( // An icon button for a search action
                  color: Colors.white,
                  tooltip: 'Recherche', // A tooltip for the button
                  icon: const Icon( // The search icon
                    Icons.search,
                  ),
                  onPressed: () {}, // An empty method that can be replaced with custom functionality
                ),
                PopupMenuButton<Text>( // A popup menu button for additional menu options
                  color: Colors.white,
                  itemBuilder: (context) { // A method that returns the menu options as widgets
                    return [
                      const PopupMenuItem( // A menu item widget with the text "Menu 1"
                        child: Text(
                          'Profil', style: TextStyle(color: Color(0xFF0288D1)),
                        ),
                      ),
                      PopupMenuItem( // A menu item widget with the text "Menu 2"
                        onTap: getData, // A menu item widget with the text "Menu 2"
                        child: const Text(
                          'Actualiser',style: TextStyle(color: Color(0xFF0288D1)),
                        ),
                      ),
                      PopupMenuItem( // A menu item widget with the text "Menu 3"
                        onTap:(){
                          UserModel.logout();
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomePage()), (route) => false);
                        },
                        child: const Text(
                          'Deconnexion', style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ];
                  },
                )
              ],
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home_work, color: Colors.white,)),
                  Tab(icon: Icon(Icons.devices_other, color: Colors.white,)),
                  Tab(icon: Icon(Icons.local_convenience_store, color: Colors.white,)),
                ],
              ),
            ),
            //drawer: const MyDrawerMenu(),
            body:  const TabBarView(
              children: [
                DashBoardAgent(),
                DashBoardInformatique(),
                DashBoardStock(),
              ],
            ),
          )
      );
  }
}
