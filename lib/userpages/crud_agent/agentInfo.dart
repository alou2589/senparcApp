import 'package:flutter/material.dart';
import '../../../services/infos.dart';
import '../../model/agentModel.dart';
import 'agent_details.dart';

class AgentPage extends StatefulWidget {
  const AgentPage({super.key});

  @override
  State<AgentPage> createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  List<AgentModel> agents=[];

  getAgentData() async{
    var data=await Info.getAgents();
    if(data != null){
      agents.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          agents.add(AgentModel.fromJson(i));
        });
      }
      //print(structures.length);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAgentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Align(
              //  alignment: Alignment.bottomRight,
              //  child: IconButton(icon: const Icon(Icons.add_circle, color: Color(0xFF0288D1),),
              //    onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAgent()));
              //    },
              //  ),
              //),
              //const Divider(height: 0.2, color: Color(0xFF0288D1),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${agents.length} ", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.teal, fontSize: 20),),agents.length<=1?const Text("agent"):const Text("agents"),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: agents.length,
                      itemBuilder: (context, index) {
                        final agent=agents[index];
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child:ListTile(
                            title: Text("${agent.prenom??""} ${agent.nom??""}", style: const TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(agent.matricule??"", style: const TextStyle(fontSize: 10),),
                            subtitleTextStyle: const TextStyle(fontSize: 10),
                            textColor: Colors.black,
                            trailing: const Icon(Icons.info, color: Colors.teal,),
                            leading: const Icon(Icons.person, color: Colors.teal,),
                            iconColor: Colors.black,
                            onTap: (){
                              //print(agent.id);
                              setState(() {
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AgentDetails(agentModel: agent,)));
                            },
                          ),
                        );
                      }
                  )
              )
            ]
        )
    );
  }
}
