import 'package:encrypt/encrypt.dart';

final key= Key.fromUtf8("@l@ss@net@mbedou25septembre1989+");
final iv=IV.fromUtf8("@l@ss@net@mbedou");

String encrypt(String text){
  final encrypter=Encrypter(AES(key, mode: AESMode.cbc));
  final finalCrypt= encrypter.encrypt(text, iv: iv);
  return finalCrypt.base64;
}
String decrypt(String textCrypt){
  final encrypter=Encrypter(AES(key, mode: AESMode.cbc));
  final plain=encrypter.decrypt(Encrypted.fromBase64(textCrypt), iv: iv);

  return plain;
}