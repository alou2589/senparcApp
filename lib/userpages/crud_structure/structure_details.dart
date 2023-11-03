import 'package:flutter/material.dart';

import '../../../screens/home.dart';
import '../../../services/infos.dart';
import '../../model/sousStructureModel.dart';
import '../../model/structureModel.dart';
import '../../model/userModel.dart';
import '../crud_sousStructure/sous_structure_details.dart';

class StructureDetails extends StatefulWidget {
  StructureDetails({super.key, required this.structureModel});
  final StructureModel structureModel;

  @override
  State<StructureDetails> createState() => _StructureDetailsState();
}

class _StructureDetailsState extends State<StructureDetails> {
  String nom_structure="";
  List<SousStructureModel> services=[];

  getData() async{
    var data=await Info.getInfoStructure(widget.structureModel.id.toString());
    if(data !=  null){
      services.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          services.add(SousStructureModel.fromJson(i));
        });
      }
      setState(() {
        nom_structure=data != null? data[0]['nom_structure']:"";
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("${widget.structureModel.nom_structure}", style: TextStyle(fontSize: 20,color: Colors.white),),
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
            //Align(
            //  alignment: Alignment.bottomRight,
            //  child: IconButton(
            //    icon: const Icon(Icons.add_circle, color: Colors.teal,),
            //    onPressed: (){
            //      //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAgent(sousStructureModel: widget.sousStructureModel,)));
            //    },
            //  ),
            //),
            //const Divider(height: 0.2, color: Colors.teal,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${services.length} ", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.teal, fontSize: 20),),services.length<=1?const Text("sous-structure"):const Text("sous-structures"),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final service=services[index];
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child:ListTile(
                          title: Text("${service.nom_sous_structure??""}", style: const TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text(service.description_sous_structure??"", style: const TextStyle(fontSize: 10),),
                          subtitleTextStyle: const TextStyle(fontSize: 10),
                          textColor: Colors.black,
                          trailing: const Icon(Icons.info, color: Colors.teal,),
                          leading: const Icon(Icons.person, color: Colors.teal,),
                          iconColor: Colors.black,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SousStructureDetails(sousStructureModel: service,)));
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
