import 'package:flutter/material.dart';

import '../../widgets/customTextField.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final CustomTextField _emailText= CustomTextField(title: "Email", placeholder: "Entrez Email", line: 1);
  final CustomTextField _passText= CustomTextField(title: "Password", placeholder: "Entrez Password", isPass: true, line: 1);
  final CustomTextField _confirmpassText= CustomTextField(title: "Confirm Password", placeholder: "Entrez Confirmation Password", isPass: true, line: 1);
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(child:Text("Register Page", style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 25,),
                      _emailText.textFormField(),
                      const SizedBox(height: 25,),
                      _passText.textFormField(),
                      const SizedBox(height: 25,),
                      _confirmpassText.textFormField(),
                      const SizedBox(height: 25,),
                      TextButton(
                          onPressed: (){
                            if(_key.currentState?.validate()==true){
                              print(_emailText.value);
                              print(_passText.value);
                              print("OK");
                            }
                          },
                          style: TextButton.styleFrom(backgroundColor: Colors.green.withOpacity(.75)),
                          child: const Text("Login", style: TextStyle(color: Colors.white),)
                      ),
                      const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Avez vous un compte ?"),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          }, child: const Text("Se connecter"))
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
