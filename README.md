# Schoolap Design System Package

Ce package sert de système de design pour toutes les applications Schoolap. Il contient des composants réutilisables et des styles prédéfinis pour assurer la cohérence et l'efficacité du développement.

## Installation

Pour installer le package, ajoutez la ligne suivante à votre fichier `pubspec.yaml` :

```yaml
dependencies:
  schoolap_pkg: 
    path: https://github.com/Edukever/schoolap-mobile-pkg
```

Ensuite, exécutez la commande `flutter pub get` pour télécharger et intégrer le package à votre projet.

## Utilisation

Une fois le package installé, vous pouvez importer les composants du système de design dans vos fichiers Dart comme ceci :

```dart
import 'package:schoolap_pkg/schoolap_pkg.dart';
```

Le package fournit une variété de composants réutilisables tels que des boutons, des cartes, des champs de saisie, des listes, etc. Vous pouvez les utiliser dans vos widgets Flutter de la même manière que les widgets natifs de Flutter.

Voici un exemple de l'utilisation du composant `SchoolAppPrimaryButton` :

```dart
import 'package:flutter/material.dart';
import 'package:schoolap_pkg/src/widgets/base/app_text.dart';
import 'package:schoolap_design_system/schoolap_design_system.dart';

```

## Utilisation du composant `SchoolAppPrimaryButton`

Le composant `SchoolAppPrimaryButton` est un bouton primaire personnalisable avec des propriétés configurables. Il peut afficher une icône optionnelle positionnée à gauche ou à droite du texte du bouton.

Voici un exemple d'utilisation du composant `SchoolAppPrimaryButton` :

```dart
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SchoolAppPrimaryButton(
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

Ce code crée un bouton `SchoolAppPrimaryButton` avec le texte "Cliquez ici", une couleur de fond bleue, une décoration solide, une hauteur de 50 pixels, une icône positionnée à droite du texte, une icône ou un texte en couleur blanche et une fonction `onTap` qui sera exécutée lorsque le bouton est cliqué.

Bien sûr ! Voici comment vous pouvez ajouter l'utilisation du composant `SchoolAppTextField` dans votre documentation :

```dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:schoolap_pkg/src/utils/custom_tydef.dart';
import 'package:schoolap_design_system/schoolap_design_system.dart';

```

## Utilisation du composant `SchoolAppTextField`

Le composant `SchoolAppTextField` est un champ de texte personnalisé pour votre application. Il prend en charge différentes fonctionnalités telles que la validation, les icônes préfixes/suffixes, le nombre maximum de lignes, etc.

Voici un exemple d'utilisation du composant `SchoolAppTextField` :

```dart
class MyForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          SchoolAppTextField(
            name: 'email',
            placeHolder: 'Adresse e-mail',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context),
            ]),
            prefix: Icon(Icons.email),
          ),
          SchoolAppTextField(
            name: 'password',
            placeHolder: 'Mot de passe',
            validator: FormBuilderValidators.required(context),
            type: AppTextFieldType.password,
            suffix: Icon(Icons.visibility),
          ),
          SchoolAppTextField(
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

Ce code crée un formulaire `FormBuilder` avec trois champs de texte `SchoolAppTextField` : un champ pour l'adresse e-mail, un champ pour le mot de passe et un champ pour la date de naissance. Chaque champ de texte est personnalisé avec un nom, un texte d'espace réservé, une fonction de validation et éventuellement des icônes préfixes/suffixes.



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