import '../localization/app_localizations.dart';

enum UserRole {
  student,
  coach,
  supervisor,
  employee,
}

extension UserRoleX on UserRole {
  String localizedLabel(AppLocalizations loc) {
    switch (this) {
      case UserRole.student:
        return loc.t('user_role_student');
      case UserRole.coach:
        return loc.t('user_role_coach');
      case UserRole.supervisor:
        return loc.t('user_role_supervisor');
      case UserRole.employee:
        return loc.t('user_role_employee');
    }
  }
}
