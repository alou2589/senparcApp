class MarqueMatosModel {
  int? id;
  String? nom_marque_matos;
  String? description_marque_matos;

  MarqueMatosModel({this.id, this.nom_marque_matos ,  this.description_marque_matos});
  factory MarqueMatosModel.fromJson(Map<String, dynamic> i)=>MarqueMatosModel(
    id: i['id'],
    nom_marque_matos: i['nom_marque_matos'],
    description_marque_matos: i['description_marque_matos'],
  );
  Map<String, dynamic> toMap()=>{
    "nom_marque_matos":nom_marque_matos,
    "description_marque_matos":description_marque_matos,
  };
}