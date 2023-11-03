import 'package:flutter/material.dart';

import '../../../screens/home.dart';
import '../../../services/infos.dart';
import '../../model/agentModel.dart';
import '../../model/matosModel.dart';
import '../../model/userModel.dart';

class AgentDetails extends StatefulWidget {
   final AgentModel agentModel;

  AgentDetails({super.key, required this.agentModel,});

  @override
  State<AgentDetails> createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  String nom_sous_structure="";
  String nom_poste="";
  List<MatosModel> materiels=[];

  getInfo() async{
    var data=await Info.getInfoAgent(widget.agentModel.poste_id.toString());
    setState(() {
      nom_poste=data[0]['nom_poste'];
      if(data[0]['description_sous_structure'].length<=20){
        nom_sous_structure=data[0]['description_sous_structure'];
      }
      else{
        nom_sous_structure=data[0]['nom_sous_structure'];
      }
    });
  }
  getMatosData() async{
    var data=await Info.getInfoAgentAttribution(widget.agentModel.id.toString());
    print(data);
    if(data != null){
      materiels.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          materiels.add(MatosModel.fromJson(i));
        });
      }

      print(materiels);
    }
    //print(materiels);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("${widget.agentModel.matricule}", style: TextStyle(fontSize: 20,color: Colors.white),),
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
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Informations Personnelles", style: TextStyle(color: Colors.teal,fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ListTile(
                      title: Text("Prénom"),
                      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                      subtitle: Text("${widget.agentModel.prenom}"),
                    ),
                ),
                Expanded(
                    child: ListTile(
                title: const Text("Nom:"),
                titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                subtitle: Text("${widget.agentModel.nom}"),
                ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ListTile(
                      title: Text("Genre"),
                      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                      subtitle: Text("${widget.agentModel.genre}"),
                    ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Date de naissance:"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                    subtitle: Text("${widget.agentModel.date_naissance}"),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Lieu de naissance:"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                    subtitle: Text("${widget.agentModel.lieu_naissance}"),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left:20, right: 20),
              child: const Divider(color: Colors.teal,),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Statut Agent", style: TextStyle(color: Colors.teal,fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Matricule"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                    subtitle: Text("${widget.agentModel.matricule}"),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Fonction:"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                    subtitle: Text("${widget.agentModel.fonction}"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Poste"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                    subtitle: Text(nom_poste),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Service:"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 12),
                    subtitle: Text(nom_sous_structure),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left:20, right: 20),
              child: const Divider(color: Colors.teal,),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Statut Parc Informatique", style: TextStyle(color: Colors.teal,fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: getMatosData, child: Text("Appuyer"))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: materiels.length,
                  itemBuilder: (context, index) {
                    final materiel=materiels[index];
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child:ListTile(
                        title: Text(materiel.modele_matos!, style: const TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(materiel.sn_matos!, style: const TextStyle(fontSize: 10),),
                        subtitleTextStyle: const TextStyle(fontSize: 10),
                        textColor: Colors.black,
                        trailing: const Icon(Icons.info, color: Colors.teal,),
                        leading: const Icon(Icons.person, color: Colors.teal,),
                        iconColor: Colors.black,
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentDetails(agentModel: agent,)));
                        },
                      ),
                    );
                  }
                  )
            ),
          ],
        ),
    );
  }
}
