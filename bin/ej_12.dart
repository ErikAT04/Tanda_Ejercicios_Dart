import 'dart:io';

import 'package:encrypt/encrypt.dart';

void main(){
  print("Elige el texto a encriptar");
  String texto = stdin.readLineSync()!;
  Key clave = Key.fromUtf8("ClaveDePruebaDe32BitsDeLongitud-");
  IV iv = IV.fromLength(16);

  Encrypter e = Encrypter(AES(clave));

  Encrypted textoEncriptado = e.encrypt(texto, iv: iv);

  print("Texto encriptado: ${textoEncriptado.base64}");
}