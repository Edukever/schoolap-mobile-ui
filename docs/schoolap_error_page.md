# SPErrorPage

`SPErrorPage` is the shared Schoolap error screen. It can be used as a Flutter
error fallback or as a generic page for failed states in apps that consume
`schoolap_ui`.

## Basic Usage

```dart
SPErrorPage(
  title: 'Page indisponible',
  message: 'Veuillez reessayer dans quelques instants.',
)
```

The widget includes the Schoolap error animation, centered title and message,
and a default action. If the current route can pop, the button returns to the
previous page. On Android, when there is no previous route, the button exits the
app.

## Flutter Error Fallback

```dart
FlutterError.onError = (FlutterErrorDetails details) {
  FlutterError.presentError(details);
};

MaterialApp(
  builder: (context, child) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return SPErrorPage(details: details);
    };

    return child ?? const SizedBox.shrink();
  },
)
```

By default, `SPErrorPage` shows technical details only outside release builds.
In release builds, users see the public message.

## Custom Action

Use `primaryActionTitle` and `onPrimaryAction` when an app needs a project
specific recovery path, such as returning to a dashboard or retrying a request.

```dart
SPErrorPage(
  title: 'Session expiree',
  message: 'Reconnectez-vous pour continuer.',
  primaryActionTitle: 'Se reconnecter',
  onPrimaryAction: () {
    // Navigate to the login flow.
  },
)
```

## Custom Illustration

Projects can replace the default Lottie animation with any widget.

```dart
SPErrorPage(
  illustration: Icon(
    Icons.cloud_off,
    size: 96,
    color: Colors.blue,
  ),
)
```

If you want to keep Lottie but use another asset, set `animationAsset` and
`animationPackage`.

```dart
SPErrorPage(
  animationAsset: 'assets/lottiefiles/network_error.json',
  animationPackage: 'my_app',
)
```

## Configuration

| Property | Purpose |
| --- | --- |
| `details` | Optional `FlutterErrorDetails` displayed when technical details are enabled. |
| `title` | Main title shown to the user. |
| `message` | Public message shown when technical details are hidden. |
| `illustration` | Overrides the default animation with a custom widget. |
| `animationAsset` | Lottie asset path to load when `illustration` is not provided. |
| `animationPackage` | Package that owns the Lottie asset. Defaults to `schoolap_ui`. |
| `primaryActionTitle` | Label for a custom action button. |
| `onPrimaryAction` | Callback for the custom action button. |
| `backButtonTitle` | Label for the default back button. |
| `exitButtonTitle` | Label for the Android exit button. |
| `showExitButton` | Enables the Android exit action when no route can pop. |
| `showTechnicalDetails` | Controls whether exception, library, and stack details are shown. |
| `padding` | Overrides the page padding. |
| `titleColor` | Overrides the title color. |
| `actionColor` | Overrides the action button color. |

## Widget Preview

Flutter's Widget Previewer is available in Flutter 3.35 or newer. The preview
examples for this package live in `example/lib/previews/`.

Start the previewer from the example app:

```sh
cd example
flutter widget-preview start
```

Open `example/lib/previews/schoolap_error_page_preview.dart` in your IDE to see
the `SPErrorPage` preview entries.
