import 'dart:async';
import 'dart:convert';

import 'package:SenParc/userpages/crud_structure/structure_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/infos.dart';
import '../../model/structureModel.dart';

class StructurePage extends StatefulWidget {
  const StructurePage({super.key});

  @override
  State<StructurePage> createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  List<StructureModel> structures=[];

  get timer => null;

  getData() async{
    var data=await Info.getStructures();
    if(data != null){
      structures.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          structures.add(StructureModel.fromJson(i));
        });
      }//print(structures.length);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Align(
          //  alignment: Alignment.bottomRight,
          //  child: IconButton(icon: Icon(Icons.add_circle, color: Colors.teal,),onPressed: (){},),
          //),
          const Divider(height: 0.2, color: Colors.teal,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${structures.length} ", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.teal, fontSize: 20),),structures.length<=1?const Text("structure"):const Text("structures"),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: structures.length,
                  itemBuilder: (context, index) {
                    final direction=structures[index];
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child:ListTile(
                        title: Text(direction.nom_structure??"", style: const TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(direction.description_structure??"", style: const TextStyle(fontSize: 8),),
                        //subtitleTextStyle: const TextStyle(fontSize: 10),
                        textColor: Colors.black,
                        trailing: const Icon(Icons.info, color: Colors.teal,),
                        leading: const Icon(Icons.home_work, color: Colors.teal,),
                        iconColor: Colors.black,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StructureDetails(structureModel: direction,)));
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
