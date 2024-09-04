import 'package:flutter_test/flutter_test.dart';
import 'package:cryptography/cryptography.dart';
import 'package:ecc_ppk_management/ed25519_key_part.dart';

void main() {
  group('Ed25519KeyPair', () {
    test('generateKeyPair generates a valid key pair', () async {
      // Generate the key pair
      final keyPair = await Ed25519KeyPair.generateKeyPair();

      // Validate that the key pair is not null
      expect(keyPair, isNotNull);

      // Validate that the public key is not null and has the correct length
      expect(keyPair.publicKey, isNotNull);
      expect(keyPair.publicKey.bytes.length, 32);

      // Validate that the private key is not null
      final privateKeyBytes = await keyPair.privateKey.extractPrivateKeyBytes();
      expect(privateKeyBytes, isNotNull);
      expect(privateKeyBytes.length, 32);
    });

    test('generateKeyPair generates different key pairs', () async {
      // Generate two different key pairs
      final keyPair1 = await Ed25519KeyPair.generateKeyPair();
      final keyPair2 = await Ed25519KeyPair.generateKeyPair();

      // Validate that the public keys are different
      expect(keyPair1.publicKey.bytes, isNot(keyPair2.publicKey.bytes));

      // Validate that the private keys are different
      final privateKeyBytes1 = await keyPair1.privateKey.extractPrivateKeyBytes();
      final privateKeyBytes2 = await keyPair2.privateKey.extractPrivateKeyBytes();
      expect(privateKeyBytes1, isNot(privateKeyBytes2));
    });
  });
}
