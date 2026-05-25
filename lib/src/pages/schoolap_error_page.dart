import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class SPErrorPage extends StatelessWidget {
  const SPErrorPage({
    super.key,
    this.details,
    this.title = 'Il y a erreur!',
    this.message =
        'Nous sommes navré, il y a une erreur dans la page que vous recherchez.',
    this.illustration,
    this.animationAsset = 'assets/lottiefiles/error.json',
    this.animationPackage = 'schoolap_ui',
    this.primaryActionTitle,
    this.onPrimaryAction,
    this.backButtonTitle = 'Retour à la page précédente',
    this.exitButtonTitle = 'Sortir',
    this.showExitButton = true,
    this.showTechnicalDetails = !kReleaseMode,
    this.padding,
    this.titleColor,
    this.actionColor,
  });

  final FlutterErrorDetails? details;
  final String title;
  final String message;
  final Widget? illustration;
  final String animationAsset;
  final String? animationPackage;
  final String? primaryActionTitle;
  final VoidCallback? onPrimaryAction;
  final String backButtonTitle;
  final String exitButtonTitle;
  final bool showExitButton;
  final bool showTechnicalDetails;
  final EdgeInsetsGeometry? padding;
  final Color? titleColor;
  final Color? actionColor;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final resolvedActionColor = actionColor ?? theme.colors.bleu;
    final resolvedTitleColor = titleColor ?? theme.colors.bleu;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: padding ?? EdgeInsets.all(theme.spacing.big),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 260),
                          child: illustration ??
                              Lottie.asset(
                                animationAsset,
                                package: animationPackage,
                              ),
                        ),
                        const SizedBox(height: 20.0),
                        SPText.title1(
                          title,
                          color: resolvedTitleColor,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20.0),
                        _ErrorMessage(
                          details: details,
                          message: message,
                          showTechnicalDetails:
                              showTechnicalDetails && details != null,
                        ),
                        const SizedBox(height: 20.0),
                        _ErrorAction(
                          actionColor: resolvedActionColor,
                          backButtonTitle: backButtonTitle,
                          exitButtonTitle: exitButtonTitle,
                          onPrimaryAction: onPrimaryAction,
                          primaryActionTitle: primaryActionTitle,
                          showExitButton: showExitButton,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({
    required this.details,
    required this.message,
    required this.showTechnicalDetails,
  });

  final FlutterErrorDetails? details;
  final String message;
  final bool showTechnicalDetails;

  @override
  Widget build(BuildContext context) {
    final errorDetails = details;

    if (!showTechnicalDetails || errorDetails == null) {
      return SPText.paragraph1(
        message,
        textAlign: TextAlign.center,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SPText.paragraph1(errorDetails.exception.toString()),
        const SizedBox(height: 20.0),
        SPText.paragraph1(errorDetails.library.toString()),
        const SizedBox(height: 20.0),
        SPText.paragraph1(errorDetails.stack.toString()),
      ],
    );
  }
}

class _ErrorAction extends StatelessWidget {
  const _ErrorAction({
    required this.actionColor,
    required this.backButtonTitle,
    required this.exitButtonTitle,
    required this.onPrimaryAction,
    required this.primaryActionTitle,
    required this.showExitButton,
  });

  final Color actionColor;
  final String backButtonTitle;
  final String exitButtonTitle;
  final VoidCallback? onPrimaryAction;
  final String? primaryActionTitle;
  final bool showExitButton;

  @override
  Widget build(BuildContext context) {
    if (onPrimaryAction != null && primaryActionTitle != null) {
      return SPButtonPrimary(
        title: primaryActionTitle!,
        backgroundColor: actionColor,
        onTap: onPrimaryAction,
      );
    }

    if (Navigator.of(context).canPop()) {
      return SPButtonPrimary(
        title: backButtonTitle,
        backgroundColor: actionColor,
        onTap: () => Navigator.of(context).pop(),
      );
    }

    if (showExitButton && defaultTargetPlatform == TargetPlatform.android) {
      return SPButtonPrimary(
        title: exitButtonTitle,
        backgroundColor: actionColor,
        onTap: () => SystemNavigator.pop(),
      );
    }

    return const SizedBox.shrink();
  }
}
