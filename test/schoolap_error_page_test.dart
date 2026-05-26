import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

void main() {
  testWidgets('shows configurable title and message', (tester) async {
    await tester.pumpWidget(
      _TestApp(
        child: const SPErrorPage(
          title: 'Page indisponible',
          message: 'Veuillez reessayer.',
          illustration: Icon(Icons.error_outline),
          showExitButton: false,
        ),
      ),
    );

    expect(find.text('Page indisponible'), findsOneWidget);
    expect(find.text('Veuillez reessayer.'), findsOneWidget);
    expect(find.byIcon(Icons.error_outline), findsOneWidget);
  });

  testWidgets('runs custom primary action when provided', (tester) async {
    var wasTapped = false;

    await tester.pumpWidget(
      _TestApp(
        child: SPErrorPage(
          title: 'Session expiree',
          message: 'Reconnectez-vous pour continuer.',
          illustration: const Icon(Icons.lock_outline),
          primaryActionTitle: 'Se reconnecter',
          onPrimaryAction: () {
            wasTapped = true;
          },
        ),
      ),
    );

    await tester.tap(find.text('Se reconnecter'));
    await tester.pump();

    expect(wasTapped, isTrue);
  });

  testWidgets('shows technical error details when enabled', (tester) async {
    final details = FlutterErrorDetails(
      exception: Exception('broken page'),
      library: 'schoolap_test',
      stack: StackTrace.current,
    );

    await tester.pumpWidget(
      _TestApp(
        child: SPErrorPage(
          details: details,
          illustration: const Icon(Icons.bug_report_outlined),
          showTechnicalDetails: true,
          showExitButton: false,
        ),
      ),
    );

    expect(find.textContaining('broken page'), findsOneWidget);
    expect(find.text('schoolap_test'), findsOneWidget);
    expect(
        find.textContaining('schoolap_error_page_test.dart'), findsOneWidget);
  });

  testWidgets('uses the default back action when the route can pop',
      (tester) async {
    await tester.pumpWidget(
      _TestApp(
        child: Scaffold(
          body: Builder(
            builder: (context) {
              return SPButtonPrimary(
                title: 'Open error',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const SPErrorPage(
                        illustration: Icon(Icons.error_outline),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open error'));
    await tester.pumpAndSettle();

    expect(find.byType(SPErrorPage), findsOneWidget);

    await tester.tap(find.text('Retour à la page précédente'));
    await tester.pumpAndSettle();

    expect(find.byType(SPErrorPage), findsNothing);
    expect(find.text('Open error'), findsOneWidget);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: AppThemeData.defaultThemeData(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: AppMaterialTheme.defaultTheme(AppTheme.of(context).colors),
            home: child,
          );
        },
      ),
    );
  }
}
