import 'package:flutter/material.dart';

import 'models/user_role.dart';

class AppSettingsController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale('ar', 'LY');
  UserRole _userRole = UserRole.student;

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  UserRole get userRole => _userRole;

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isStudentRole => _userRole == UserRole.student;
  bool get isCoachRole => _userRole == UserRole.coach;
  bool get isSupervisorRole => _userRole == UserRole.supervisor;
  bool get isEmployeeRole => _userRole == UserRole.employee;

  void toggleDarkMode(bool isEnabled) {
    final nextMode = isEnabled ? ThemeMode.dark : ThemeMode.light;
    if (nextMode == _themeMode) return;
    _themeMode = nextMode;
    notifyListeners();
  }

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void setUserRole(UserRole role) {
    if (_userRole == role) return;
    _userRole = role;
    notifyListeners();
  }
}
