import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stg1_hng_flutter/encrypt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encryption App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const EncryptionApp(),
    );
  }
}

class EncryptionApp extends StatefulWidget {
  const EncryptionApp({super.key});

  @override
  _EncryptionAppState createState() => _EncryptionAppState();
}

class _EncryptionAppState extends State<EncryptionApp> {
  final _inputController = TextEditingController();
  final _secretKeyController = TextEditingController();
  String _encrypted = '';
  String _decrypted = '';
  bool _isSecretKeyVisible = false;

  void _encrypt() { //encryption method
    String input = _inputController.text;
    String secretKey = _secretKeyController.text;
    String encrypted = EncryptionAlgorithm.encrypt(input, secretKey);
    setState(() {
      _encrypted = encrypted;
      _decrypted = ''; // Clear decrypted result when encrypting
    });
  }

  void _decrypt() { //decryption method
    String encrypted = _encrypted;
    String secretKey = _secretKeyController.text;
    String decrypted = EncryptionAlgorithm.decrypt(encrypted, secretKey);
    setState(() {
      _decrypted = decrypted;
    });
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard: $text')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Encryption Program',
            style: TextStyle(color: Colors.black, fontSize: 16)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _inputController,
                decoration: InputDecoration(
                  labelText: 'Input',
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _secretKeyController,
                obscureText:
                    !_isSecretKeyVisible, // Hide or show the secret key
                decoration: InputDecoration(
                  labelText: 'Secret Key',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isSecretKeyVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isSecretKeyVisible =
                            !_isSecretKeyVisible; // Toggle visibility
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 228, 83, 73),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: _encrypt,
                    child: const Text(
                      'Encrypt',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: _decrypt,
                    child: const Text(
                      'Decrypt',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Card(
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Encrypted Text:',
                          style: TextStyle(fontSize: 15)),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _encrypted,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Visibility(
                            visible: _encrypted.isNotEmpty,
                            child: IconButton(
                              iconSize: 18, // Smaller copy icon
                              icon: const Icon(Icons.copy),
                              onPressed: () => _copyToClipboard(_encrypted),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                          height: 20,
                          thickness: 1), // Add a divider for separation
                      const Text('Decrypted Text:',
                          style: TextStyle(fontSize: 15)),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _decrypted,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Visibility(
                            visible: _decrypted.isNotEmpty,
                            child: IconButton(
                              iconSize: 18, // Smaller copy icon
                              icon: const Icon(Icons.copy),
                              onPressed: () => _copyToClipboard(_decrypted),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
