import 'dart:convert';

import 'package:http/http.dart' as http;

import '../crypto/aes_encrypt.dart';
class Info{

  static addMatos(Map<String, dynamic>? data) async{
    var response= await http.post(Uri.parse(Url.addMatos), body:{
      "data": encrypt(json.encode(data))
    }
    );
    //print(response.statusCode);
    return json.decode(decrypt(response.body));
  }
  static getDirections() async{
    final response= await http.get(Uri.parse(Url.getDirections));
    return json.decode(decrypt(response.body));
  }
  static getAgences() async{
    final response= await http.get(Uri.parse(Url.getAgences));
    return json.decode(decrypt(response.body));
  }
  static getCellules() async{
    final response= await http.get(Uri.parse(Url.getCellules));
    return json.decode(decrypt(response.body));
  }
  static getDivisions() async{
    final response= await http.get(Uri.parse(Url.getDivisions));
    return json.decode(decrypt((response.body)));
  }
  static getAgents() async{
    final response= await http.get(Uri.parse(Url.getAgents));
    return json.decode(decrypt((response.body)));
  }

  static getPortables() async{
    final response= await http.get(Uri.parse(Url.getPortables));
    return json.decode(decrypt((response.body)));
  }
  static getPrinters() async{
    final response= await http.get(Uri.parse(Url.getImprimantes));
    return json.decode(decrypt((response.body)));
  }
  static getFixes() async{
    final response= await http.get(Uri.parse(Url.getFixes));
    return json.decode(decrypt((response.body)));
  }
  static getMarqueMatos() async{
    final response= await http.get(Uri.parse(Url.getMarqueMatos));
    return json.decode(decrypt((response.body)));
  }
  static getFournisseurs() async{
    final response= await http.get(Uri.parse(Url.getFournisseurs));
    return json.decode(decrypt((response.body)));
  }
  static getAttributions() async{
    final response= await http.get(Uri.parse(Url.getAttributions));
    return json.decode(decrypt((response.body)));
  }
  static getStructures() async{
    final response= await http.get(Uri.parse(Url.getStructures));
    return json.decode(decrypt((response.body)));
  }
  static getStock(String nomTypeMatos) async{
    final response= await http.post(Uri.parse(Url.getStock), body: {
      "nom_type_matos":encrypt(nomTypeMatos)
    });
    //print(response.body);
    return json.decode(decrypt((response.body)));
  }
  static getMatos(String nom_type_matos) async{
    final response= await http.post(Uri.parse(Url.getMatos), body: {
      "nom_type_matos":encrypt(nom_type_matos)
    });
    //print(response.body);
    return json.decode(decrypt((response.body)));
  }
  static getTypeMatos() async{
    final response= await http.get(Uri.parse(Url.getTypeMatos));
    //print(response.body);
    return json.decode(decrypt((response.body)));
  }
  static getSousStructures() async{
    final response= await http.get(Uri.parse(Url.getSousStructures));
    return json.decode(decrypt((response.body)));
  }
  static getAllDesktops() async{
    final response= await http.get(Uri.parse(Url.getAllDesktops));
    return json.decode(decrypt((response.body)));
  }
  static getAllPrinters() async{
    final response= await http.get(Uri.parse(Url.getAllPrinters));
    return json.decode(decrypt((response.body)));
  }

  static getInfoAgent(String id) async{
    final response= await http.post(Uri.parse(Url.getInfoAgent), body: {
      "id":encrypt(id)
    });
    return json.decode(decrypt(response.body));
  }
  static getInfoPortable(String id) async{
    final response= await http.post(Uri.parse(Url.getInfoPortable), body: {
      "id":encrypt(id)
    });
    return json.decode(decrypt((response.body)));
  }
  static getInfoAllDesktop(String id) async{
    final response= await http.post(Uri.parse(Url.getInfoAllDesktop), body: {
      "id":encrypt(id)
    });
    return json.decode(decrypt((response.body)));
  }
  static getInfoAllPrinters(String id) async{
    final response= await http.post(Uri.parse(Url.getInfoAllPrinter), body: {
      "id":encrypt(id)
    });
    return json.decode(decrypt((response.body)));
  }
  static getAllOthers() async{
    final response= await http.get(Uri.parse(Url.getOthers));
    return json.decode(decrypt((response.body)));
  }
  static getInfoAttribution(String id) async{
    final response= await http.post(Uri.parse(Url.getInfoAttribution), body: {
      "id":encrypt(id)
    });
    //print(response.statusCode);
    return json.decode(decrypt(response.body));
  }
  static getInfoAgentAttribution(String id) async{
    final response= await http.post(Uri.parse(Url.getInfoAgentAttribution), body: {
      "id":encrypt(id)
    });
    //print(response.statusCode);
    return json.decode(decrypt(response.body));
  }
  static getInfoStructure(String id) async{
    final response= await http.post(Uri.parse(Url.getInfoStructure), body: {
      "id":encrypt(id)
    });
    //print(response.statusCode);
    return json.decode(decrypt(response.body));
  }
  static getInfoSousStructure(String id) async{
    final response= await http.post(Uri.parse(Url.getInfoSousStructure), body: {
      "id":encrypt(id)
    });
    //print(response.statusCode);
    return json.decode(decrypt(response.body));
  }
  static getEtatMatos(String id) async{
    final response= await http.post(Uri.parse(Url.getEtatMatos), body: {
      "id":encrypt(id)
    });
    //print(response.statusCode);
    return json.decode(decrypt(response.body));
  }
  static getEtatAtribution(String id) async{
    final response= await http.post(Uri.parse(Url.getEtatAttribution), body: {
      "id":encrypt(id)
    });
    //print(response.statusCode);
    return json.decode(decrypt(response.body));
  }
  static getStatusMatos(String id) async{
    final response= await http.post(Uri.parse(Url.getStatusMatos), body: {
      "id":encrypt(id)
    });
    //print(response.statusCode);
    return json.decode(decrypt(response.body));
  }
  static getAgentsSousStructure(String id) async{
    final response= await http.post(Uri.parse(Url.getAgentsSousStructure), body: {
      "id":encrypt(id)
    });
    //print(json.decode(decrypt(response.body)));
    return json.decode(decrypt(response.body));
  }

  static IPaddr(){
    //return  "http://192.168.1.9:8888";
    //return  "http://192.168.161.96:8888";
    //return  "http://10.112.26.13";
    return  "http://10.112.26.94";
  }
}
class Url{
  static String addMatos="${Info.IPaddr()}/adminministere/addMatos.php";
  static String getDirections="${Info.IPaddr()}/adminministere/getDirections.php";
  static String getAgences="${Info.IPaddr()}/adminministere/getAgences.php";
  static String getCellules="${Info.IPaddr()}/adminministere/getCellules.php";
  static String getDivisions="${Info.IPaddr()}/adminministere/getDivisions.php";
  static String getAgents="${Info.IPaddr()}/adminministere/getAgents.php";
  static String getPortables="${Info.IPaddr()}/adminministere/getPortables.php";
  static String getImprimantes="${Info.IPaddr()}/adminministere/getPrinters.php";
  static String getFixes="${Info.IPaddr()}/adminministere/getPrinters.php";
  static String getMarqueMatos="${Info.IPaddr()}/adminministere/getMarqueMatos.php";
  static String getFournisseurs="${Info.IPaddr()}/adminministere/getFournisseurs.php";
  static String getStructures="${Info.IPaddr()}/adminministere/getStructures.php";
  static String getSousStructures="${Info.IPaddr()}/adminministere/getSousStructure.php";
  static String getInfoAgent="${Info.IPaddr()}/adminministere/getInfoAgent.php";
  static String getInfoSousStructure="${Info.IPaddr()}/adminministere/getInfoSousStructure.php";
  static String getAgentsSousStructure="${Info.IPaddr()}/adminministere/getAgentsSousStructure.php";
  static String getInfoStructure="${Info.IPaddr()}/adminministere/getInfoStructure.php";
  static String getAttributions="${Info.IPaddr()}/adminministere/getAttributions.php";
  static String getStock="${Info.IPaddr()}/adminministere/getStock.php";
  static String getAllDesktops="${Info.IPaddr()}/adminministere/getAllDesktops.php";
  static String getAllPrinters="${Info.IPaddr()}/adminministere/getAllPrinters.php";
  static String getMatos="${Info.IPaddr()}/adminministere/getMatos.php";
  static String getInfoAllDesktop="${Info.IPaddr()}/adminministere/getInfoAdesktop.php";
  static String getInfoAllPrinter="${Info.IPaddr()}/adminministere/getInfoAPrinters.php";
  static String getInfoPortable="${Info.IPaddr()}/adminministere/getInfoPortable.php";
  static String getInfoAttribution="${Info.IPaddr()}/adminministere/getInfoAttribution.php";
  static String getInfoAgentAttribution="${Info.IPaddr()}/adminministere/getInfoAgentAttribution.php";
  static String getTypeMatos="${Info.IPaddr()}/adminministere/getTypeMatos.php";
  static String getEtatMatos="${Info.IPaddr()}/adminministere/getEtatMatos.php";
  static String getEtatAttribution="${Info.IPaddr()}/adminministere/getEtatAttribution.php";
  static String getStatusMatos="${Info.IPaddr()}/adminministere/getStatusMatos.php";
  static String getOthers="${Info.IPaddr()}/adminministere/getOthers.php";
}