import 'package:flutter/material.dart';

import '../../../screens/home.dart';
import '../../model/agentModel.dart';
import '../../model/sousStructureModel.dart';
import '../../model/userModel.dart';
import '../../services/infos.dart';
import '../crud_agent/agent_details.dart';

class SousStructureDetails extends StatefulWidget {
  const SousStructureDetails({super.key, required this.sousStructureModel});
  final SousStructureModel sousStructureModel;

  @override
  State<SousStructureDetails> createState() => _SousStructureDetailsState();
}

class _SousStructureDetailsState extends State<SousStructureDetails> {
  String nom_sous_structure="";
  List<AgentModel> agents=[];

  getAgentData() async{
    var data=await Info.getAgentsSousStructure(widget.sousStructureModel.id.toString());
    if(data != null){
      agents.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          agents.add(AgentModel.fromJson(i));
        });
      }
    }
  }

  getData() async{
    var resultat=await Info.getInfoSousStructure(widget.sousStructureModel.id.toString());
    setState(() {
      nom_sous_structure=resultat['nom_sous_structure'];
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getAgentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("${widget.sousStructureModel.nom_sous_structure}", style: TextStyle(fontSize: 20,color: Colors.white),),
        centerTitle: true,
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
                    'Profil', style: TextStyle(color: Colors.teal),
                  ),
                ),
                const PopupMenuItem( // A menu item widget with the text "Menu 2"
                  //onTap: getData, // A menu item widget with the text "Menu 2"
                  child: Text(
                    'Actualiser',style: TextStyle(color: Colors.teal),
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
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Divider(height: 0.2, color: Colors.teal,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${agents.length}", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.teal, fontSize: 20),),agents.length<=1?const Text("agent"):const Text("agents"),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: agents.length,
                    itemBuilder: (context, index) {
                      final agent=agents[index];
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child:ListTile(
                          title: Text("${agent.prenom??""} ${agent.nom??""}", style: const TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text(agent.matricule??"", style: const TextStyle(fontSize: 10),),
                          subtitleTextStyle: const TextStyle(fontSize: 10),
                          textColor: Colors.black,
                          trailing: const Icon(Icons.info, color: Colors.teal,),
                          leading: const Icon(Icons.person, color: Colors.teal,),
                          iconColor: Colors.black,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentDetails(agentModel: agent,)));
                          },
                        ),
                      );
                    }
                )
            )
          ]
      ),
    );
  }
}
