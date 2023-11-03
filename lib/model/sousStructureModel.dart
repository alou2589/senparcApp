class SousStructureModel {
  int? id;
  int? type_sous_structure_id;
  String? nom_sous_structure;
  String? description_sous_structure;

  SousStructureModel({this.id, this.type_sous_structure_id ,  this.nom_sous_structure,  this.description_sous_structure});
  factory SousStructureModel.fromJson(Map<String, dynamic> i)=>SousStructureModel(
    id: i['id'],
    type_sous_structure_id: i['type_sous_structure_id'],
    nom_sous_structure: i['nom_sous_structure'],
    description_sous_structure: i['description_sous_structure'],
  );
  Map<String, dynamic> toMap()=>{
    "type_sous_structure_id":type_sous_structure_id,
    "nom_sous_structure":nom_sous_structure,
    "description_sous_structure":description_sous_structure,
  };
}