# ocee

## Run project
You will need the [Flutter sdk](https://docs.flutter.dev/get-started/install), VS Code with the Flutter [plugin](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter), and a physical device.
You can also run flutter commands like `flutter pub get` / `flutter run` if you are used to it

- Connect a physical Android device and check it's recognized by VS Code
- In VS Code, Run > Run without debugging
- The app will be running on your device

## Project Architecture

- bindings : dependency injection
- controllers : GetX Controllers : logic
- models : models
- repositories : repos (call https)
- services : services
- ui : design
- utils : some cool stuff

## Libs

GetX : State manager  
GetStorage : storage
