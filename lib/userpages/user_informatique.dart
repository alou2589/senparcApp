import 'package:SenParc/userpages/addMatos.dart';
import 'package:SenParc/userpages/crud_desktop/desktop.dart';
import 'package:SenParc/userpages/crud_laptop/laptop.dart';
import 'package:SenParc/userpages/crud_others/others.dart';
import 'package:SenParc/userpages/crud_printers/printers.dart';
import 'package:SenParc/userpages/crud_attribution/qr_scanner.dart';
import 'package:flutter/material.dart';
import '../model/userModel.dart';
import '../screens/home.dart';

class UserInformatiquePage extends StatefulWidget {
  const UserInformatiquePage({super.key});

  @override
  State<UserInformatiquePage> createState() => _UserInformatiquePageState();
}

class _UserInformatiquePageState extends State<UserInformatiquePage> {
  final GlobalKey globalKey=GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: const Text("Parc Informatique", style: TextStyle(fontSize: 20,color: Colors.white),),
            actions: [
              IconButton( // An icon button for a search action
                color: Colors.white,
                tooltip: 'Recherche', // A tooltip for the button
                icon: const Icon( // The search icon
                  Icons.search,
                ),
                onPressed: () {}, // An empty method that can be replaced with custom functionality
              ),
              PopupMenuButton<Text>( // A popup menu button for additional menu options
                color: Colors.white,
                itemBuilder: (context) { // A method that returns the menu options as widgets
                  return [
                    const PopupMenuItem( // A menu item widget with the text "Menu 1"
                      child: Text(
                        'Profil', style: TextStyle(color: Colors.indigo),
                      ),
                    ),
                    PopupMenuItem( // A menu item widget with the text "Menu 2"
                      onTap: (){}, // A menu item widget with the text "Menu 2"
                      child: const Text(
                        'Actualiser',style: TextStyle(color: Color(0xFF0288D1)),
                      ),
                    ),
                    PopupMenuItem( // A menu item widget with the text "Menu 3"
                      onTap:(){
                        UserModel.logout();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomePage()), (route) => false);
                      },
                      child: const Text(
                        'Deconnexion', style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ];
                },
              )
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.laptop_windows_outlined, color: Colors.white,)),
                Tab(icon: Icon(Icons.desktop_windows_outlined, color: Colors.white,)),
                Tab(icon: Icon(Icons.print, color: Colors.white,)),
                Tab(icon: Icon(Icons.devices_other, color: Colors.white,)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LaptopPage(),
              DesktopPage(),
              PrintersPage(),
              OthersPage(),
            ],
          ),
          floatingActionButton: Wrap( //will break to another line on overflow
            direction: Axis.vertical, //use vertical to show  on vertical axis
            children: <Widget>[
              Container(
                margin:EdgeInsets.all(5),
                child: FloatingActionButton(
                  heroTag: "Scan Button",
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>QrCodeScanner()));
                  },
                  backgroundColor:  Colors.indigo,
                  child: Icon(Icons.qr_code, color: Colors.white,),
                  shape: CircleBorder(),
                )
              ),
              Container(
                margin:EdgeInsets.all(5),
                child: FloatingActionButton(
                  heroTag: "Add Button",
                  shape: CircleBorder(),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddMatos()));
                  },
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add, color: Colors.white,),
                )
              ), // Add more buttons here
            ],
          ),
        ),
    );
  }
}

