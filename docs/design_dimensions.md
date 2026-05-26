# Design Dimensions

These dimensions are the shared shape tokens for Schoolap apps. Use them through
`AppTheme.of(context).radius` instead of hard-coded `BorderRadius.circular(...)`
values.

## Radius Scale

| Token | Value | Use |
| --- | ---: | --- |
| `none` | `0` | Flush containers and square edges. |
| `extraSmall` | `4` | Compact chips, badges, and dense labels. |
| `small` | `8` | Default cards, menu items, pagination items, and compact controls. |
| `medium` | `10` | Form fields, primary buttons, icon buttons, and standard controls. |
| `large` | `14` | Dropdown menus and larger input surfaces. |
| `extraLarge` | `20` | Modal sheets and large panels. |
| `full` | `30` | App bars, pill-like surfaces, and strongly rounded containers. |

## Usage

```dart
final radius = AppTheme.of(context).radius;

Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(radius.medium),
  ),
)
```

For APIs that need a `BorderRadius`, use `asBorderRadius()`:

```dart
final borderRadius = AppTheme.of(context).radius.asBorderRadius();

Container(
  decoration: BoxDecoration(
    borderRadius: borderRadius.small,
  ),
)
```

## Compatibility

The older radius names are still available but deprecated:

| Deprecated | Replacement |
| --- | --- |
| `regular` | `medium` |
| `big` | `full` |

Do not introduce one-off radius values in app code unless the design system adds
a token for that size first.
