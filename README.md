## HNG Stage 1 Task 

A Flutter-based application that allows users to securely encrypt and decrypt text using a custom algorithm. This app is designed to be simple, intuitive, and easy to use.

## Deployed on [Appetize.io]()

## Features

- **Encryption**: Securely encrypt any input text using a secret key.
- **Decryption**: Decrypt encrypted text back to its original form using the same secret key.
- **Copy to Clipboard**: Easily copy the encrypted or decrypted text with a single tap.
- **Secret Key Visibility**: Toggle visibility of the secret key for added security.
- **User-Friendly UI**: Clean and intuitive design for seamless interaction.

## Setup Instructions
### Clone the Repository
`
git clone https://github.com/dartlord007/stg1_hng_flutter
cd stg1_hng_flutter
`
## Navigate to the project directory:
`cd stg1_hng_flutter`

## Installing Dependencies
Run the following command to install the required dependencies:

`flutter pub get`

## Running the App
Connect a physical device or start an emulator.
Run the app using the following command:
`flutter run`

## Building the App

### Debug Build:
`flutter build apk`

## How to use

1. Enter Input Text :
- Type the text you want to encrypt in the "Input" field.
2. Provide a Secret Key :
- Enter a secret key in the "Secret Key" field. This key will be used for both encryption and decryption.
3. Encrypt the Text :
- Click the Encrypt button to generate the encrypted text.
4. Decrypt the Text :
- To decrypt the encrypted text, click the Decrypt button. Ensure you use the same secret key.
5. Copy Encrypted/Decrypted Text :
- Tap the copy icon next to the encrypted or decrypted text to copy it to your clipboard.
6. Toggle Secret Key Visibility :
- Click the eye icon in the "Secret Key" field to toggle between showing and hiding the secret key.

## Example

Input:
- Text : Hello World
- Secret Key : mysecretkey

Output:
- Encrypted Text : d4d3e9e0d9 (Example output; actual output may vary based on the algorithm)
- Decrypted Text : Hello World

## Dependencies
None


## 🎯 Contributing

Feel free to fork this repository, create a new branch, and submit a pull request! Contributions are welcome.

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/dartlord007/hng_stg0/blob/master/LICENSE)
 file for details.


