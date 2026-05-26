import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

import '../widgets/code_preview.dart';

class PageFieldScreen extends StatelessWidget {
  const PageFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Scaffold(
      appBar: AppBar(title: const SPText('Champs & Dropdowns')),
      body: FormBuilder(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(theme.spacing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── SPTextField ───────────────────────────────────────────────
              _Section(label: 'SPTextField — texte', children: [
                CodePreview(
                  code: '''
SPTextField(
  name: 'name',
  placeHolder: 'Entrez votre nom',
  label: 'Nom',
)''',
                  child: const SPTextField(
                    name: 'name',
                    placeHolder: 'Entrez votre nom',
                    label: 'Nom',
                  ),
                ),
                CodePreview(
                  code: '''
SPTextField(
  name: 'icon',
  placeHolder: 'Rechercher...',
  label: 'Avec icône',
  prefix: Icon(Icons.search),
)''',
                  child: const SPTextField(
                    name: 'icon',
                    placeHolder: 'Rechercher...',
                    label: 'Avec icône',
                    prefix: Icon(Icons.search),
                  ),
                ),
                CodePreview(
                  code: '''
SPTextField(
  name: 'comment',
  placeHolder: 'Votre commentaire...',
  label: 'Zone de texte',
  maxLines: 4,
)''',
                  child: const SPTextField(
                    name: 'comment',
                    placeHolder: 'Votre commentaire...',
                    label: 'Zone de texte',
                    maxLines: 4,
                  ),
                ),
              ]),
              SizedBox(height: theme.spacing.large),

              _Section(label: 'SPTextField — mot de passe', children: [
                CodePreview(
                  code: '''
SPTextField(
  name: 'password',
  placeHolder: '••••••••',
  label: 'Mot de passe',
  type: SPTextFieldType.password,
  obscureText: true,
)''',
                  child: const SPTextField(
                    name: 'password',
                    placeHolder: '••••••••',
                    label: 'Mot de passe',
                    type: SPTextFieldType.password,
                    obscureText: true,
                  ),
                ),
              ]),
              SizedBox(height: theme.spacing.large),

              // ── SPDateTimeField ───────────────────────────────────────────
              _Section(label: 'SPDateTimeField — date', children: [
                CodePreview(
                  code: '''
SPDateTimeField(
  name: 'date',
  placeHolder: 'JJ/MM/AAAA',
  label: 'Date de naissance',
  inputType: InputType.date,
)''',
                  child: const SPDateTimeField(
                    name: 'date',
                    placeHolder: 'JJ/MM/AAAA',
                    label: 'Date de naissance',
                    inputType: InputType.date,
                  ),
                ),
                CodePreview(
                  code: '''
SPDateTimeField(
  name: 'datetime',
  placeHolder: 'Date et heure',
  label: 'Rendez-vous',
  inputType: InputType.both,
)''',
                  child: const SPDateTimeField(
                    name: 'datetime',
                    placeHolder: 'Date et heure',
                    label: 'Rendez-vous',
                    inputType: InputType.both,
                  ),
                ),
              ]),
              SizedBox(height: theme.spacing.large),

              _Section(label: 'SPDateFieldRanger — plage de dates', children: [
                CodePreview(
                  code: '''
SPDateFieldRanger(
  name: 'range',
  placeHolder: 'Sélectionner une période',
  label: 'Période',
  firstDate: DateTime(2020),
)''',
                  child: SPDateFieldRanger(
                    name: 'range',
                    placeHolder: 'Sélectionner une période',
                    label: 'Période',
                    firstDate: DateTime(2020),
                  ),
                ),
              ]),
              SizedBox(height: theme.spacing.large),

              // ── Dropdowns ─────────────────────────────────────────────────
              _Section(label: 'SPDropDownStyled', children: [
                CodePreview(
                  code: '''
SPDropDownStyled<String, String>(
  name: 'classe',
  items: ['6ème A', '5ème B', '4ème C', '3ème D'],
  getName: (e) => e,
  getValue: (e) => e,
  placeHolder: 'Choisir une classe',
  label: 'Classe',
)''',
                  child: SPDropDownStyled<String, String>(
                    name: 'classe',
                    items: const ['6ème A', '5ème B', '4ème C', '3ème D'],
                    getName: (e) => e,
                    getValue: (e) => e,
                    placeHolder: 'Choisir une classe',
                    label: 'Classe',
                  ),
                ),
                CodePreview(
                  code: '''
SPDropDownStyled<String, String>(
  name: 'matiere',
  items: ['Mathématiques', 'Français', 'Histoire', 'Sciences'],
  getName: (e) => e,
  getValue: (e) => e,
  placeHolder: 'Choisir une matière',
  label: 'Matière',
  prefix: Icon(Icons.book_outlined, size: 18),
)''',
                  child: SPDropDownStyled<String, String>(
                    name: 'matiere',
                    items: const ['Mathématiques', 'Français', 'Histoire', 'Sciences'],
                    getName: (e) => e,
                    getValue: (e) => e,
                    placeHolder: 'Choisir une matière',
                    label: 'Matière',
                    prefix: const Icon(Icons.book_outlined, size: 18),
                  ),
                ),
              ]),
              SizedBox(height: theme.spacing.large),

              _Section(label: 'SPPresenceDropdown — présence booléenne', children: [
                CodePreview(
                  code: "SPPresenceDropdown(name: 'presence')",
                  child: const SPPresenceDropdown(name: 'presence'),
                ),
              ]),
              SizedBox(height: theme.spacing.large),

              // ── Sélections ────────────────────────────────────────────────
              _Section(label: 'SPCheckBox — case à cocher', children: [
                CodePreview(
                  code: '''
SPCheckBox(
  name: 'remember',
  title: Text("Se souvenir de moi"),
)''',
                  child: const SPCheckBox(
                    name: 'remember',
                    title: Text('Se souvenir de moi'),
                  ),
                ),
              ]),
              SizedBox(height: theme.spacing.large),

              _Section(label: 'SPCheckBoxGroup — groupe de cases', children: [
                CodePreview(
                  code: '''
SPCheckBoxGroup<int>(
  name: 'jours',
  label: 'Jours de cours',
  options: [
    FormBuilderFieldOption(value: 1, child: Text('Lun')),
    FormBuilderFieldOption(value: 2, child: Text('Mar')),
    FormBuilderFieldOption(value: 3, child: Text('Mer')),
    FormBuilderFieldOption(value: 4, child: Text('Jeu')),
    FormBuilderFieldOption(value: 5, child: Text('Ven')),
  ],
)''',
                  child: SPCheckBoxGroup<int>(
                    name: 'jours',
                    label: 'Jours de cours',
                    options: const [
                      FormBuilderFieldOption(value: 1, child: Text('Lun')),
                      FormBuilderFieldOption(value: 2, child: Text('Mar')),
                      FormBuilderFieldOption(value: 3, child: Text('Mer')),
                      FormBuilderFieldOption(value: 4, child: Text('Jeu')),
                      FormBuilderFieldOption(value: 5, child: Text('Ven')),
                    ],
                  ),
                ),
              ]),
              SizedBox(height: theme.spacing.large),

              _Section(label: 'SPRadio — boutons radio', children: [
                CodePreview(
                  code: '''
SPRadio<String>(
  name: 'genre',
  label: 'Genre',
  options: [
    FormBuilderFieldOption(value: 'M', child: Text('Masculin')),
    FormBuilderFieldOption(value: 'F', child: Text('Féminin')),
  ],
)''',
                  child: SPRadio<String>(
                    name: 'genre',
                    label: 'Genre',
                    options: const [
                      FormBuilderFieldOption(value: 'M', child: Text('Masculin')),
                      FormBuilderFieldOption(value: 'F', child: Text('Féminin')),
                    ],
                  ),
                ),
              ]),
              SizedBox(height: theme.spacing.extraLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.label, required this.children});

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SPText.label(
          label.toUpperCase(),
          style: TextStyle(color: theme.colors.gray2, letterSpacing: 1.1),
        ),
        SizedBox(height: theme.spacing.small),
        ...children.expand(
          (child) => [child, SizedBox(height: theme.spacing.small)],
        ),
      ],
    );
  }
}
