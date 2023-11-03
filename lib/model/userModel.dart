import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  int id;
  int agent_id;
  String? username;
  String? email;
  static UserModel? sessionUser;

  UserModel({required this.id, required this.agent_id , required this.username, required this.email});
  factory UserModel.fromJson(Map<String, dynamic> i)=>UserModel(
      id: i['id'],
      agent_id: i['agent_id'],
      username: i['username'],
      email: i['email'],
  );
  Map<String, dynamic> toMap()=>{
    "id":id,
    "agent_id":agent_id,
    "username":username,
    "email":email,
  };

  static void saveUser(UserModel userModel) async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var data= json.encode(userModel.toMap());
    preferences.setString("user", data);
    preferences.commit();
  }
  static getUser() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var data= preferences.getString("user");
    var descode=json.decode(data!);
    var user=await UserModel.fromJson(descode);
    sessionUser=user;
    //print(sessionUser?.email);
  }

  static void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    sessionUser=null;
    prefs.commit();
    //print(sessionUser!.email??"null");
  }

}