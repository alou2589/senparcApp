

class StructureModel {
  int id;
  int type_structure_id;
  String? nom_structure;
  String? description_structure;

  StructureModel({required this.id,required this.type_structure_id , required this.nom_structure, required this.description_structure});
  factory StructureModel.fromJson(Map<String, dynamic> i)=>StructureModel(
    id: i['id'],
    type_structure_id: i['type_structure_id'],
    nom_structure: i['nom_structure'],
    description_structure: i['description_structure'],
  );
  Map<String, dynamic> toMap()=>{
    "id":id,
    "type_structure_id":type_structure_id,
    "nom_structure":nom_structure,
    "description_structure":description_structure,
  };
}