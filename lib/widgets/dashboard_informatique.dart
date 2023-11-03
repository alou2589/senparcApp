import 'package:flutter/material.dart';

import '../services/infos.dart';

class DashBoardInformatique extends StatefulWidget {
  const DashBoardInformatique({super.key});

  @override
  State<DashBoardInformatique> createState() => _DashBoardInformatiqueState();
}

class _DashBoardInformatiqueState extends State<DashBoardInformatique> {

  String? laptopLength;
  String? desktopLength;
  String? printersLength;
  String? attributionsLength;

  getData() async{
    var laptopData=await Info.getPortables();
    var desktopData=await Info.getFixes();
    var printersData=await Info.getPrinters();
    var attributionsData=await Info.getAttributions();
    setState(() {
      laptopLength=laptopData?.length.toString();
    });
    setState(() {
      desktopLength=desktopData.length.toString();
    });
    setState(() {
      printersLength=printersData?.length.toString();
    });
    setState(() {
      attributionsLength=attributionsData?.length.toString();
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
                const Icon(Icons.laptop_windows_outlined, color: Colors.white,size: 50,),
                const Text("O. PORTABLES",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(laptopLength??"",style:TextStyle(color:Colors.white, fontSize:20))
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
                const Icon(Icons.desktop_windows_outlined, color: Colors.white,size: 50,),
                const Text("O. FIXES",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(desktopLength??"",style:TextStyle(color:Colors.white, fontSize:20))
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
                Icon(Icons.print, color: Colors.white,size: 50,),
                Text("PRINTERS",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(printersLength??"",style:TextStyle(color:Colors.white, fontSize:20))
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
                Icon(Icons.fingerprint, color: Colors.white,size: 50,),
                Text("ATTRIBUTIONS",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(attributionsLength??"",style:TextStyle(color:Colors.white, fontSize:20))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
