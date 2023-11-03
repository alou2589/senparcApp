import 'package:SenParc/model/matosModel.dart';
import 'package:flutter/material.dart';
import '../../model/userModel.dart';
import '../../screens/home.dart';
import '../../services/infos.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AttributionDetails extends StatefulWidget {
  const AttributionDetails({super.key, required this.matosModel});
  final MatosModel matosModel;

  @override
  State<AttributionDetails> createState() => _AttributionDetailsState();
}

class _AttributionDetailsState extends State<AttributionDetails> {
  String nom_complet="";
  String matricule="";
  String date_attribution="";
  String codeQR="";

  getInfo() async{
    var data=await Info.getInfoAttribution(widget.matosModel.id.toString());
    setState(() {
      nom_complet= "${data['prenom']} ${data['nom']}";
      matricule=data['matricule'];
      date_attribution=data['date_attribution'];
      codeQR=data['qr_code_attribution'];
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Nom Complet"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 12),
                    subtitle: Text(nom_complet),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Matricule:"),
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 12),
                    subtitle: Text(matricule),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
