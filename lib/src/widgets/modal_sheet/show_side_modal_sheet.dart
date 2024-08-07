part of '../widget.dart';

Future<T?> showModalSideSheet<T extends Object?>({
  required BuildContext context,
  required Widget body,
  bool barrierDismissible = false,
  Color barrierColor = const Color(0x3341A3DF),
  double? width = 400,
  double height = 500,
  double elevation = 8.0,
  Duration transitionDuration = const Duration(milliseconds: 300),
  String? barrierLabel = "Side Sheet",
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  bool withCloseControl = true,
  Widget? closeControl,
}) {
  var of = MediaQuery.of(context);
  var platform = Theme.of(context).platform;
  if (width == null) {
    if (platform == TargetPlatform.android || platform == TargetPlatform.iOS) {
      width = of.size.width * 0.6;
    } else {
      width = of.size.width / 4;
    }
  }

  assert(!barrierDismissible || barrierLabel != null);
  return showGeneralDialog(
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    transitionDuration: transitionDuration,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    context: context,
    pageBuilder: (BuildContext context, _, __) {
      return SafeArea(
        child: Align(
          alignment: Alignment.centerRight,
          child: Material(
            elevation: elevation,
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: true, // Important for keyboard handling
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (withCloseControl)
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: closeControl ??
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppTheme.of(context).colors.grid2,
                                    child: const Icon(
                                      Icons.close,
                                      size: 15,
                                    ),
                                  ),
                            ),
                          ),
                        body,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, animation, __, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
        child: child,
      );
    },
  );
}
