import 'package:flutter/material.dart';

import '../services/infos.dart';

class DashBoardAgent extends StatefulWidget {
  const DashBoardAgent({super.key});

  @override
  State<DashBoardAgent> createState() => _DashBoardAgentState();
}

class _DashBoardAgentState extends State<DashBoardAgent> {

  String? agentsLength;
  String? directionLength;
  String? sousStructureLength;
  String? agenceLength;
  String? divisionsLength;

  getData() async{
    var directiondata=await Info.getDirections();
    var sousStructuredata=await Info.getCellules();
    var agencedata=await Info.getAgences();
    var divisiondata=await Info.getDivisions();
    var agentdata=await Info.getAgents();
    setState(() {
      directionLength=directiondata?.length.toString();
    });
    setState(() {
      sousStructureLength=sousStructuredata.length.toString();
    });
    setState(() {
      agenceLength=agencedata?.length.toString();
    });
    setState(() {
      divisionsLength=divisiondata.length.toString();
    });
    setState(() {
      agentsLength=agentdata.length.toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        mainAxisSpacing:10,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF0288D1),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.home_work, color: Colors.white,size: 50,),
                const Text("DIRECTIONS",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(directionLength??"",style:TextStyle(color:Colors.white, fontSize:20))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF0288D1),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.home_work, color: Colors.white,size: 50,),
                const Text("AGENCES",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(agenceLength??"",style:TextStyle(color:Colors.white, fontSize:20))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF0288D1),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.home_work, color: Colors.white,size: 50,),
                Text("PROJETS",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),

              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF0288D1),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child:  const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.desk, color: Colors.white,size: 50,),
                Text("SERVICES",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),

              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF0288D1),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.desk_sharp, color: Colors.white,size: 50,),
                Text("CELLULES",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(sousStructureLength??"",style:TextStyle(color:Colors.white, fontSize:20))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF0288D1),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.desk_sharp, color: Colors.white,size: 50,),
                Text("DIVISIONS",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(divisionsLength??"",style:TextStyle(color:Colors.white, fontSize:20))

              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF0288D1),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.desk_sharp, color: Colors.white,size: 50,),
                Text("BUREAUX",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),


              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF0288D1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF0288D1),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.people, color: Colors.white,size: 50,),
                Text("AGENTS",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(agentsLength??"",style:TextStyle(color:Colors.white, fontSize:20))
              ],
            ),
          ),
        ],
      ),
    );
  }
}


