import 'dart:io';

import 'package:encrypt/encrypt.dart';

void main(){ //Función principal
  print("Elige el texto a encriptar");
  String texto = stdin.readLineSync()!; //Guarda la frase escrita
  Key clave = Key.fromUtf8("ClaveDePruebaDe32BitsDeLongitud-"); //Guardo una key personalizada (Tiene que tener 32 caracteres)
  IV iv = IV.fromLength(16);

  Encrypter e = Encrypter(AES(clave)); //Creo el Encrypter de tipo AES y uso la clave personalizada

  Encrypted textoEncriptado = e.encrypt(texto, iv: iv); //Encripto el texto

  print("Texto encriptado: ${textoEncriptado.base64}"); //Muestro el texto encriptado
}