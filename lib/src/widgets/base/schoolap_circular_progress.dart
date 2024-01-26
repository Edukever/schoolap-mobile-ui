part of '../widget.dart';

class SPCircularProgress extends StatelessWidget {
  const SPCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppTheme.of(context).colors.orange,
        backgroundColor: AppTheme.of(context).colors.orangeLight,
      ),
    );
  }
}
