class MatosModel {
  int? id;
  int? type_matos_id;
  int? fournisseur_id;
  int? marque_matos_id;
  String? modele_matos;
  String? sn_matos;
  String? date_reception;
  String? info_matos;

  MatosModel({this.id, this.type_matos_id ,  this.fournisseur_id,this.marque_matos_id, this.modele_matos, this.sn_matos,
              this.date_reception, this.info_matos});
  factory MatosModel.fromJson(Map<String, dynamic> i)=>MatosModel(
    id: i['id'],
    type_matos_id: i['type_matos_id'],
    fournisseur_id: i['fournisseur_id'],
    marque_matos_id: i['marque_matos_id'],
    modele_matos: i['modele_matos'],
    sn_matos: i['sn_matos'],
    date_reception: i['date_reception'],
    info_matos: i['info_matos'],
  );
  Map<String, dynamic> toMap()=>{
    "type_matos_id":type_matos_id,
    "fournisseur_id":fournisseur_id,
    "marque_matos_id":marque_matos_id,
    "modele_matos":modele_matos,
    "sn_matos":sn_matos,
    "date_reception":date_reception,
    "info_matos":info_matos,
  };
}