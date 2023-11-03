import 'package:SenParc/userpages/crud_desktop/desktop_details.dart';
import 'package:flutter/material.dart';

import '../../model/matosModel.dart';
import '../../services/infos.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  List<MatosModel> fixes=[];

  getMatosModel() async{
    var data=await Info.getAllDesktops();
    if(data != null){
      fixes.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          fixes.add(MatosModel.fromJson(i));
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
                  Text("${fixes.length} ", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo, fontSize: 20),),fixes.length<=1?const Text("O. fixe"):const Text("O. fixes"),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: fixes.length,
                      itemBuilder: (context, index) {
                        final fixe=fixes[index];
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child:ListTile(
                            title: Text(fixe.modele_matos??"", style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(fixe.sn_matos??"", style: const TextStyle(fontSize: 10),),
                            subtitleTextStyle: const TextStyle(fontSize: 10),
                            textColor: Colors.black,
                            trailing: const Icon(Icons.info, color: Colors.indigo,),
                            leading: const Icon(Icons.desktop_windows_outlined, color: Colors.indigo,),
                            iconColor: Colors.black,
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DesktopDetails(matosModel: fixe)));
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
