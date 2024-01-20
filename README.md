# Schoolap Design System Package

Ce package sert de système de design pour toutes les applications Schoolap. Il contient des composants réutilisables et des styles prédéfinis pour assurer la cohérence et l'efficacité du développement.

## Installation

Pour installer le package, ajoutez la ligne suivante à votre fichier `pubspec.yaml` :

```yaml
dependencies:
  schoolap_ui: 
    path: https://github.com/Edukever/schoolap-mobile-ui
```

Ensuite, exécutez la commande `flutter pub get` pour télécharger et intégrer le package à votre projet.

## Utilisation

Une fois le package installé, vous pouvez importer les composants du système de design dans vos fichiers Dart comme ceci :

```dart
import 'package:schoolap_ui/schoolap_ui.dart';
```

Le package fournit une variété de composants réutilisables tels que des boutons, des cartes, des champs de saisie, des listes, etc. Vous pouvez les utiliser dans vos widgets Flutter de la même manière que les widgets natifs de Flutter.

Voici la liste des composants disponibles dans le package `schoolap_design_system` :

- `SchoolapTextField`: Un champ de texte personnalisé.
- `SPButtonIcon`: Un bouton personnalisé avec une icône.
- `SPButtonPrimary`: Un bouton principal personnalisé.
- `SPCard`: Une carte personnalisée avec un contenu intégré.
- `SPDropDown`: Une liste déroulante personnalisée pour la sélection d'éléments.
- `SPChip`: Un composant d'étiquette personnalisé pour afficher des informations.
- `SPText`: Un composant de texte personnalisé.
- `StatePrimaryButton`: Une énumération représentant les différents états d'un bouton principal.
- `StateSecondaryButton`: Une énumération représentant les différents états d'un bouton secondaire.
- `SPColorsData`: Un ensemble de couleurs personnalisées utilisées dans le système de conception.
- `SPGradientData`: Un ensemble de dégradés personnalisés utilisés dans le système de conception.


Voici un exemple de l'utilisation du composant `SPButtonPrimary` :

```dart
import 'package:flutter/material.dart';
import 'package:schoolap_ui/src/widgets/base/app_text.dart';
import 'package:schoolap_design_system/schoolap_design_system.dart';

```

## Utilisation du composant `SPButtonPrimary`

Le composant `SPButtonPrimary` est un bouton primaire personnalisable avec des propriétés configurables. Il peut afficher une icône optionnelle positionnée à gauche ou à droite du texte du bouton.

Voici un exemple d'utilisation du composant `SPButtonPrimary` :

```dart
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SPButtonPrimary(
      title: 'Cliquez ici',
      backgroundColor: Colors.blue, // Personnalisez la couleur de fond du bouton
      decorationState: DecorationState.solid, // Personnalisez l'état de décoration du bouton
      height: 50, // Personnalisez la hauteur du bouton
      iconPosition: IconPosition.right, // Positionnez l'icône à droite du texte
      hasIcon: true, // Activez l'affichage de l'icône
      iconOrTextColor: Colors.white, // Personnalisez la couleur de l'icône ou du texte
      onTap: () {
        // Code exécuté lorsque le bouton est cliqué
      },
    );
  }
}
```

Ce code crée un bouton `SPButtonPrimary` avec le texte "Cliquez ici", une couleur de fond bleue, une décoration solide, une hauteur de 50 pixels, une icône positionnée à droite du texte, une icône ou un texte en couleur blanche et une fonction `onTap` qui sera exécutée lorsque le bouton est cliqué.

:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:schoolap_ui/src/utils/custom_tydef.dart';
import 'package:schoolap_design_system/schoolap_design_system.dart';

```

## Utilisation du composant `SPTextField`

Le composant `SPTextField` est un champ de texte personnalisé pour votre application. Il prend en charge différentes fonctionnalités telles que la validation, les icônes préfixes/suffixes, le nombre maximum de lignes, etc.

Voici un exemple d'utilisation du composant `SPTextField` :

```dart
class MyForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          SPTextField(
            name: 'email',
            placeHolder: 'Adresse e-mail',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context),
            ]),
            prefix: Icon(Icons.email),
          ),
          SPTextField(
            name: 'password',
            placeHolder: 'Mot de passe',
            validator: FormBuilderValidators.required(context),
            type: AppTextFieldType.password,
            suffix: Icon(Icons.visibility),
          ),
          SPTextField(
            name: 'date',
            placeHolder: 'Date de naissance',
            validator: FormBuilderValidators.required(context),
            type: AppTextFieldType.date,
            suffix: Icon(Icons.calendar_today),
          ),
        ],
      ),
    );
  }
}
```

Ce code crée un formulaire `FormBuilder` avec trois champs de texte `SPTextField` : un champ pour l'adresse e-mail, un champ pour le mot de passe et un champ pour la date de naissance. Chaque champ de texte est personnalisé avec un nom, un texte d'espace réservé, une fonction de validation et éventuellement des icônes préfixes/suffixes.


```dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:schoolap_ui/src/utils/custom_tydef.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:schoolap_design_system/schoolap_design_system.dart';

```
## Utilisation du composant `SPDropDown`

Le composant `SPDropDown` est une liste déroulante personnalisée pour votre application. Il prend en charge la sélection d'éléments à partir d'une liste prédéfinie.

Voici un exemple d'utilisation du composant `SPDropDown` :

```dart
class MyForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final List<DropdownMenuItem<String>> _dropdownItems = [
    DropdownMenuItem(
      value: 'option1',
      child: Text('Option 1'),
    ),
    DropdownMenuItem(
      value: 'option2',
      child: Text('Option 2'),
    ),
    DropdownMenuItem(
      value: 'option3',
      child: Text('Option 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          SPDropDown<String>(
            name: 'dropdown',
            items: _dropdownItems,
            placeHolder: 'Sélectionnez une option',
            onChanged: (value) {
              // Code exécuté lorsque la valeur de la liste déroulante change
            },
          ),
        ],
      ),
    );
  }
}
```

Ce code crée un formulaire `FormBuilder` avec un composant `SPDropDown`. Le composant `SPDropDown` prend en charge une liste de `DropdownMenuItem` qui représente les options de la liste déroulante. Vous pouvez personnaliser le texte d'espace réservé avec la propriété `placeHolder` et fournir une fonction `onChanged` pour réagir aux changements de sélection.




## Utilisation du composant `SPButtonIcon`

Le composant `SPButtonIcon` est un bouton personnalisé avec une icône. Il prend en charge différentes configurations de forme, de couleur et d'ombre.

Voici un exemple d'utilisation du composant `SPButtonIcon` :

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SPButtonIcon(
      iconData: Icons.date_range,
      formState: StateFormIcon.square,
      filledColors: const Color(0xFF3F97E3),
      hasShadow: true,
      radius: 10.0,
    );
  }
}
```

Ce code crée un bouton `SPButtonIcon` avec une icône `Icons.date_range`. Le bouton est configuré pour avoir une forme carrée (`StateFormIcon.square`), une couleur de remplissage personnalisée (`filledColors`), une ombre (`hasShadow`) et un rayon de bordure de 10.0 pixels (`radius`).


## Utilisation du composant `SPButtonIcon`

Le composant `SPButtonIcon` est un bouton personnalisé avec une icône. Il prend en charge différentes configurations de forme, de couleur et d'ombre.

Voici un exemple d'utilisation du composant `SPButtonIcon` :

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SPButtonIcon(
      iconData: Icons.date_range,
      formState: StateFormIcon.square,
      filledColors: const Color(0xFF3F97E3),
      hasShadow: true,
      radius: 10.0,
    );
  }
}
```

Ce code crée un bouton `SPButtonIcon` avec une icône `Icons.date_range`. Le bouton est configuré pour avoir une forme carrée (`StateFormIcon.square`), une couleur de remplissage personnalisée (`filledColors`), une ombre (`hasShadow`) et un rayon de bordure de 10.0 pixels (`radius`).


## Utilisation du composant `SchoolapCardPresence`

Le composant `SchoolapCardPresence` est une carte personnalisée utilisée pour afficher la présence ou l'absence d'un étudiant. Il prend en charge différents types de présence avec des couleurs de fond et de sous-titre personnalisées.

Voici un exemple d'utilisation du composant `SchoolapCardPresence` :

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SchoolapCardPresence(
      type: SPCardPresenceType.presence,
        title: "Card title",

    );
  }
}
```

Ce code crée une carte `SchoolapCardPresence` avec le type de présence `SPCardPresenceType.presence`. La carte affiche le titre "Présence" avec une couleur de fond et de sous-titre personnalisées correspondant au type de présence.


Assurez-vous d'importer les dépendances nécessaires et de personnaliser les propriétés du bouton en fonction de vos besoins.


Vous pouvez également personnaliser les composants selon vos besoins en utilisant les propriétés disponibles. Consultez la documentation du package pour connaître toutes les options de personnalisation.

## Guidelines de design

Le système de design Schoolap suit les guidelines de design spécifiques à notre marque et à nos applications. Il fournit des conseils sur la typographie, les couleurs, les espacements, les animations et d'autres aspects de l'interface utilisateur. Assurez-vous de consulter la documentation du système de design pour vous familiariser avec ces guidelines et créer des interfaces cohérentes et attrayantes.

## Exemples

Le package Schoolap Design System est livré avec des exemples de code pour vous aider à démarrer rapidement. Vous pouvez les trouver dans le répertoire `examples` du package. Ces exemples illustrent l'utilisation des différents composants et les bonnes pratiques de conception.

## Contribution

Nous encourageons la contribution à l'amélioration du système de design Schoolap. Si vous avez des idées, des suggestions ou des rapports de bugs, n'hésitez pas à les soumettre via notre système de suivi des problèmes sur GitHub. Vos contributions sont les bienvenues !

## Licence

Le package Schoolap Design System est distribué sous la licence MIT. Consultez le fichier `LICENSE` pour plus d'informations.

---

Ceci conclut la documentation du package Schoolap Design System. Nous espérons que ce système de design vous aidera à développer des applications Schoolap cohérentes et de haute qualité. Si vous avez des questions supplémentaires, n'hésitez pas à les poser. Bonne conception et développement !