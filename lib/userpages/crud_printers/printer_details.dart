import 'package:SenParc/model/matosModel.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../model/userModel.dart';
import '../../screens/home.dart';
import '../../services/infos.dart';

class PrinterDetails extends StatefulWidget {
  const PrinterDetails({super.key, required this.matosModel});
  final MatosModel matosModel;

  @override
  State<PrinterDetails> createState() => _PrinterDetailsState();
}

class _PrinterDetailsState extends State<PrinterDetails> {
  String nom_type_matos="Imprimante";
  String marque_matos="";
  String modele_matos="";
  String sn_matos="";
  String date_reception="";
  String info_matos="";
  var etatMatos;
  var etatAttribution;

  getInfo() async{
    var data=await Info.getInfoAllPrinters(widget.matosModel.id.toString());
    var etat=await Info.getEtatMatos(widget.matosModel.id.toString());
    var attribution=await Info.getEtatAtribution(widget.matosModel.id.toString());
    setState(() {
      marque_matos=data[0]['nom_marque_matos'];
      modele_matos=data[0]['modele_matos'];
      sn_matos=data[0]['sn_matos'];
      date_reception=data[0]['date_reception'];
      info_matos=data[0]['info_matos'];
      etatMatos=etat;
      etatAttribution=attribution;
    });
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
        backgroundColor: Colors.indigo,
        title: Text("Information", style: TextStyle(fontSize: 20,color: Colors.white),),
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
                    'Profil', style: TextStyle(color: Colors.indigo),
                  ),
                ),
                const PopupMenuItem( // A menu item widget with the text "Menu 2"
                  //onTap: getData, // A menu item widget with the text "Menu 2"
                  child: Text(
                    'Actualiser',style: TextStyle(color: Colors.indigo),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Caractéristiques", style: TextStyle(color: Colors.indigo,fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Type"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 12),
                    subtitle: Text(nom_type_matos),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Marque:"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 12),
                    subtitle: Text(marque_matos),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Modèle"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 12),
                    subtitle: Text(modele_matos),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Numéro série:"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 12),
                    subtitle: Text(sn_matos),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Date recption"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 12),
                    subtitle: Text(date_reception),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Caractéristiques matériels"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 12),
                    subtitle: ReadMoreText(
                      info_matos,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      trimLines: 3,
                      colorClickableText: Colors.blue,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '  Voir Plus',
                      trimExpandedText: '  Voir moins',
                      moreStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider()
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.health_and_safety, color: Colors.indigo,),
                  title: const Text("Etat machine"),
                  trailing: etatMatos?[0]['nbMatos'] !=0 ?const Icon(Icons.error_outlined, color: Colors.red,):const Icon(Icons.check_circle, color: Colors.green,),
                  onTap: (){
                    print(etatMatos);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.fingerprint, color: Colors.indigo,),
                  title: const Text("Attribution"),
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>CartePro(agentModel: widget.agentModel,)));
                  },
                  trailing: etatAttribution?[0]['nbAttrib'] ==0 ?const Text("En attente d'attribution ...", style: TextStyle(color: Colors.red),):const Icon(Icons.qr_code_2, color: Colors.green,),
                ),
                ListTile(
                  leading: const Icon(Icons.history, color: Colors.indigo,),
                  title: const Text("Historique"),
                  onTap: (){

                  },
                  trailing: const Icon(Icons.arrow_forward, color: Colors.indigo,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}