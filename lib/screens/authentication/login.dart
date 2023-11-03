import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../crypto/aes_encrypt.dart';
import '../../model/userModel.dart';
import '../../services/infos.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/loading.dart';
import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final CustomTextField _emailText= CustomTextField(title: "Email", placeholder: "Entrez Email", err: "Veuillez remplir", line: 1);
  final CustomTextField _passText= CustomTextField(title: "Password", placeholder: "Entrez Password", isPass: true,err: "Veuillez remplir", line: 1);
  final _key=GlobalKey<FormState>();
  Color? snackBgColor;
  bool _loading=false;



  void login(context,String emailText, String passText) async{

    setState(() {
      snackBgColor=Colors.red;
      _loading=true;
    });
    String url="${Info.IPaddr()}/adminministere/login.php";
    var response=await http.post(Uri.parse(url), body: {
      "email": encrypt(emailText),
      "password":encrypt(passText),
    });
    var phpData= json.decode(decrypt(response.body));
    var data=phpData['data'];
    print(phpData[1]);
    //print(BCrypt.hashpw(passText,BCrypt.gensalt()));
    if(data[1]==1){
      //print(data[0]);
      setState(() {
        _loading=false;
        snackBgColor=Colors.teal;
        UserModel.saveUser(UserModel.fromJson(data[2]));
        UserModel.getUser();
        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const UserHomePage()), (route) => false);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomePage()), (route) => false);
        //print(data[2]);
      });
    }
    else{
      //print(phpData);
      //_loading=false;
      setState(() {
        _loading=false;
        snackBgColor=Colors.red;
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(data[0]), backgroundColor: snackBgColor,));
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomePage()), (route) => false);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _loading?
      const LoadingPage():
      Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/images/logo.png",height: 200),
                  const SizedBox(height: 25,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    child: _emailText.textFormField(),
                  ),
                  const SizedBox(height: 25,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    child: _passText.textFormField(),
                  ),
                  const SizedBox(height: 25,),
                  TextButton(
                      onPressed: (){
                        login(context,_emailText.value, _passText.value);
                      },
                      style: TextButton.styleFrom(backgroundColor: Color(0xFF0288D1),),
                      child: const Text("Login", style: TextStyle(color: Colors.white),)
                  ),
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Avez vous activer votre compte ?"),
                      TextButton(
                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage()));
                          },
                          child: const Text("Activer")
                      )
                    ],
                  )
                ],
              ),
            )
          )
        ),
      ),
    );
  }
}