# Fevly - a party app

## Pour commencer 
Ajouter le fichier généré par Firebase `lib/firebase_options.dart`.  
Pour installer les dépendances :  
```bash
cd fevly &&
flutter pub get
```

## :rocket: Architecture
- asset
- lib
    - components                            *🚩Dossier des Widgets communs*
    - screens                               *🚩Dossier des écrans*
        - login                             *🚩Ecran exemple*
            - screen.dart                   *🚩Fichier principal*
            - components
                - body.dart                 *🚩Fichier du contenu de l'écran*
                - example_components.dart
    - constant.dart
    - styles
        - colors.dart           *🚩Définitions des couleurs*
        - effects.dart          *🚩Définition des ombres*
        - theme.dart            *🚩Définition du ThemeData*
    - services                  *🚩Dossier de Firebase*
        - auth.dart
        - database.dart
        - ...
    - models                    *🚩Définition de toutes les classes des Objects*
        - object_1.dart
        - object_2.dart
        - ...
    - main.dart
    - routes.dart               *🚩Définition de toutes les navigations entre les pages et des chemins des pages (exemple : “/home”)*


## :clipboard: Dev Rules
1. Toujours utiliser un dossier appelé "components" pour séparer le code en différents fichiers.
2. Créer une classe lorsque deux variables d'un widget sont liées. 
3. Utiliser le constructeur avec Action si nécessaire (voir exemple). 
4. Respecter l'architecture. 
5. Toujours utiliser des routes nommées pour la navigation entre les pages. 
6. Utiliser les commentaires "///" devant un widget ou une fonction pour les rendre visibles dans la documentation (les autres commentaires sont "//").

## Documentations & Links
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### :fire: Firebase
https://www.youtube.com/watch?v=wUSkeTaBonA