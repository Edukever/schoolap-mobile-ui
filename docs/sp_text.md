# SPText

`SPText` is the standard text widget for Schoolap apps. It wraps Flutter's
`AutoSizeText` and binds every variant to a token from `AppTypographyData`,
so font sizes, weights, and the Poppins font family stay consistent across
all apps without hard-coding values.

## Type scale

| Constructor | Size (regular) | Size (small) | Weight | Intended use |
|---|---:|---:|---|---|
| `SPText.title1` | 28 | 20 | Bold | Page / hero titles |
| `SPText.title2` | 18 | 14 | Bold | Section headings |
| `SPText.title3` | 14 | 12 | Bold | Card titles, sub-sections |
| `SPText.label` | 11 | 9 | w500 | Chips, badges, form labels |
| `SPText.paragraph1` | 12 | 10 | w400 | Body / primary content |
| `SPText.paragraph2` | 10 | 9 | w400 | Secondary / helper text |

Sizes come from the active `AppTypographyData` variant (`regular` by default,
`small` on compact screens). Never hard-code a font size — pass `style` only
when you need a one-off override.

## Usage

### Named constructors (recommended)

```dart
SPText.title1('Bienvenue')
SPText.title2('Résultats du trimestre')
SPText.title3('Notes')
SPText.label('Nouveau')
SPText.paragraph1('Cet élève est présent depuis le début du trimestre.')
SPText.paragraph2('Dernière mise à jour : 24 mai 2026')
```

### Default constructor with explicit level

```dart
SPText('Some text', level: AppTextLevel.paragraph1)
```

## Style overrides

Pass `style` — exactly like Flutter's `Text` widget — to merge overrides on
top of the theme token. Only set the properties you want to change; everything
else stays from the token.

```dart
// Different color
SPText.title1(
  'Erreur',
  style: TextStyle(color: theme.colors.red),
)

// Italic body copy
SPText.paragraph1(
  'Remarque : ce champ est obligatoire.',
  style: const TextStyle(fontStyle: FontStyle.italic),
)

// Larger label (one-off badge)
SPText.label(
  'NOUVEAU',
  style: const TextStyle(fontSize: 13, letterSpacing: 1.2),
)
```

## All parameters

`SPText` exposes the same layout parameters as Flutter's `Text` widget, plus
`minFontSize` from `AutoSizeText`.

| Parameter | Type | Default | Notes |
|---|---|---|---|
| `style` | `TextStyle?` | — | Merged over the theme token |
| `textAlign` | `TextAlign?` | — | |
| `textDirection` | `TextDirection?` | — | |
| `locale` | `Locale?` | — | |
| `softWrap` | `bool?` | — | |
| `overflow` | `TextOverflow?` | — | |
| `maxLines` | `int?` | — | |
| `semanticsLabel` | `String?` | — | Accessibility label |
| `strutStyle` | `StrutStyle?` | — | |
| `minFontSize` | `double` | `10.0` | AutoSizeText floor |

## Default color

When `style.color` is not set, `SPText` falls back to `AppTheme.of(context).colors.black`.
Pass an explicit `TextStyle(color: ...)` to override.

## Accessing tokens directly

If you need the raw `TextStyle` (e.g. for an `InputDecoration`), read it from
the theme:

```dart
final typo = AppTheme.of(context).typography;

InputDecoration(
  hintStyle: typo.paragraph1.copyWith(color: Colors.grey),
  labelStyle: typo.label,
)
```

## Theming

The active token set is determined by the `AppTypographyData` passed to
`AppTheme`. The package ships two presets:

```dart
AppTypographyData.regular() // default — for standard screens
AppTypographyData.small()   // compact variant — for dense/tablet layouts
```

Pass a custom `AppTypographyData` instance to `AppThemeData` to override tokens:

```dart
AppThemeData(
  typography: const AppTypographyData(
    title1: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, fontFamily: 'Poppins', package: 'schoolap_ui'),
    title2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins', package: 'schoolap_ui'),
    title3: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Poppins', package: 'schoolap_ui'),
    label:  TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Poppins', package: 'schoolap_ui'),
    paragraph1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Poppins', package: 'schoolap_ui'),
    paragraph2: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, fontFamily: 'Poppins', package: 'schoolap_ui'),
  ),
  // ...
)
```
