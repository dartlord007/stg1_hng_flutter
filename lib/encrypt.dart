//Encryption Algorithm.
class EncryptionAlgorithm {
  static String encrypt(String input, String secretKey) {
    List<int> inputAscii = input.codeUnits;
    List<int> secretKeyAscii = secretKey.codeUnits;

    List<int> encryptedAscii = [];
    //Core component of encryption algorithm. This will encrypt the inputed text and secret key which is already in ASCII format. The result is the reformated into a hexadecimal string.
    for (int i = 0; i < inputAscii.length; i++) {
      encryptedAscii
          .add(inputAscii[i] + secretKeyAscii[i % secretKeyAscii.length]);
    }

    return encryptedAscii
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join();
  }

  static String decrypt(String encrypted, String secretKey) {
    List<int> encryptedAscii = [];
    //Core component of decryption algorithm.
    for (int i = 0; i < encrypted.length; i += 2) {
      encryptedAscii.add(int.parse(encrypted.substring(i, i + 2), radix: 16));
    }
    List<int> secretKeyAscii = secretKey.codeUnits;

    List<int> decryptedAscii = [];
    for (int i = 0; i < encryptedAscii.length; i++) {
      decryptedAscii
          .add(encryptedAscii[i] - secretKeyAscii[i % secretKeyAscii.length]);
    }

    return String.fromCharCodes(decryptedAscii);
  }
}
