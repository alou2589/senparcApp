import 'package:SenParc/userpages/crud_printers/printer_details.dart';
import 'package:flutter/material.dart';

import '../../model/matosModel.dart';
import '../../services/infos.dart';

class PrintersPage extends StatefulWidget {
  const PrintersPage({super.key});

  @override
  State<PrintersPage> createState() => _PrintersPageState();
}

class _PrintersPageState extends State<PrintersPage> {
  List<MatosModel> printers=[];

  getMatosModel() async{
    var data=await Info.getAllPrinters();
    if(data != null){
      printers.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          printers.add(MatosModel.fromJson(i));
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
              //Align(
              //  alignment: Alignment.bottomRight,
              //  child: IconButton(icon: const Icon(Icons.add_circle, color: Colors.indigo,),
              //    onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAgent()));
              //    },
              //  ),
              //),
              //const Divider(height: 0.2, color: Colors.indigo,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${printers.length} ", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo, fontSize: 20),),printers.length<=1?const Text("Imprimante"):const Text("Imprimantes"),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: printers.length,
                      itemBuilder: (context, index) {
                        final printer=printers[index];
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child:ListTile(
                            title: Text(printer.modele_matos??"", style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(printer.sn_matos??"", style: const TextStyle(fontSize: 10),),
                            subtitleTextStyle: const TextStyle(fontSize: 10),
                            textColor: Colors.black,
                            trailing: const Icon(Icons.info, color: Colors.indigo,),
                            leading: const Icon(Icons.laptop_windows_outlined, color: Colors.indigo,),
                            iconColor: Colors.black,
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PrinterDetails(matosModel: printer,)));
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
