import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/app_settings_controller.dart';
import 'core/app_settings_scope.dart';
import 'core/localization/app_localizations.dart';
import 'presentation/screens/splash_screen.dart';

void main() {
  final settingsController = AppSettingsController();
  runApp(SkillUpLibyaApp(settingsController: settingsController));
}

class SkillUpLibyaApp extends StatelessWidget {
  const SkillUpLibyaApp({super.key, required this.settingsController});

  final AppSettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, _) {
        return AppSettingsScope(
          controller: settingsController,
          child: MaterialApp(
            title: 'SkillUp Libya',
            debugShowCheckedModeBanner: false,
            locale: settingsController.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: _buildLightTheme(),
            darkTheme: _buildDarkTheme(),
            themeMode: settingsController.themeMode,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }

  ThemeData _buildLightTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF4B2FB9),
      brightness: Brightness.light,
    );
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFF5F6FA),
    );
    return base.copyWith(
      textTheme: GoogleFonts.cairoTextTheme(base.textTheme),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: GoogleFonts.cairo(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: GoogleFonts.cairo(color: colorScheme.onInverseSurface),
        behavior: SnackBarBehavior.floating,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      cardColor: colorScheme.surface,
    );
  }

  ThemeData _buildDarkTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFFB39DDB),
      brightness: Brightness.dark,
    );
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFF0E1117),
    );
    return base.copyWith(
      textTheme: GoogleFonts.cairoTextTheme(base.textTheme).apply(bodyColor: Colors.white, displayColor: Colors.white),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.cairo(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: GoogleFonts.cairo(color: colorScheme.onInverseSurface),
        behavior: SnackBarBehavior.floating,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      cardColor: colorScheme.surface,
    );
  }
}
