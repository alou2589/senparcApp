import 'package:flutter/material.dart';

import '../services/infos.dart';

class DashBoardStock extends StatefulWidget {
  const DashBoardStock({super.key});

  @override
  State<DashBoardStock> createState() => _DashBoardStockState();
}

class _DashBoardStockState extends State<DashBoardStock> {

  String? laptopStockLength;
  String? desktopStockLength;
  String? aioStockLength;
  String? printersStockLength;
  String? attributionsStockLength;

  getData() async{
    var laptopStockData=await Info.getStock("Ordinateur Portable");
    var desktopStockData=await Info.getStock("Ordinateur Fixe");
    var printersStockData=await Info.getStock("Imprimante%");
    var aioStockData=await Info.getStock("All In One");
    setState(() {
      laptopStockLength=laptopStockData?.length.toString();
    });
    setState(() {
      desktopStockLength=desktopStockData.length.toString();
    });
    setState(() {
      printersStockLength=printersStockData.length.toString();
    });
    setState(() {
      aioStockLength=aioStockData.length.toString();
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
                Text(laptopStockLength??"",style:TextStyle(color:Colors.white, fontSize:20))
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
                Text(desktopStockLength??"",style:TextStyle(color:Colors.white, fontSize:20))
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
                const Icon(Icons.desktop_mac, color: Colors.white,size: 50,),
                const Text("AIO",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(aioStockLength??"",style:TextStyle(color:Colors.white, fontSize:20))
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
                Text("IMPRIMANTES",style: TextStyle(color: Colors.white, fontSize: 10, fontWeight:FontWeight.bold),),
                Text(printersStockLength??"",style:TextStyle(color:Colors.white, fontSize:20))
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
        ],
      ),
    );
  }
}
