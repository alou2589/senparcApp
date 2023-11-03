import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AgentModel {
  int? id;
  int? poste_id;
  int? sous_structure_id;
  int? type_agent_id;
  String? prenom;
  String? nom;
  String? date_naissance;
  String? lieu_naissance;
  String? genre;
  String? matricule;
  String? fonction;

  static AgentModel? agentDetail;

  AgentModel({this.id,this.prenom,this.nom,this.poste_id,this.sous_structure_id,this.type_agent_id,this.date_naissance,this.lieu_naissance,this.matricule,
    this.fonction, this.genre
  });
  factory AgentModel.fromJson(Map<String, dynamic> i)=>AgentModel(
    id: i['id'],
    poste_id: i['poste_id'],
    sous_structure_id: i['sous_structure_id'],
    type_agent_id: i['type_agent_id'],
    prenom: i['prenom'],
    nom: i['nom'],
    date_naissance: i['date_naissance'],
    lieu_naissance: i['lieu_naissance'],
    genre: i['genre'],
    matricule: i['matricule'],
    fonction: i['fonction'],
  );
  Map<String, dynamic>? toMap()=>{
    "poste_id":poste_id,
    "sous_structure_id":sous_structure_id,
    "type_agent_id":type_agent_id,
    "prenom":prenom,
    "nom":nom,
    "date_naissance":date_naissance,
    "lieu_naissance":lieu_naissance,
    "genre":genre,
    "matricule":matricule,
    "fonction":fonction,
  };


  static getAgent() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var data= preferences.getString("agent");
    var agentDecode=json.decode(data!);
    var InfoAgent=await AgentModel.fromJson(agentDecode);
    agentDetail=InfoAgent;
    //print(sessionUser?.email);
  }
}