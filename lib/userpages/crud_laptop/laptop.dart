import 'package:SenParc/model/matosModel.dart';
import 'package:SenParc/model/typeMaterielModel.dart';
import 'package:SenParc/userpages/crud_laptop/laptop_details.dart';
import 'package:flutter/material.dart';

import '../../services/infos.dart';

class LaptopPage extends StatefulWidget {
  LaptopPage({super.key, this.typeMaterielModel});
  TypeMaterielModel? typeMaterielModel;

  @override
  State<LaptopPage> createState() => _LaptopPageState();
}


class _LaptopPageState extends State<LaptopPage> {
  List<MatosModel> portables=[];

  getMatosModel() async{
    var data=await Info.getPortables();
    if(data != null){
      portables.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          portables.add(MatosModel.fromJson(i));
        });
      }
      //print(structures.length);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMatosModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${portables.length} ", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo, fontSize: 20),),portables.length<=1?const Text("O. Portable"):const Text("O. Portables"),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: portables.length,
                      itemBuilder: (context, index) {
                        final laptop=portables[index];
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child:ListTile(
                            title: Text(laptop.modele_matos??"", style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(laptop.sn_matos??"", style: const TextStyle(fontSize: 10),),
                            subtitleTextStyle: const TextStyle(fontSize: 10),
                            textColor: Colors.black,
                            trailing: const Icon(Icons.info, color: Colors.indigo,),
                            leading: const Icon(Icons.laptop, color: Colors.indigo,),
                            iconColor: Colors.black,
                            onTap: (){
                              //print(laptop.id);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LaptopDetails(matosModel: laptop)));
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
