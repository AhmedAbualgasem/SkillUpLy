import 'package:flutter/material.dart';

import '../../core/localization/app_localizations.dart';
import '../../core/ui_feedback.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  List<_LearningPathData> _buildPaths(AppLocalizations loc) {
    return [
      _LearningPathData(
        loc.t('learning_path1_title'),
        0.72,
        loc.t('learning_path1_status'),
        loc.t('learning_path1_partner'),
      ),
      _LearningPathData(
        loc.t('learning_path2_title'),
        0.38,
        loc.t('learning_path2_status'),
        loc.t('learning_path2_partner'),
      ),
    ];
  }

  List<_SessionData> _buildSessions(AppLocalizations loc) {
    return [
      _SessionData(
        loc.t('learning_session1_title'),
        loc.t('learning_session1_date'),
        loc.t('learning_session1_description'),
        true,
      ),
      _SessionData(
        loc.t('learning_session2_title'),
        loc.t('learning_session2_date'),
        loc.t('learning_session2_description'),
        false,
      ),
    ];
  }

  List<_CertificateData> _buildCertificates(AppLocalizations loc) {
    return [
      _CertificateData(loc.t('learning_certificate1_title'), loc.t('learning_certificate1_issuer')),
      _CertificateData(loc.t('learning_certificate2_title'), loc.t('learning_certificate2_issuer')),
    ];
  }

  void _openPathManagement(BuildContext context) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: loc.t('learning_paths_manage_title'),
      description: loc.t('learning_paths_manage_description'),
      actions: [
        SheetAction(
          label: loc.t('learning_paths_add_member'),
          icon: Icons.person_add_alt_1,
          onSelected: () => UiFeedback.showSnack(context, loc.t('learning_paths_add_member_success')),
        ),
      ],
    );
  }

  void _syncCalendar(BuildContext context) {
    UiFeedback.showSnack(context, AppLocalizations.of(context).t('learning_sync_success'));
  }

  void _shareAchievements(BuildContext context) {
    UiFeedback.showSnack(context, AppLocalizations.of(context).t('learning_share_success'));
  }

  void _openPathDetails(BuildContext context, _LearningPathData path) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: path.title,
      description: loc.t(
        'learning_path_sheet_description',
        params: {
          'progress': (path.progress * 100).toStringAsFixed(0),
          'status': path.status,
          'partner': path.partner,
        },
      ),
      actions: [
        SheetAction(
          label: loc.t('learning_path_sheet_action'),
          icon: Icons.checklist_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('learning_path_sheet_success')),
        ),
      ],
    );
  }

  void _openSessionDetails(BuildContext context, _SessionData session) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: session.title,
      description: loc.t(
        'learning_session_sheet_description',
        params: {'date': session.dateLabel, 'description': session.description},
      ),
      actions: [
        SheetAction(
          label: loc.t('learning_session_sheet_action'),
          icon: Icons.notifications_active_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('learning_session_sheet_success')),
        ),
      ],
    );
  }

  void _downloadCertificate(BuildContext context, _CertificateData certificate) {
    UiFeedback.showSnack(
      context,
      AppLocalizations.of(context).t('learning_certificate_download', params: {'title': certificate.title}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final loc = AppLocalizations.of(context);
    final paths = _buildPaths(loc);
    final sessions = _buildSessions(loc);
    final certificates = _buildCertificates(loc);

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              sliver: SliverList.list(
                children: [
                  const _OverviewBanner(),
                  const SizedBox(height: 24),
                  _SectionHeader(
                    title: loc.t('learning_section_paths'),
                    action: TextButton(
                      onPressed: () => _openPathManagement(context),
                      child: Text(loc.t('learning_paths_manage_button')),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _LearningPathList(items: paths, onView: (path) => _openPathDetails(context, path)),
                  const SizedBox(height: 32),
                  _SectionHeader(
                    title: loc.t('learning_section_sessions'),
                    action: TextButton(
                      onPressed: () => _syncCalendar(context),
                      child: Text(loc.t('learning_sync_button')),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _SessionTimeline(items: sessions, onView: (session) => _openSessionDetails(context, session)),
                  const SizedBox(height: 32),
                  _SectionHeader(
                    title: loc.t('learning_section_certificates'),
                    action: TextButton(
                      onPressed: () => _shareAchievements(context),
                      child: Text(loc.t('learning_share_button')),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _CertificateStack(items: certificates, onDownload: (certificate) => _downloadCertificate(context, certificate)),
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

class _OverviewBanner extends StatelessWidget {
  const _OverviewBanner();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final loc = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.primaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.t('learning_overview_title'),
            style: theme.textTheme.titleLarge?.copyWith(color: scheme.onPrimary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            loc.t('learning_overview_description'),
            style: theme.textTheme.bodyLarge?.copyWith(color: scheme.onPrimary.withOpacity(0.8)),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _MetricCard(label: loc.t('learning_metric_progress'), value: '64%'),
              const SizedBox(width: 12),
              _MetricCard(label: loc.t('learning_metric_sessions'), value: '5'),
              const SizedBox(width: 12),
              _MetricCard(label: loc.t('learning_metric_rating'), value: '4.8/5'),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: scheme.onPrimary.withOpacity(0.12),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: scheme.onPrimary.withOpacity(0.8), fontSize: 12)),
            const SizedBox(height: 6),
            Text(value, style: TextStyle(color: scheme.onPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _LearningPathList extends StatelessWidget {
  const _LearningPathList({required this.items, required this.onView});

  final List<_LearningPathData> items;
  final ValueChanged<_LearningPathData> onView;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final shadowColor = theme.shadowColor.withOpacity(0.08);
    final loc = AppLocalizations.of(context);
    return Column(
      children: items
          .map(
            (path) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: scheme.surfaceVariant,
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(color: shadowColor, offset: const Offset(0, 10), blurRadius: 28),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          path.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        path.partner,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: LinearProgressIndicator(
                      value: path.progress,
                      minHeight: 10,
                      backgroundColor: scheme.surface,
                      valueColor: AlwaysStoppedAnimation<Color>(scheme.primary),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        path.status,
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                      TextButton(onPressed: () => onView(path), child: Text(loc.t('learning_path_view_button'))),
                    ],
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SessionTimeline extends StatelessWidget {
  const _SessionTimeline({required this.items, required this.onView});

  final List<_SessionData> items;
  final ValueChanged<_SessionData> onView;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final loc = AppLocalizations.of(context);
    return Column(
      children: items
          .map(
            (session) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: scheme.surfaceVariant,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: session.isLive ? scheme.primary : scheme.outlineVariant,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    session.isLive ? Icons.sensors_outlined : Icons.calendar_today_outlined,
                    color: session.isLive ? scheme.primary : scheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(session.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(
                          session.dateLabel,
                          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                        Text(session.description, style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () => onView(session),
                    child: Text(loc.t('learning_session_details_button')),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CertificateStack extends StatelessWidget {
  const _CertificateStack({required this.items, required this.onDownload});

  final List<_CertificateData> items;
  final ValueChanged<_CertificateData> onDownload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final shadowColor = theme.shadowColor.withOpacity(0.08);
    return Column(
      children: items
          .map(
            (certificate) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: scheme.surfaceVariant,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: shadowColor, offset: const Offset(0, 12), blurRadius: 30),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.verified_outlined, color: scheme.onPrimaryContainer),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(certificate.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(
                          certificate.issuer,
                          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => onDownload(certificate),
                    icon: const Icon(Icons.download_rounded),
                    color: scheme.primary,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.action});

  final String title;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        action,
      ],
    );
  }
}

class _LearningPathData {
  const _LearningPathData(this.title, this.progress, this.status, this.partner);

  final String title;
  final double progress;
  final String status;
  final String partner;
}

class _SessionData {
  const _SessionData(this.title, this.dateLabel, this.description, this.isLive);

  final String title;
  final String dateLabel;
  final String description;
  final bool isLive;
}

class _CertificateData {
  const _CertificateData(this.title, this.issuer);

  final String title;
  final String issuer;
}
