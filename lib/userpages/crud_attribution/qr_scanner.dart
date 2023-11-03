import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../model/userModel.dart';
import '../../screens/home.dart';
import '../../services/infos.dart';
import '../../widgets/customDialog.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var data;
  String? nom_complet,matricule,marque_modele,info_matos;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async{
      var result = scanData.code.toString();
      var qrData=await Info.getStatusMatos(result[result.length-1]);
      setState(() {
        data=qrData;
        nom_complet="${data[0]['prenom']} ${data[0]['nom']}";
        marque_modele=data[0]['modele_matos'];
        matricule=data[0]['matricule'];
        info_matos=data[0]['info_matos'];

      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Scanner", style: TextStyle(fontSize: 20,color: Colors.white),),
        centerTitle: true,
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
                const PopupMenuItem( // A menu item widget with the text "Menu 2"
                  //onTap: getData, // A menu item widget with the text "Menu 2"
                  child: Text(
                    'Actualiser',style: TextStyle(color: Colors.indigo),
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          data ==null?SingleChildScrollView(
            child:Container(
              margin: EdgeInsets.only(top: 20),
              height: 600,
              width: 600,
              child:  QRView(
                overlayMargin: EdgeInsetsGeometry.infinity,
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            )
          ):
          Container(
            child: SingleChildScrollView(
              child: CustomDialogBox(nom_complet: nom_complet!,matricule:matricule!,marque_modele:marque_modele!,info_matos:info_matos!),
            ),
          )
        ],
      ),
    );
  }
}
