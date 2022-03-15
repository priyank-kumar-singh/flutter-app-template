# Flutter App Template
Almost all the code we need to write inside the lib folder and we can see that by default Flutter doesn’t provide any file structure only the main.dart file with one stateful widget is present to run the sample counter.

Now, we will see what folders and files we need to create so that the application will be scalable.

## Get Started

**Step 1:** &nbsp;Clone this repository, then change folder name, because flutter will not accept the name <code>flutter-app-template</code>. As per flutter we should format name like <code>flutter_application_1</code>

**Step 2:** &nbsp;Open terminal, change directory to this repository, then run <code>flutter create .</code>

**Step 3:** &nbsp;Copy dependencies from the **dependencies.txt** file and paste them into pubspec.yaml file, then run <code>flutter pub get</code> command to install dependencies.

**Step 4:** &nbsp;Remove any unwanted dependencies and respective files or piece of code, and we're good to go.

**Note:** There is a piece of code for initialisation of SQL, SharedPreferences and Firebase in the file *wrapper.dart* with a method called initTools. We may need to modify/remove this piece of code at some point as per our needs.

## Architectural Design

<!-- The image below describes the folder structure, used in this template. -->

<!-- <img src="raw/file_structure.png" width="50%"/> <br> -->

**1. Assets:** This folder contains all of the images, icons, fonts, html and l10n.
- **Audios:** This is the folder where we store all our audio assets.
- **Images:** This is the most important folder where we store all our images.
- **Icons:** Instead of adding icon images in images folder, I created another folder to keep em separate.
- **Fonts:** This folder contains all custom font files.
- **HTML:** This folder contains any HTML content which we need to add in our mobile app (Generally the licensed content of the application or any .html files which we need to load in the application.
- **L10N:** If our application supports Internationalization then we need to add .arb files for all the supporting languages i.e If we need to support English and French then need to add en.arb and fr.arb in this folder.

**2. Config:** This folder contains routes, themes and localization related configurations.

- **Routes:** This folder contains three files namely *route_config.dart, route_handler.dart,* and *routes.dart*. See references for more info.

- **Themes:** This folder contains data for different themes supported by our app usually light and dark, initialisation of controller with identifier *appTheme* is already added in the main.dart file, only thing we need to change is theme data for light and dark themes.

**3. Constants:** This is where all our application constants will be present. All these files are self-descriptive.
- **assets:** This generated folder contains reference to all our assets listed in pubspec.yaml file. With the help of these classes we don't have to worry about mistyping asset location in our code. See references for more info.
- **api.dart:** Any info that is related to an API that we can use throughout our application will be present in this file.
- **const.dart:** All of the global constants will be present in this file.
- **keys.dart:** Global keys that we will be using for transition or other.

**4. Core:** Core features like Login/auth, walkthrough screens (Screens which are only visible at after the install only), application setting features are the core features that should be added in this folder.

**5. Models:** Models are just classes which help us to determine the structure of the data, and all of them go inside this folder.

**6. Modules:** All of the screens/pages that will be visible to the user will go inside this folder. This folder further contain folders for every module we are going to use in our app, and all related content will go in other folder. See References for more info.

**7. Util:** All of the utilities like helper functions, layout delegate/builders, mixins, services, ui material goes inside this folder which can be used throught the application.
- **Helpers:** In many scenarios, we need to write code multiple times for the same thing like converting the every word first characters to be uppercase. This kind of code can be made common to reduce the redundancy and add that code in helpers files which are present in lib/utils/helpers/text_helper.dart.

- **Services:** Code for any service like sql, shared_pref, firebase, aws, or other will go inside this folder, and code for services like *firebase, sqflite,* and *shared_preferences* is already been added here, we can modify these services as per our needs."

- **UI:** All the common UI related things will go inside this folder like custom animations, custom dialogs, and custom widgets like an input text box with search icon, autocomplete widgets, Error message banners, custom checkbox chips related utils can be present in this file and will be used thoughout the application.

**8. Widgets:** In a large scale application, we need to make more customized widgets rather than flutter default widgets. Suppose we need to make use of our own custom ElevatedButton, Divider etc which we can use throughout our application then that kind of customization widgets will be present inside this widgets.

*wrapper.dart* file inside *core/* folder contains code for the possible entry point when our application starts-up, and *wrapper.dart* file also contains some piece of code that initialises SQL, SharedPrefrences and Firebase with a method called initTools(). We may need to modify/remove this piece of code at some point as per our needs.

## Internationalization
Sometimes we want our application to support multiple languages and for that flutter gen generates localizations for different locales present in mentioned directory, and for this we need to setup some things first.

**1.** Create a file called *l10n.yaml* in the root directory of our project and add below content
```
arb-dir: assets/l10n
template-arb-file: en.arb
output-localization-file: app_localizations.dart
nullable-getter: false
```

**2.** Add dependencies and set generate flag to true in *pubspec.yaml* file
```
dependencies:
  flutter_localizations:  # Add these lines
    sdk: flutter

flutter:
  generate: true  # Add this line
  uses-material-design: true
```

**3.** Run <code>flutter pub get</code> to generate localization files. These files will be present inside the *.dart_tool* folder in the root directory of the flutter project, and for more info check references.

## Asset Generator
Writing absolute asset path in a large project can be painful and lead to errors. So we will be avoiding writing absolute path for any asset instead we will generate some code that gives us access to them with classes.

**1.** Install **flutter_gen** package globally. See references for more info.

**2.** Add dependencies in the *pubspec.yaml* file
```
dev_dependencies:
  build_runner:
  flutter_gen_runner:

flutter_gen:
  output: lib/constants/assets/
  integrations:
    flutter_svg: true
    rive: true
```

**3.** Run the following command to generate assets and run it everytime you made any changes to the assets, so as to generate new asset classes and replace any previous asset classes. <br>
```
flutter packages pub run build_runner build
```

**Note:** Using VSCode and seeing linter errors for AppLocalizations? I faced this issue as well, just make sure you have ran <code>flutter pub get</code> command once, now either restart your *editor* or *restart dart analysis server* from command palette, and you're good to go.

## References
Article by Flutter Community: [medium.com/flutter-community](https://medium.com/flutter-community/flutter-scalable-folder-files-structure-8f860faafebd) <br>
Article by GeeksForGeeks: [geeksforgeeks.org/flutter-file-structure](https://www.geeksforgeeks.org/flutter-file-structure/) <br>
Bloc Pattern: [Getting started with Flutter Bloc Pattern](https://www.mitrais.com/news-updates/getting-started-with-flutter-bloc-pattern/),
[Architect your Flutter Project using Bloc](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1) <br>
Bloc Library: [bloclibrary.dev/gettingstarted](https://bloclibrary.dev/#/gettingstarted) <br>
Flutter Gen: [pub.dev/packages/flutter_gen](https://pub.dev/packages/flutter_gen) <br>
Internationalization: [docs.flutter.dev/internationalization](https://docs.flutter.dev/development/accessibility-and-localization/internationalization) <br><br>

## Find me around web: <img align="left" src="https://raw.githubusercontent.com/priyank-kumar-singh/priyank-kumar-singh/main/assets/hacker.png" height="150" width="150"/>

- Sharing amazing articles on <a href="https://priyank-kumar-singh.medium.com/">Medium</a> 📰
- Sharing updates on <a href="https://www.linkedin.com/in/priyank-kumar-singh-705/">LinkedIn</a> 💼

[![Twitter: PRIYANKKUMARS18](https://img.shields.io/twitter/follow/PRIYANKKUMARS18?style=social)](https://twitter.com/priyankkumars18)
[![Linkedin: Priyank](https://img.shields.io/badge/-priyank--kumar--singh-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/priyank-kumar-singh-705/)](https://www.linkedin.com/in/priyank-kumar-singh-705/)
[![GitHub priyank-kumar-singh](https://img.shields.io/github/followers/priyank-kumar-singh?label=follow&style=social)](https://github.com/priyank-kumar-singh)
