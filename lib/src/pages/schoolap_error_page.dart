import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class SPErrorPage extends StatelessWidget {
  final FlutterErrorDetails details;

  const SPErrorPage({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppTheme.of(context).spacing.big),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('packages/schoolap_ui/assets/lottiefiles/error.json'),
            const SizedBox(height: 20.0),
            SPText.title1(
              'Il y a erreur!',
              color: AppTheme.of(context).colors.bleu,
            ),
            const SizedBox(height: 20.0),
            if (kReleaseMode)
              const SPText.paragraph1(
                'Nous sommes navré, il y a une erreur dans la page que vous recherchez.',
                textAlign: TextAlign.center,
              )
            else ...[
              SPText.paragraph1(details.exception.toString()),
              const SizedBox(height: 20.0),
              SPText.paragraph1(details.library.toString()),
              const SizedBox(height: 20.0),
              SPText.paragraph1(details.stack.toString())
            ],
            const SizedBox(height: 20.0),
            if (Navigator.of(context).canPop())
              SPButtonPrimary(
                title: 'Retour à la page précédente',
                backgroundColor: AppTheme.of(context).colors.bleu,
                onTap: () => Navigator.of(context).pop(),
              ),
            const SizedBox(height: 20),
            SPButtonPrimary(
              title: 'Page d\'accueil',
              decorationState: DecorationState.outline,
              iconOrTextColor: AppTheme.of(context).colors.bleu,
              outlineBorderColor: AppTheme.of(context).colors.bleu,
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
