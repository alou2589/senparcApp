import 'package:SenParc/userpages/crud_sousStructure/sous_structure_details.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../../../services/infos.dart';
import '../../model/sousStructureModel.dart';

class SousStructurePage extends StatefulWidget {
  const SousStructurePage({super.key});

  @override
  State<SousStructurePage> createState() => _SousStructurePageState();
}

class _SousStructurePageState extends State<SousStructurePage> {
  List<SousStructureModel> sousStructures=[];

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
    getServicesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Align(
              //  alignment: Alignment.bottomRight,
              //  child: IconButton(icon: const Icon(Icons.add_circle, color: Colors.teal,),onPressed: (){},),
              //),
              const Divider(height: 0.2, color: Colors.teal,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${sousStructures.length} ", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.teal, fontSize: 20),),sousStructures.length<=1?const Text("sous-structure"):const Text("sous-structures"),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: sousStructures.length,
                      itemBuilder: (context, index) {
                        final services=sousStructures[index];
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                            ),
                          ),
                          child:ListTile(
                            title: Text(services.nom_sous_structure??"", style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(services.description_sous_structure??""),
                            subtitleTextStyle: const TextStyle(fontSize: 10),
                            textColor: Colors.black,
                            trailing: const Icon(Icons.info, color: Colors.teal,),
                            leading: const Icon(Icons.desk, color: Colors.teal,),
                            iconColor: Colors.black,
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SousStructureDetails(sousStructureModel: services)));
                            },
                          ),
                        );
                      }
                  )
              )
            ]
        )
    );
  }
}
