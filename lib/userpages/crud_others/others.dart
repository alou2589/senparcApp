import 'package:flutter/material.dart';
import '../../model/matosModel.dart';
import '../../services/infos.dart';

class OthersPage extends StatefulWidget {
  const OthersPage({super.key});

  @override
  State<OthersPage> createState() => _OthersPageState();
}

class _OthersPageState extends State<OthersPage> {
  List<MatosModel> others=[];

  getMatosModel() async{
    var data=await Info.getAllOthers();
    if(data != null){
      others.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          others.add(MatosModel.fromJson(i));
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
                  Text("${others.length} ", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo, fontSize: 20),),others.length<=1?const Text("Autres Matériels"):const Text("O. others"),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: others.length,
                      itemBuilder: (context, index) {
                        final other=others[index];
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child:ListTile(
                            title: Text(other.modele_matos??"", style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(other.sn_matos??"", style: const TextStyle(fontSize: 10),),
                            subtitleTextStyle: const TextStyle(fontSize: 10),
                            textColor: Colors.black,
                            trailing: const Icon(Icons.info, color: Colors.indigo,),
                            leading: const Icon(Icons.devices_other, color: Colors.indigo,),
                            iconColor: Colors.black,
                            onTap: (){
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
