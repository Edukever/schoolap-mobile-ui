part of '../widget.dart';

class SPCircularProgress extends StatelessWidget {
  const SPCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    return Center(
      child: CircularProgressIndicator(
        color: colors.orange,
        backgroundColor: colors.orangeLight,
      ),
    );
  }
}
