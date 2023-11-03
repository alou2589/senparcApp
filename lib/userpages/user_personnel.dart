import 'package:SenParc/userpages/crud_agent/agentInfo.dart';
import 'package:SenParc/userpages/crud_structure/structureInfo.dart';
import 'package:flutter/material.dart';

import '../model/agentModel.dart';
import '../model/sousStructureModel.dart';
import '../model/structureModel.dart';
import '../model/userModel.dart';
import '../screens/home.dart';
import '../services/infos.dart';

class UserPersonnelPage extends StatefulWidget {
  const UserPersonnelPage({super.key});

  @override
  State<UserPersonnelPage> createState() => _UserPersonnelPageState();
}

class _UserPersonnelPageState extends State<UserPersonnelPage> {
  String? structureLength;
  List<StructureModel> structures=[];
  List<SousStructureModel> sousStructures=[];
  List<AgentModel> agents=[];

  getAgentData() async{
    var data=await Info.getAgents();
    if(data != null){
      agents.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          agents.add(AgentModel.fromJson(i));
        });
      }
      //print(structures.length);
    }
  }
  getData() async{
    var data=await Info.getDirections();
    if(data != null){
      structures.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          structures.add(StructureModel.fromJson(i));
        });
      }
      //print(structures.length);
    }
  }
  getServicesData() async{
    var data=await Info.getSousStructures();
    if(data != null){
      sousStructures.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          sousStructures.add(SousStructureModel.fromJson(i));
        });
      }
      //print(structures.length);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAgentData();
    getData();
    getServicesData();
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text("Personnel", style: TextStyle(fontSize: 20,color: Colors.white),),
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
                Tab(icon: Icon(Icons.people, color: Colors.white),),
              ],
            ),
          ),
          body:const TabBarView(
            children: [
              StructurePage(),
              AgentPage(),
            ],
          ),
        )
    );
  }
}

