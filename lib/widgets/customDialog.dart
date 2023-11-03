import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../userpages/user_informatique.dart';
import 'package:readmore/readmore.dart';

class CustomDialogBox extends StatefulWidget {
  final String nom_complet, matricule, marque_modele, info_matos;

   CustomDialogBox({super.key,required this.nom_complet,required this.matricule,required this.marque_modele,required this.info_matos});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5,top: 5
              + 10, right: 10,bottom: 10
          ),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(child: Text(
                  "${widget.nom_complet}-${widget.matricule}",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),),
              Divider(),
              SizedBox(height: 15,),
              Text(widget.marque_modele,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              SizedBox(height: 22,),
              ReadMoreText(
                widget.info_matos,
                style: TextStyle(fontSize: 10),
                trimLines: 3,
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: '  Voir Plus',
                trimExpandedText: '  Voir moins',
                moreStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              //Text(widget.info_matos,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>UserInformatiquePage()), (route) => false);
                    },
                    child: Text("OK", style:TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Icon(Icons.check_circle, color: Colors.green,size: 20,)
            ),
          ),
        ),
      ],
    );
  }
}