# Application Title Here

Add Introduction Here

If you're reading this you probably wanna see a live version of the application. Just [click-here...](link_here/)

## Test Locally
I have used only [flutter_gen](https://pub.dev/packages/flutter_gen) package as an additional dependency which may require you to setup some things. This package generates assets, so I won't make any mistakes typing their absolute paths to the assets directory. Its pretty easy to install [flutter_gen](https://pub.dev/packages/flutter_gen) package, just follow their installation docs.

Environment Details-
1. Windows 11
2. SDK '>=2.16.0-134.5.beta <3.0.0'
3. Flutter version 2.10.0-0.3.pre
4. Dart version 2.16.0 (build 2.16.0-134.5.beta)

If you're adding new assets you may want to generate asset classes for those assets like I did with flutter_gen package, just run following command from the root directory of the application.
```
flutter packages pub run build_runner build
```

## Internalization
This application can support multiple languages, but for now it supports only english. All application resource bundle files are placed inside *assets/l10n* folder.

**Note:** Using VSCode and seeing linter errors for AppLocalizations? I faced this issue as well, just make sure you have ran <code>flutter pub get</code> command once, now either restart your *editor* or *restart dart analysis server* from command palette, and you're good to go.

## Platforms
I have successfully tested the application for the following platforms.

1. &nbsp;Android 10 and 11
2. &nbsp;Web - Edge, Chrome and Brave
3. &nbsp;Desktop - Windows

## References-
Architectural Design: [github.com/priyank-kumar-singh/flutter-app-template](https://github.com/priyank-kumar-singh/flutter-app-template) <br><br>

## Find me around web: <img align="left" src="https://raw.githubusercontent.com/priyank-kumar-singh/priyank-kumar-singh/main/assets/hacker.png" height="150" width="150"/>

- Sharing amazing articles on <a href="https://priyank-kumar-singh.medium.com/">Medium</a> 📰
- Sharing updates on <a href="https://www.linkedin.com/in/priyank-kumar-singh-705/">LinkedIn</a> 💼

[![Twitter: PRIYANKKUMARS18](https://img.shields.io/twitter/follow/PRIYANKKUMARS18?style=social)](https://twitter.com/priyankkumars18)
[![Linkedin: Priyank](https://img.shields.io/badge/-priyank--kumar--singh-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/priyank-kumar-singh-705/)](https://www.linkedin.com/in/priyank-kumar-singh-705/)
[![GitHub priyank-kumar-singh](https://img.shields.io/github/followers/priyank-kumar-singh?label=follow&style=social)](https://github.com/priyank-kumar-singh)
