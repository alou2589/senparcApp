class FournisseurModel {
  int? id;
  String? nom_fournisseur;
  String? contact_fournisseur;

  FournisseurModel({this.id, this.nom_fournisseur ,  this.contact_fournisseur});
  factory FournisseurModel.fromJson(Map<String, dynamic> i)=>FournisseurModel(
    id: i['id'],
    nom_fournisseur: i['nom_fournisseur'],
    contact_fournisseur: i['contact_fournisseur'],
  );
  Map<String, dynamic> toMap()=>{
    "nom_fournisseur":nom_fournisseur,
    "contact_fournisseur":contact_fournisseur,
  };
}