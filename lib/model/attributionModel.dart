class AttributionModel {
  int? id;
  int? agent_id;
  int? matos_id;
  String? date_attribution;

  AttributionModel({this.id, this.agent_id ,  this.matos_id, this.date_attribution});
  factory AttributionModel.fromJson(Map<String, dynamic> i)=>AttributionModel(
    id: i['id'],
    agent_id: i['agent_id'],
    matos_id: i['matos_id'],
    date_attribution: i['date_attribution'],
  );
  Map<String, dynamic> toMap()=>{
    "agent_id":agent_id,
    "matos_id":matos_id,
    "date_attribution":date_attribution,
  };
}