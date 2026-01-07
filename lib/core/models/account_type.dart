import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';

enum AccountType {
  student,
  mentor,
  supervisor,
}

extension AccountTypeX on AccountType {
  String get label {
    switch (this) {
      case AccountType.student:
        return 'طالب';
      case AccountType.mentor:
        return 'مدرب';
      case AccountType.supervisor:
        return 'مشرف';
    }
  }

  IconData get icon {
    switch (this) {
      case AccountType.student:
        return Icons.school_outlined;
      case AccountType.mentor:
        return Icons.handshake_outlined;
      case AccountType.supervisor:
        return Icons.verified_user_outlined;
    }
  }

  String localizedLabel(AppLocalizations loc) {
    switch (this) {
      case AccountType.student:
        return loc.t('account_type_student');
      case AccountType.mentor:
        return loc.t('account_type_mentor');
      case AccountType.supervisor:
        return loc.t('account_type_supervisor');
    }
  }
}
