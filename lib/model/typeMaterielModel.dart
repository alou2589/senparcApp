class TypeMaterielModel {
  int? id;
  int? categorie_matos_id;
  String? nom_type_matos;

  TypeMaterielModel({this.id, this.categorie_matos_id ,  this.nom_type_matos});
  factory TypeMaterielModel.fromJson(Map<String, dynamic> i)=>TypeMaterielModel(
    id: i['id'],
    categorie_matos_id: i['categorie_matos_id'],
    nom_type_matos: i['nom_type_matos'],
  );
  Map<String, dynamic> toMap()=>{
    "categorie_matos_id":categorie_matos_id,
    "nom_type_matos":nom_type_matos,
  };
}