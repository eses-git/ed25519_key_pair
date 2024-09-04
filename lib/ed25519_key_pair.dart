import 'package:cryptography/cryptography.dart';
import 'dart:convert';


class Ed25519KeyPair {
  final SimplePublicKey publicKey;
  final SimpleKeyPair privateKey;

  // Constructor
  Ed25519KeyPair({required this.publicKey, required this.privateKey});

  // Function to generate the key pair
  static Future<Ed25519KeyPair> generateKeyPair() async {
    final algorithm = Ed25519();
    // Generate the key pair
    final keyPair = await algorithm.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();

    return Ed25519KeyPair(publicKey: publicKey, privateKey: keyPair);
  }
}
Future<void> generateAndDisplayKeys() async {
  final keyPair = await Ed25519KeyPair.generateKeyPair();

  print('Public Key: ${base64Encode(keyPair.publicKey.bytes)}');
  print('Private Key: ${base64Encode(await keyPair.privateKey.extractPrivateKeyBytes())}');
}
void main() async {
  // Generate an Ed25519 key pair
  final keyPair = await Ed25519KeyPair.generateKeyPair();

  print('Public Key: ${keyPair.publicKey.bytes}');
  print('Private Key: ${await keyPair.privateKey.extractPrivateKeyBytes()}');
}
