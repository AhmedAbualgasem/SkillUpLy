import 'package:flutter/material.dart';

import 'localization/app_localizations.dart';

class SheetAction {
  const SheetAction({
    required this.label,
    required this.icon,
    this.onSelected,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onSelected;
}

class UiFeedback {
  const UiFeedback._();

  static void showSnack(BuildContext context, String message) {
    final theme = Theme.of(context);
    final snackTheme = theme.snackBarTheme;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: snackTheme.contentTextStyle ?? theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onInverseSurface),
          ),
          backgroundColor: snackTheme.backgroundColor ?? theme.colorScheme.inverseSurface,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  static Future<void> showActionSheet(
    BuildContext context, {
    required String title,
    required String description,
    List<SheetAction> actions = const [],
  }) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor ?? Theme.of(context).colorScheme.surface,
      shape: Theme.of(context).bottomSheetTheme.shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
      builder: (sheetContext) {
        final theme = Theme.of(sheetContext);
        final loc = AppLocalizations.of(sheetContext);
        final onSurfaceMuted = theme.colorScheme.onSurface.withOpacity(0.7);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(color: onSurfaceMuted, height: 1.4),
                ),
                const SizedBox(height: 16),
                if (actions.isNotEmpty)
                  ...actions.map(
                    (action) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(action.icon, color: theme.colorScheme.primary),
                      title: Text(action.label),
                      onTap: () {
                        Navigator.of(sheetContext).pop();
                        action.onSelected?.call();
                      },
                    ),
                  ),
                if (actions.isEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(sheetContext).pop(),
                      child: Text(loc.t('action_close')),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
