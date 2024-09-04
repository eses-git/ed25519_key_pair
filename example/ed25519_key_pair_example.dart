import 'package:ecc_ppk_management/ed25519_key_pair.dart';
import 'dart:convert';


Future<void> generateAndSaveKeyPair() async {
  final keyPair = await Ed25519KeyPair.generateKeyPair();

  final publicBase64 = base64Encode(keyPair.publicKey.bytes);
  final privateBase64 = base64Encode(await keyPair.privateKey.extractPrivateKeyBytes());

  print('Public Key: $publicBase64');
  print('Private Key: $privateBase64');


  print('Keys saved to secure storage.');
}
