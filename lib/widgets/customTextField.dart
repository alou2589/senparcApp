import 'package:flutter/material.dart';

class CustomTextField {
 final String? title;
 final String? placeholder;
 final bool? isPass;
 final String err;
 final int line;
 TextEditingController _controller=TextEditingController();
 String _value="";
 CustomTextField({required this.title, required this.placeholder, this.isPass = false, this.err="Veuillez remplir ", required this.line});
 TextFormField textFormField(){
   return TextFormField(
     maxLines: line,
     controller: _controller,
     onChanged: (e){
       _value=e;
     },
     obscureText: isPass!,
     validator: (value) {
       if(value!.isEmpty||value==null){
         return err;
       }
       return null;
     },
     decoration:  InputDecoration(
       hintText: placeholder,
       labelText: title,
       labelStyle: const TextStyle(color: Color(0xFF0288D1),),
       border: const OutlineInputBorder(
         borderRadius: BorderRadius.all(Radius.circular(10))
       ),
       focusedBorder: const OutlineInputBorder(
         borderSide: BorderSide(
           color: Colors.teal
         )
       )
     ),
   );
 }
 String get value{
   return _value;
 }
}