part of "../themes/theme.dart";

class _TextTheme {
  static TextTheme get textThemeLight {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        color: AppColors.titleColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        color: AppColors.titleColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontSize: 26,
        color: AppColors.titleColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: AppColors.titleColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: AppColors.titleColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.titleColor,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.titleColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: AppColors.titleColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
    );
  }

  static TextTheme get textThemeDar {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        color: AppColors.darkTitle,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        color: AppColors.darkTitle,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontSize: 26,
        color: AppColors.darkTitle,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: AppColors.darkTitle,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: AppColors.darkTitle,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.darkTitle,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.darkTitle,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: AppColors.darkTitle,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
      ),
    );
  }
}
