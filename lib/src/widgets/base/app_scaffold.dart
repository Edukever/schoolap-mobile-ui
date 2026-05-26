part of '../widget.dart';

class SPScaffold extends StatelessWidget {
  const SPScaffold({
    super.key,
    this.landscapeAppBar,
    this.portraitAppBar,
    this.landscapeBody,
    this.portraitBody,
    this.endDrawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  final PreferredSizeWidget? landscapeAppBar;
  final PreferredSizeWidget? portraitAppBar;
  final Widget? landscapeBody;
  final Widget? portraitBody;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;
        return Scaffold(
          appBar: isLandscape ? landscapeAppBar : portraitAppBar,
          body: isLandscape ? landscapeBody : portraitBody,
          endDrawer: endDrawer,
          bottomNavigationBar: isLandscape ? null : bottomNavigationBar,
          floatingActionButton: floatingActionButton,
        );
      },
    );
  }
}
