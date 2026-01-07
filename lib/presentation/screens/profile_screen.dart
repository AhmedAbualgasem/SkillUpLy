import 'package:flutter/material.dart';
import 'package:skillup_libya/core/models/account_type.dart';

import '../../core/app_settings_scope.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/models/user_role.dart';
import '../../core/ui_feedback.dart';
import 'admin/admin_dashboard_screen.dart';
import 'payments/payment_screen.dart';
import 'profile_edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const _preferences = <_PreferenceData>[
    _PreferenceData(
      id: 'live_alerts',
      titleKey: 'profile_preference_alerts_title',
      subtitleKey: 'profile_preference_alerts_subtitle',
      enabled: true,
    ),
    _PreferenceData(
      id: 'share_progress',
      titleKey: 'profile_preference_share_title',
      subtitleKey: 'profile_preference_share_subtitle',
      enabled: true,
    ),
    _PreferenceData(
      id: 'research_updates',
      titleKey: 'profile_preference_research_title',
      subtitleKey: 'profile_preference_research_subtitle',
      enabled: false,
    ),
  ];

  static const _supportActions = <_SupportAction>[
    _SupportAction('profile_support_request_coach', Icons.support_agent_outlined),
    _SupportAction('profile_support_request_billing', Icons.receipt_long_outlined),
    _SupportAction('profile_support_request_agreement', Icons.verified_user_outlined),
  ];

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _fullName = 'ليبيا فوزي المقريف';
  String _jobTitle = 'Chief Digital Talent Officer';
  String _organization = 'مجموعة المدار';
  String _phoneNumber = '+218 91 123 4567';
  final String _workEmail = 'lydia@almadar.ly';
  AccountType _accountType = AccountType.mentor;
  Color _avatarColor = const Color(0xFF4B2FB9);
  late final Map<String, bool> _preferenceValues = {
    for (final pref in ProfileScreen._preferences) pref.id: pref.enabled,
  };

  void _openPayments() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const PaymentScreen()),
    );
  }

  void _openAdminDashboard() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AdminDashboardScreen()),
    );
  }

  Future<void> _editProfile() async {
    final result = await Navigator.of(context).push<ProfileUpdateResult>(
      MaterialPageRoute(
        builder: (_) => ProfileEditScreen(
          initialName: _fullName,
          initialPhone: _phoneNumber,
          initialEmail: _workEmail,
          initialAccountType: _accountType,
          initialAvatarColor: _avatarColor,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _fullName = result.name;
        _phoneNumber = result.phone;
        _accountType = result.accountType;
        _avatarColor = result.avatarColor;
      });
      UiFeedback.showSnack(context, AppLocalizations.of(context).t('profile_snack_updated'));
    }
  }

  void _handlePreferenceToggle(BuildContext context, _PreferenceData pref, bool value) {
    final loc = AppLocalizations.of(context);
    setState(() => _preferenceValues[pref.id] = value);
    final label = loc.t(pref.titleKey);
    UiFeedback.showSnack(
      context,
      value
          ? loc.t('profile_pref_toggle_on', params: {'item': label})
          : loc.t('profile_pref_toggle_off', params: {'item': label}),
    );
  }

  void _handleSupportAction(_SupportAction action) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: loc.t(action.labelKey),
      description: loc.t('profile_support_description'),
      actions: [
        SheetAction(
          label: loc.t('profile_support_action'),
          icon: Icons.send_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('profile_support_success')),
        ),
      ],
    );
  }

  List<_OrgTileData> _buildOrgTiles(AppLocalizations loc) {
    return [
      _OrgTileData(
        title: loc.t('profile_org_tile_active_teams_title'),
        value: loc.t('profile_org_tile_active_teams_value'),
        description: loc.t('profile_org_tile_active_teams_description'),
      ),
      _OrgTileData(
        title: loc.t('profile_org_tile_budget_title'),
        value: loc.t('profile_org_tile_budget_value'),
        description: loc.t('profile_org_tile_budget_description'),
      ),
      _OrgTileData(
        title: loc.t('profile_org_tile_roi_title'),
        value: loc.t('profile_org_tile_roi_value'),
        description: loc.t('profile_org_tile_roi_description'),
      ),
      _OrgTileData(
        title: loc.t('profile_org_tile_sessions_title'),
        value: loc.t('profile_org_tile_sessions_value'),
        description: loc.t('profile_org_tile_sessions_description'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final orgTiles = _buildOrgTiles(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              sliver: SliverList.list(
                children: [
                  _ProfileHeader(
                    name: _fullName,
                    jobTitle: _jobTitle,
                    organization: _organization,
                    phone: _phoneNumber,
                    accountType: _accountType,
                    avatarColor: _avatarColor,
                    onEdit: _editProfile,
                  ),
                  const SizedBox(height: 16),
                  _ShortcutCards(onOpenPayments: _openPayments, onOpenAdmin: _openAdminDashboard),
                  const SizedBox(height: 16),
                  const _ExperienceSettingsCard(),
                  const SizedBox(height: 24),
                  _SectionLabel(loc.t('profile_section_company_data')),
                  const SizedBox(height: 12),
                  _OrganizationMatrix(tiles: orgTiles),
                  const SizedBox(height: 28),
                  _SectionLabel(loc.t('profile_section_learning')),
                  const SizedBox(height: 12),
                  _PreferenceList(
                    items: ProfileScreen._preferences,
                    values: _preferenceValues,
                    onToggle: (pref, value) => _handlePreferenceToggle(context, pref, value),
                  ),
                  const SizedBox(height: 28),
                  _SectionLabel(loc.t('profile_section_support')),
                  const SizedBox(height: 12),
                  _SupportGrid(
                    items: ProfileScreen._supportActions,
                    onSelect: _handleSupportAction,
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.name,
    required this.jobTitle,
    required this.organization,
    required this.phone,
    required this.accountType,
    required this.avatarColor,
    required this.onEdit,
  });

  final String name;
  final String jobTitle;
  final String organization;
  final String phone;
  final AccountType accountType;
  final Color avatarColor;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    final surface = theme.cardColor ?? theme.colorScheme.surface;
    final shadowColor = Colors.black.withOpacity(theme.brightness == Brightness.dark ? 0.35 : 0.08);
    final muted = theme.colorScheme.onSurface.withOpacity(0.65);
    final tags = [
      loc.t('profile_account_plan'),
      loc.t('profile_active_seats'),
      loc.t('profile_account_type_label', params: {'value': accountType.localizedLabel(loc)}),
    ];
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(color: shadowColor, offset: const Offset(0, 18), blurRadius: 36),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: avatarColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(Icons.person_outline, size: 40, color: Colors.white),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('$jobTitle · $organization', style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
                const SizedBox(height: 4),
                Text(phone, style: theme.textTheme.bodySmall?.copyWith(color: muted)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: tags.map((text) => _TagChip(label: text)).toList(),
                ),
              ],
            ),
          ),
          IconButton(onPressed: onEdit, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
    );
  }
}

class _ShortcutCards extends StatelessWidget {
  const _ShortcutCards({required this.onOpenPayments, required this.onOpenAdmin});

  final VoidCallback onOpenPayments;
  final VoidCallback onOpenAdmin;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ShortcutTile(
          icon: Icons.payments_outlined,
          title: loc.t('profile_payments_title'),
          subtitle: loc.t('profile_payments_subtitle'),
          onTap: onOpenPayments,
        ),
        _ShortcutTile(
          icon: Icons.admin_panel_settings_outlined,
          title: loc.t('profile_admin_title'),
          subtitle: loc.t('profile_admin_subtitle'),
          onTap: onOpenAdmin,
        ),
      ],
    );
  }
}

class _ShortcutTile extends StatelessWidget {
  const _ShortcutTile({required this.icon, required this.title, required this.subtitle, required this.onTap});

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.cardColor ?? theme.colorScheme.surface;
    final borderColor = theme.brightness == Brightness.dark ? Colors.white.withOpacity(0.1) : const Color(0xFFE7E4FB);
    final shadowColor = Colors.black.withOpacity(theme.brightness == Brightness.dark ? 0.35 : 0.08);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor),
          boxShadow: [BoxShadow(color: shadowColor, offset: const Offset(0, 12), blurRadius: 30)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(height: 12),
            Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6))),
          ],
        ),
      ),
    );
  }
}

class _ExperienceSettingsCard extends StatelessWidget {
  const _ExperienceSettingsCard();

  @override
  Widget build(BuildContext context) {
    final settings = AppSettingsScope.of(context);
    final currentLocale = settings.locale.languageCode;
    final loc = AppLocalizations.of(context);
    final role = settings.userRole;
    final theme = Theme.of(context);
    String languageLabel;
    switch (currentLocale) {
      case 'ar':
        languageLabel = loc.t('language_arabic');
        break;
      case 'en':
        languageLabel = loc.t('language_english');
        break;
      default:
        languageLabel = loc.t('language_english');
    }
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.t('profile_experience_title'), style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SwitchListTile.adaptive(
              value: settings.isDarkMode,
              onChanged: settings.toggleDarkMode,
              title: Text(loc.t('profile_dark_mode_label')),
              subtitle: Text(loc.t('profile_dark_mode_description')),
              secondary: const Icon(Icons.dark_mode_outlined),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.verified_user_outlined),
              title: Text(loc.t('profile_role_label')),
              subtitle: Text(loc.t('profile_role_description', params: {'role': role.localizedLabel(loc)})),
              trailing: Chip(label: Text(role.localizedLabel(loc))),
            ),
            const SizedBox(height: 8),
            Text(
              loc.t('profile_role_note'),
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.65)),
            ),
            const SizedBox(height: 16),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.translate_outlined),
              title: Text(loc.t('profile_language_label')),
              subtitle: Text(languageLabel),
              trailing: DropdownButton<Locale>(
                value: settings.locale,
                underline: const SizedBox.shrink(),
                onChanged: (locale) {
                  if (locale != null) settings.setLocale(locale);
                },
                items: [
                  DropdownMenuItem(value: const Locale('ar', 'LY'), child: Text(loc.t('language_arabic'))),
                  DropdownMenuItem(value: const Locale('en', 'US'), child: Text(loc.t('language_english'))),
                  DropdownMenuItem(
                    value: const Locale('tz', 'MA'),
                    enabled: false,
                    child: Row(
                      children: [
                        Text(loc.t('language_tamazight')),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            loc.t('feature_coming_soon'),
                            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(loc.t('profile_language_helper')),
            const SizedBox(height: 8),
            Text(
              loc.t('profile_language_tamazight_note'),
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrganizationMatrix extends StatelessWidget {
  const _OrganizationMatrix({required this.tiles});

  final List<_OrgTileData> tiles;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.3,
      children: tiles.map((tile) => _OrgTile(data: tile)).toList(),
    );
  }
}

class _PreferenceList extends StatelessWidget {
  const _PreferenceList({
    required this.items,
    required this.values,
    required this.onToggle,
  });

  final List<_PreferenceData> items;
  final Map<String, bool> values;
  final void Function(_PreferenceData, bool) onToggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    final surface = theme.cardColor ?? theme.colorScheme.surface;
    final borderColor = theme.brightness == Brightness.dark ? Colors.white.withOpacity(0.08) : const Color(0xFFE6E3F5);
    final muted = theme.colorScheme.onSurface.withOpacity(0.6);
    return Column(
      children: items
          .map(
            (pref) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loc.t(pref.titleKey),
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          loc.t(pref.subtitleKey),
                          style: theme.textTheme.bodySmall?.copyWith(color: muted),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: values[pref.id] ?? pref.enabled,
                    onChanged: (value) => onToggle(pref, value),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SupportGrid extends StatelessWidget {
  const _SupportGrid({required this.items, required this.onSelect});

  final List<_SupportAction> items;
  final ValueChanged<_SupportAction> onSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    final surface = theme.cardColor ?? theme.colorScheme.surface;
    final shadowColor = Colors.black.withOpacity(theme.brightness == Brightness.dark ? 0.35 : 0.08);
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items
          .map(
            (action) => Container(
              width: 170,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(color: shadowColor, offset: const Offset(0, 12), blurRadius: 32),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(action.icon, color: theme.colorScheme.primary),
                  const SizedBox(height: 12),
                  Text(
                    loc.t(action.labelKey),
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => onSelect(action),
                    child: Text(loc.t('profile_support_button')),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold));
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = theme.colorScheme.primaryContainer.withOpacity(theme.brightness == Brightness.dark ? 0.25 : 0.5);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _OrgTile extends StatelessWidget {
  const _OrgTile({required this.data});

  final _OrgTileData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.cardColor ?? theme.colorScheme.surface;
    final borderColor = theme.brightness == Brightness.dark ? Colors.white.withOpacity(0.08) : const Color(0xFFE9E7FB);
    final muted = theme.colorScheme.onSurface.withOpacity(0.6);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.title, style: theme.textTheme.bodySmall?.copyWith(color: muted)),
          const SizedBox(height: 6),
          Text(data.value, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(data.description, style: theme.textTheme.bodySmall?.copyWith(color: muted)),
        ],
      ),
    );
  }
}

class _PreferenceData {
  const _PreferenceData({
    required this.id,
    required this.titleKey,
    required this.subtitleKey,
    required this.enabled,
  });

  final String id;
  final String titleKey;
  final String subtitleKey;
  final bool enabled;
}

class _SupportAction {
  const _SupportAction(this.labelKey, this.icon);

  final String labelKey;
  final IconData icon;
}

class _OrgTileData {
  const _OrgTileData({required this.title, required this.value, required this.description});

  final String title;
  final String value;
  final String description;
}
