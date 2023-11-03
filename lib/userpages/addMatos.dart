import 'package:SenParc/model/fournisseurModel.dart';
import 'package:SenParc/model/marqueMatosModel.dart';
import 'package:SenParc/model/matosModel.dart';
import 'package:SenParc/model/typeMaterielModel.dart';
import 'package:SenParc/userpages/user_informatique.dart';
import 'package:SenParc/widgets/customTextField.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../services/infos.dart';

class AddMatos extends StatefulWidget {
  const AddMatos({super.key});

  @override
  State<AddMatos> createState() => _AddMatosState();
}

class _AddMatosState extends State<AddMatos> {
  MatosModel matosModel=MatosModel();
  SingleValueDropDownController typeMatosController=SingleValueDropDownController();
  SingleValueDropDownController marqueMatosController=SingleValueDropDownController();
  SingleValueDropDownController fournisseurController=SingleValueDropDownController();
  CustomTextField modele_matos=CustomTextField(title: "Modèle Matériel", placeholder: "Modèle Matériel", line: 1);
  CustomTextField sn_matos=CustomTextField(title: "Numéro de série", placeholder: "Numéro de série", line: 1);
  TextEditingController dateReceptionController=TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  CustomTextField info_matos=CustomTextField(title: "Caractéristiques", placeholder: "Caractéristiques", line: 6);

  String selectedTypeMatos="";
  String selectedMarqueMatos="";
  String selectedFournisseur="";

  List marqueMateriels=[];
  List fournisseurs=[];
  List typeMatos=[];

  getTypeMatos() async{
    var data=await Info.getTypeMatos();
    if(data != null){
      typeMatos.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          typeMatos.add(TypeMaterielModel.fromJson(i));
        });
      }
      //print(typeagents);
    }
  }
  getMarqueMateriels() async{
    var data=await Info.getMarqueMatos();
    if(data != null){
      marqueMateriels.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          marqueMateriels.add(MarqueMatosModel.fromJson(i));
        });
      }
      //print(typeagents);
    }
  }
getFournisseurs() async{
    var data=await Info.getFournisseurs();
    if(data != null){
      fournisseurs.clear();
      for(Map<String, dynamic> i in data){
        setState(() {
          fournisseurs.add(FournisseurModel.fromJson(i));
        });
      }
      //print(typeagents);
    }
  }

  final _key= GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTypeMatos();
    getMarqueMateriels();
    getFournisseurs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout Matériel", style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child:Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Type Matériel
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:DropDownTextField(
                    // initialValue: "name4",
                    controller: typeMatosController,
                    clearOption: false,
                    textFieldFocusNode: textFieldFocusNode,
                    searchFocusNode: searchFocusNode,
                    // searchAutofocus: true,
                    dropDownItemCount: 4,
                    searchShowCursor: false,
                    enableSearch: true,
                    //searchKeyboardType: TextInputType.number,
                    // dropdownColor: Colors.teal,
                    searchDecoration: const InputDecoration(
                        hintText: "Type"),
                    validator: (value) {
                      if (value == null) {
                        return "Champ requis";
                      } else {
                        return null;
                      }
                    },
                    dropDownList: typeMatos.map((e){
                      return DropDownValueModel(name: e.nom_type_matos??"", value: e.id);
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedTypeMatos=val.toString();
                      });
                    },
                  ),
                ),
                // Marque Matériel
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:DropDownTextField(
                    // initialValue: "name4",
                    controller: marqueMatosController,
                    clearOption: false,
                    textFieldFocusNode: textFieldFocusNode,
                    searchFocusNode: searchFocusNode,
                    // searchAutofocus: true,
                    dropDownItemCount: 4,
                    searchShowCursor: false,
                    enableSearch: true,
                    //searchKeyboardType: TextInputType.number,
                    // dropdownColor: Colors.teal,
                    searchDecoration: const InputDecoration(
                        hintText: "Marque"),
                    validator: (value) {
                      if (value == null) {
                        return "Champ requis";
                      } else {
                        return null;
                      }
                    },
                    dropDownList: marqueMateriels.map((e){
                      return DropDownValueModel(name: e.nom_marque_matos??"", value: e.id);
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedMarqueMatos=val.toString();
                      });
                    },
                  ),
                ),

                //Modèle matériel
                const SizedBox(
                  height: 20,
                ),
                modele_matos.textFormField(),
                //Numéro de Série
                const SizedBox(
                  height: 20,
                ),
                sn_matos.textFormField(),

                // Fournisseur
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:DropDownTextField(
                    // initialValue: "name4",
                    controller: fournisseurController,
                    clearOption: false,
                    textFieldFocusNode: textFieldFocusNode,
                    searchFocusNode: searchFocusNode,
                    // searchAutofocus: true,
                    dropDownItemCount: 4,
                    searchShowCursor: false,
                    enableSearch: true,
                    //searchKeyboardType: TextInputType.number,
                    // dropdownColor: Colors.teal,
                    searchDecoration: const InputDecoration(
                        hintText: "Fournisseur"),
                    validator: (value) {
                      if (value == null) {
                        return "Champ requis";
                      } else {
                        return null;
                      }
                    },
                    dropDownList: fournisseurs.map((e){
                      return DropDownValueModel(name: e.nom_fournisseur??"", value: e.id);
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedFournisseur=val.toString();
                      });
                    },
                  ),
                ),

                //Date de reception
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: dateReceptionController,
                    decoration: const InputDecoration(
                        iconColor: Colors.teal,
                        icon: Icon(Icons.calendar_today_outlined),
                        labelText: "Date de reception"),
                    onTap: () async{
                      DateTime? pickDate= await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1957),
                        lastDate: DateTime(2101),
                      );
                      if(pickDate != null) {
                        dateReceptionController.text=formatDate(pickDate,[dd,'-',MM,'-',yyyy]);
                      }
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                info_matos.textFormField(),

                //Validation
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () async{
                      if(_key.currentState!.validate()){
                        matosModel.type_matos_id=typeMatosController.dropDownValue?.value;
                        matosModel.fournisseur_id=fournisseurController.dropDownValue?.value;
                        matosModel.marque_matos_id=marqueMatosController.dropDownValue?.value;
                        matosModel.modele_matos=modele_matos.value;
                        matosModel.sn_matos=sn_matos.value;
                        matosModel.date_reception=dateReceptionController.text;
                        matosModel.info_matos=info_matos.value;
                        var resultat=await Info.addMatos(matosModel.toMap());
                        if(resultat[0]){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>UserInformatiquePage()), (route) => false);
                          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                            content: Text(resultat[1]), backgroundColor: Colors.teal,));
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                        else{
                        print(resultat[1]);
                        //_loading=false;
                          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                            content: Text(resultat[1]), backgroundColor: Colors.red,));
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                        //print(resultat);
                        //print(typeAgentController.dropDownValue?.value);
                        //print(json.decode(decrypt(info.body)));
                        //_loading=true;
                        //print(resultat);
                      }

                    },
                    child: const Text("Valider", style: TextStyle(color: Colors.teal),),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
