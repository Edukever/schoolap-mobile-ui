part of '../widget.dart';

class SPScaffold extends StatefulWidget {
  final PreferredSizeWidget? landScapeAppBar;
  final PreferredSizeWidget? portraitAppBar;
  final Widget? landScapeBody;
  final Widget? portraitBody;

  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const SPScaffold(
      {Key? key,
      this.landScapeAppBar,
      this.portraitAppBar,
      this.landScapeBody,
      this.portraitBody,
      this.endDrawer,
      this.bottomNavigationBar,
      this.floatingActionButton,
      s})
      : super(key: key);

  @override
  State<SPScaffold> createState() => _SPScaffoldState();
}

class _SPScaffoldState extends State<SPScaffold> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;
        return Scaffold(
          appBar: isLandscape ? widget.landScapeAppBar : widget.portraitAppBar,
          body: isLandscape ? widget.landScapeBody : widget.portraitBody,
          endDrawer: widget.endDrawer,
          bottomNavigationBar: isLandscape ? null : widget.bottomNavigationBar,
          floatingActionButton: widget.floatingActionButton,
        );
      },
    );
  }
}
