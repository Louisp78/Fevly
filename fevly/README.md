# fevly

A new Flutter project.

## Architecture
- asset
- lib
    - components                            *Dossier des Widgets qu’on retrouve dans au moins 2 écrans*
    - screens                               *Dossier des écrans*
        - login                             *Ecran exemple*
            - login_screen.dart             *Fichier principal (appel du Scaffold)*
            - components
                - body.dart                 *Fichier contenant le body du Scaffold de login_screen.dart*
                - example_components.dart
    - constant.dart
    - styles
        - colors.dart           *Definitions des couleurs*
        - effects.dart          *Definition des ombres*
        - theme.dart            *Definition du ThemeData*
    - services                  *Dossier de Firebase*
        - auth.dart
        - database.dart
        - ...
    - models                    *Definition de toutes les classes des Objects*
        - object_1.dart
        - object_2.dart
        - ...
    - main.dart
    - routes.dart               *Definition de toute les navigations entre les pages et des chemins des pages (exemple : “/home”)*


## Documentations & Links
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
