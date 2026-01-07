import 'package:flutter/material.dart';

import '../../core/app_settings_scope.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/models/user_role.dart';
import '../../core/ui_feedback.dart';
import 'courses/course_catalog_screen.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  List<_TrackData> _buildTracks(AppLocalizations loc) {
    return [
      _TrackData(
        title: loc.t('browse_track1_title'),
        outcome: loc.t('browse_track1_outcome'),
        level: loc.t('browse_track1_level'),
        color: const Color(0xFF22174F),
      ),
      _TrackData(
        title: loc.t('browse_track2_title'),
        outcome: loc.t('browse_track2_outcome'),
        level: loc.t('browse_track2_level'),
        color: const Color(0xFF0F3B65),
      ),
      _TrackData(
        title: loc.t('browse_track3_title'),
        outcome: loc.t('browse_track3_outcome'),
        level: loc.t('browse_track3_level'),
        color: const Color(0xFF51204F),
      ),
    ];
  }

  List<_CapabilityData> _buildCapabilities(AppLocalizations loc) {
    return [
      _CapabilityData(loc.t('browse_capability_ai_leadership'), Icons.bolt_outlined, const Color(0xFFE7E3FF)),
      _CapabilityData(loc.t('browse_capability_data_science'), Icons.dataset_outlined, const Color(0xFFD6F6FF)),
      _CapabilityData(loc.t('browse_capability_digital_products'), Icons.dashboard_customize_outlined, const Color(0xFFFFE6F3)),
      _CapabilityData(loc.t('browse_capability_experience_innovation'), Icons.explore_outlined, const Color(0xFFFDF1D6)),
      _CapabilityData(loc.t('browse_capability_cybersecurity'), Icons.lock_clock_outlined, const Color(0xFFE8FFF7)),
      _CapabilityData(loc.t('browse_capability_cloud_architecture'), Icons.cloud_outlined, const Color(0xFFF4E6FF)),
    ];
  }

  List<_MentorData> _buildMentors(AppLocalizations loc) {
    return [
      _MentorData(
        loc.t('browse_mentor1_name'),
        loc.t('browse_mentor1_expertise'),
        loc.t('browse_mentor1_company'),
      ),
      _MentorData(
        loc.t('browse_mentor2_name'),
        loc.t('browse_mentor2_expertise'),
        loc.t('browse_mentor2_company'),
      ),
      _MentorData(
        loc.t('browse_mentor3_name'),
        loc.t('browse_mentor3_expertise'),
        loc.t('browse_mentor3_company'),
      ),
    ];
  }

  List<_LabData> _buildLabs(AppLocalizations loc) {
    return [
      _LabData(loc.t('browse_lab1_title'), loc.t('browse_lab1_description')),
      _LabData(loc.t('browse_lab2_title'), loc.t('browse_lab2_description')),
    ];
  }

  List<_IndividualFilterData> _buildIndividualFilters(AppLocalizations loc) {
    return [
      _IndividualFilterData(loc.t('browse_individual_filter_duration_2'), Icons.timer_outlined),
      _IndividualFilterData(loc.t('browse_individual_filter_duration_8'), Icons.calendar_view_month_outlined),
      _IndividualFilterData(loc.t('browse_individual_filter_cost'), Icons.savings_outlined),
      _IndividualFilterData(loc.t('browse_individual_filter_blended'), Icons.wifi_tethering_outlined),
      _IndividualFilterData(loc.t('browse_individual_filter_job'), Icons.badge_outlined),
      _IndividualFilterData(loc.t('browse_individual_filter_certificate'), Icons.qr_code_2_outlined),
    ];
  }

  List<_ShortCourseData> _buildShortCourses(AppLocalizations loc) {
    return [
      _ShortCourseData(
        title: loc.t('browse_individual_course_phone_title'),
        category: loc.t('browse_individual_course_phone_category'),
        durationWeeks: 4,
        priceAmount: '420',
        formatKey: 'home_vocational_format_hybrid',
        assessmentKey: 'browse_individual_course_assessment_lab',
        accent: const Color(0xFFE8F3FF),
      ),
      _ShortCourseData(
        title: loc.t('browse_individual_course_electric_title'),
        category: loc.t('browse_individual_course_electric_category'),
        durationWeeks: 6,
        priceAmount: '380',
        formatKey: 'home_vocational_format_onsite',
        assessmentKey: 'browse_individual_course_assessment_video',
        accent: const Color(0xFFFFF4E2),
      ),
      _ShortCourseData(
        title: loc.t('browse_individual_course_mechanics_title'),
        category: loc.t('browse_individual_course_mechanics_category'),
        durationWeeks: 8,
        priceAmount: '520',
        formatKey: 'home_vocational_format_dual',
        assessmentKey: 'browse_individual_course_assessment_project',
        accent: const Color(0xFFEFF7F1),
      ),
      _ShortCourseData(
        title: loc.t('browse_individual_course_design_title'),
        category: loc.t('browse_individual_course_design_category'),
        durationWeeks: 5,
        priceAmount: '310',
        formatKey: 'home_vocational_format_online',
        assessmentKey: 'browse_individual_course_assessment_portfolio',
        accent: const Color(0xFFF8E8FF),
      ),
      _ShortCourseData(
        title: loc.t('browse_individual_course_hvac_title'),
        category: loc.t('browse_individual_course_hvac_category'),
        durationWeeks: 7,
        priceAmount: '450',
        formatKey: 'home_vocational_format_onsite',
        assessmentKey: 'browse_individual_course_assessment_video',
        accent: const Color(0xFFE4F8FF),
      ),
      _ShortCourseData(
        title: loc.t('browse_individual_course_sales_title'),
        category: loc.t('browse_individual_course_sales_category'),
        durationWeeks: 3,
        priceAmount: '260',
        formatKey: 'home_vocational_format_online',
        assessmentKey: 'browse_individual_course_assessment_call',
        accent: const Color(0xFFFFEAF2),
      ),
    ];
  }

  List<_TrainerSpotlightData> _buildTrainerSpotlights(AppLocalizations loc) {
    return [
      _TrainerSpotlightData(
        name: 'ليلى الترهوني',
        specialty: loc.t('browse_individual_trainer_phone'),
        city: loc.t('browse_individual_city_tripoli'),
        ratingLabel: '4.9',
      ),
      _TrainerSpotlightData(
        name: 'سالم الورفلي',
        specialty: loc.t('browse_individual_trainer_design'),
        city: loc.t('browse_individual_city_misrata'),
        ratingLabel: '4.8',
      ),
      _TrainerSpotlightData(
        name: 'هدى الزنتاني',
        specialty: loc.t('browse_individual_trainer_hvac'),
        city: loc.t('browse_individual_city_benghazi'),
        ratingLabel: '5.0',
      ),
    ];
  }

  List<_ProjectBriefData> _buildProjectBriefs(AppLocalizations loc) {
    return [
      _ProjectBriefData(
        title: loc.t('browse_individual_project_phone_title'),
        description: loc.t('browse_individual_project_phone_desc'),
        submission: loc.t('browse_individual_project_submission_video'),
      ),
      _ProjectBriefData(
        title: loc.t('browse_individual_project_design_title'),
        description: loc.t('browse_individual_project_design_desc'),
        submission: loc.t('browse_individual_project_submission_portfolio'),
      ),
    ];
  }

  List<_CoachReviewTicketData> _buildCoachReviewTickets(AppLocalizations loc) {
    return [
      _CoachReviewTicketData(
        learnerName: 'فرح المجبري',
        track: loc.t('home_vocational_domain_phone_title'),
        dueLabel: loc.t('home_coach_due_hours', params: {'hours': '6'}),
        status: loc.t('home_coach_status_video'),
      ),
      _CoachReviewTicketData(
        learnerName: 'أيمن قرقوم',
        track: loc.t('home_vocational_domain_design_title'),
        dueLabel: loc.t('home_coach_due_tomorrow'),
        status: loc.t('home_coach_status_photos'),
      ),
      _CoachReviewTicketData(
        learnerName: 'سارة الكوافي',
        track: loc.t('home_vocational_domain_hvac_title'),
        dueLabel: loc.t('home_coach_due_two_days'),
        status: loc.t('home_coach_status_live'),
      ),
    ];
  }

  List<_CoachSessionData> _buildCoachSessions(AppLocalizations loc) {
    return [
      _CoachSessionData(
        title: loc.t('home_vocational_sprint_phone_title'),
        slot: loc.t('home_coach_session_slot_today'),
        location: loc.t('home_coach_session_location_virtual'),
        typeLabel: loc.t('home_vocational_format_hybrid'),
      ),
      _CoachSessionData(
        title: loc.t('home_vocational_sprint_design_title'),
        slot: loc.t('home_coach_session_slot_tomorrow'),
        location: loc.t('home_coach_session_location_remote'),
        typeLabel: loc.t('home_vocational_format_online'),
      ),
      _CoachSessionData(
        title: loc.t('home_vocational_sprint_hvac_title'),
        slot: loc.t('home_coach_session_slot_two_days'),
        location: loc.t('home_coach_session_location_lab'),
        typeLabel: loc.t('home_vocational_format_onsite'),
      ),
    ];
  }

  List<_CoachInsightData> _buildCoachInsights(AppLocalizations loc) {
    return [
      _CoachInsightData(
        title: loc.t('home_coach_insight_completion'),
        metricValue: '84%',
        description: loc.t('home_coach_insight_completion_detail'),
      ),
      _CoachInsightData(
        title: loc.t('home_coach_insight_response'),
        metricValue: '12 دقيقة',
        description: loc.t('home_coach_insight_response_detail'),
      ),
      _CoachInsightData(
        title: loc.t('home_coach_insight_jobs'),
        metricValue: '5',
        description: loc.t('home_coach_insight_jobs_detail'),
      ),
    ];
  }

  List<_SupervisorMetricData> _buildSupervisorMetrics(AppLocalizations loc) {
    return [
      _SupervisorMetricData(label: loc.t('home_supervisor_metric_learners'), value: '128', trendLabel: '+12'),
      _SupervisorMetricData(label: loc.t('home_supervisor_metric_certificates'), value: '64', trendLabel: '+8'),
      _SupervisorMetricData(label: loc.t('home_supervisor_metric_sla'), value: '92%', trendLabel: 'SLA'),
    ];
  }

  List<_SupervisorAlertData> _buildSupervisorAlerts(AppLocalizations loc) {
    return [
      _SupervisorAlertData(
        title: loc.t('home_supervisor_alert_attendance'),
        detail: loc.t('home_supervisor_alert_attendance_detail'),
      ),
      _SupervisorAlertData(
        title: loc.t('home_supervisor_alert_equipment'),
        detail: loc.t('home_supervisor_alert_equipment_detail'),
      ),
    ];
  }

  List<_SupervisorProgramData> _buildSupervisorPrograms(AppLocalizations loc) {
    return [
      _SupervisorProgramData(
        title: 'AI for Municipal Services',
        regionLabel: 'طرابلس',
        statusLabel: loc.t('home_supervisor_program_status_pending'),
      ),
      _SupervisorProgramData(
        title: 'HVAC Field Upskilling',
        regionLabel: 'سبها',
        statusLabel: loc.t('home_supervisor_program_status_review'),
      ),
    ];
  }


  void _handleFilterTap(BuildContext context, String label) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showSnack(context, loc.t('browse_filter_snack', params: {'filter': label}));
  }

  void _handleMatrixRequest(BuildContext context) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: loc.t('browse_matrix_title'),
      description: loc.t('browse_matrix_description'),
      actions: [
        SheetAction(
          label: loc.t('browse_matrix_action'),
          icon: Icons.file_download_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_matrix_download_snack')),
        ),
      ],
    );
  }

  void _handleIntroCall(BuildContext context) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: loc.t('browse_intro_title'),
      description: loc.t('browse_intro_description'),
      actions: [
        SheetAction(
          label: loc.t('browse_intro_action'),
          icon: Icons.event_available_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_intro_schedule_snack')),
        ),
      ],
    );
  }

  void _showTrackDetails(BuildContext context, _TrackData track) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: track.title,
      description: '${track.outcome}\n${track.level}',
      actions: [
        SheetAction(
          label: loc.t('browse_track_sheet_action'),
          icon: Icons.task_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_track_sheet_success')),
        ),
      ],
    );
  }

  void _showCapabilityDetails(BuildContext context, _CapabilityData capability) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: capability.label,
      description: loc.t('browse_capability_sheet_description'),
      actions: [
        SheetAction(
          label: loc.t('browse_capability_sheet_action'),
          icon: Icons.add_task_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_capability_sheet_success')),
        ),
      ],
    );
  }

  void _bookMentor(BuildContext context, _MentorData mentor) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: loc.t('browse_mentor_sheet_title', params: {'name': mentor.name}),
      description: mentor.expertise,
      actions: [
        SheetAction(
          label: loc.t('browse_mentor_sheet_action'),
          icon: Icons.schedule_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_mentor_sheet_success')),
        ),
      ],
    );
  }

  void _requestLabAccess(BuildContext context, _LabData lab) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: lab.title,
      description: lab.description,
      actions: [
        SheetAction(
          label: loc.t('browse_lab_sheet_action'),
          icon: Icons.send_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_lab_sheet_success')),
        ),
      ],
    );
  }

  void _openCourseCatalog(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CourseCatalogScreen()),
    );
  }

  void _openJobHub(BuildContext context) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: loc.t('home_vocational_jobhub_title'),
      description: loc.t('home_vocational_jobhub_description'),
      actions: [
        SheetAction(
          label: loc.t('home_vocational_jobhub_action'),
          icon: Icons.work_outline,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_vocational_jobhub_feedback')),
        ),
      ],
    );
  }

  void _handleIndividualFilterTap(BuildContext context, String label) {
    UiFeedback.showSnack(context, AppLocalizations.of(context).t('browse_individual_filter_feedback', params: {'filter': label}));
  }

  void _handleShortCourseTap(BuildContext context, _ShortCourseData course) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: course.title,
      description: loc.t(
        'browse_individual_course_sheet',
        params: {
          'category': course.category,
          'duration': loc.t('home_vocational_duration_template', params: {'weeks': course.durationWeeks.toString()}),
        },
      ),
      actions: [
        SheetAction(
          label: loc.t('browse_individual_course_primary_action'),
          icon: Icons.play_circle_outline,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_individual_course_primary_feedback')),
        ),
        SheetAction(
          label: loc.t('browse_individual_course_secondary_action'),
          icon: Icons.assignment_returned_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_individual_course_secondary_feedback')),
        ),
      ],
    );
  }

  void _handleTrainerSpotlight(BuildContext context, _TrainerSpotlightData trainer) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: trainer.name,
      description: loc.t('browse_individual_trainer_sheet', params: {'specialty': trainer.specialty, 'city': trainer.city}),
      actions: [
        SheetAction(
          label: loc.t('browse_individual_trainer_action'),
          icon: Icons.message_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_individual_trainer_feedback')),
        ),
      ],
    );
  }

  void _handleProjectBrief(BuildContext context, _ProjectBriefData brief) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: brief.title,
      description: '${brief.description}\n${brief.submission}',
      actions: [
        SheetAction(
          label: loc.t('browse_individual_project_action'),
          icon: Icons.cloud_upload_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('browse_individual_project_feedback')),
        ),
      ],
    );
  }

  void _handleCoachReviewTap(BuildContext context, _CoachReviewTicketData ticket) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: ticket.learnerName,
      description: '${ticket.track}\n${ticket.dueLabel}\n${ticket.status}',
      actions: [
        SheetAction(
          label: loc.t('home_coach_reviews_action'),
          icon: Icons.play_circle_outline,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_coach_reviews_feedback')),
        ),
      ],
    );
  }

  void _handleCoachSessionTap(BuildContext context, _CoachSessionData session) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: session.title,
      description: '${session.slot}\n${session.location} · ${session.typeLabel}',
      actions: [
        SheetAction(
          label: loc.t('home_coach_sessions_action'),
          icon: Icons.video_call_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_coach_sessions_feedback')),
        ),
      ],
    );
  }

  void _handleCoachInsightTap(BuildContext context, _CoachInsightData insight) {
    UiFeedback.showSnack(context, insight.description);
  }

  void _handleSupervisorAlertTap(BuildContext context, _SupervisorAlertData alert) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: alert.title,
      description: alert.detail,
      actions: [
        SheetAction(
          label: loc.t('home_supervisor_alert_action'),
          icon: Icons.task_alt_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_supervisor_alert_feedback')),
        ),
      ],
    );
  }

  void _handleSupervisorProgramTap(BuildContext context, _SupervisorProgramData program) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: program.title,
      description: '${program.regionLabel}\n${program.statusLabel}',
      actions: [
        SheetAction(
          label: loc.t('home_supervisor_program_action'),
          icon: Icons.verified_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_supervisor_program_feedback')),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = AppSettingsScope.of(context);
    switch (settings.userRole) {
      case UserRole.student:
        return _buildStudentBrowse(context);
      case UserRole.coach:
        return _buildCoachBrowse(context);
      case UserRole.supervisor:
        return _buildSupervisorBrowse(context);
      case UserRole.employee:
        return _buildEmployeeBrowse(context);
    }
  }

  Widget _buildEmployeeBrowse(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final tracks = _buildTracks(loc);
    final capabilities = _buildCapabilities(loc);
    final mentors = _buildMentors(loc);
    final labs = _buildLabs(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverList.list(
                children: [
                  _HeaderFilters(
                    onFilterTap: (label) => _handleFilterTap(context, label),
                    onMatrixTap: () => _handleMatrixRequest(context),
                    onIntroCall: () => _handleIntroCall(context),
                  ),
                  const SizedBox(height: 16),
                  _CourseManagementCallout(onOpen: () => _openCourseCatalog(context)),
                  const SizedBox(height: 24),
                  _SectionTitle(
                    loc.t('browse_section_tracks_title'),
                    loc.t('browse_section_tracks_subtitle'),
                  ),
                  const SizedBox(height: 16),
                  _TrackDeck(items: tracks, onDetails: (track) => _showTrackDetails(context, track)),
                  const SizedBox(height: 32),
                  _SectionTitle(
                    loc.t('browse_section_capabilities_title'),
                    loc.t('browse_section_capabilities_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _CapabilityGrid(items: capabilities, onSelect: (capability) => _showCapabilityDetails(context, capability)),
                  const SizedBox(height: 32),
                  _SectionTitle(
                    loc.t('browse_section_mentors_title'),
                    loc.t('browse_section_mentors_subtitle'),
                  ),
                  const SizedBox(height: 16),
                  _MentorCarousel(items: mentors, onBook: (mentor) => _bookMentor(context, mentor)),
                  const SizedBox(height: 32),
                  _SectionTitle(
                    loc.t('browse_section_labs_title'),
                    loc.t('browse_section_labs_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _LabsColumn(items: labs, onRequest: (lab) => _requestLabAccess(context, lab)),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentBrowse(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final filters = _buildIndividualFilters(loc);
    final courses = _buildShortCourses(loc);
    final trainers = _buildTrainerSpotlights(loc);
    final projects = _buildProjectBriefs(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverList.list(
                children: [
                  _IndividualFilterPanel(
                    filters: filters,
                    onTap: (filter) => _handleIndividualFilterTap(context, filter.label),
                  ),
                  const SizedBox(height: 24),
                  _BrowseHeading(
                    title: loc.t('browse_individual_courses_title'),
                    subtitle: loc.t('browse_individual_courses_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _ShortCourseGrid(courses: courses, onTap: (course) => _handleShortCourseTap(context, course)),
                  const SizedBox(height: 28),
                  _BrowseHeading(
                    title: loc.t('browse_individual_projects_title'),
                    subtitle: loc.t('browse_individual_projects_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _ProjectShowcase(projects: projects, onTap: (brief) => _handleProjectBrief(context, brief)),
                  const SizedBox(height: 28),
                  _BrowseHeading(
                    title: loc.t('browse_individual_trainers_title'),
                    subtitle: loc.t('browse_individual_trainers_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _TrainerSpotlightList(trainers: trainers, onTap: (trainer) => _handleTrainerSpotlight(context, trainer)),
                  const SizedBox(height: 28),
                  _JobLeadBanner(onOpen: () => _openJobHub(context)),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoachBrowse(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final tickets = _buildCoachReviewTickets(loc);
    final sessions = _buildCoachSessions(loc);
    final insights = _buildCoachInsights(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverList.list(
                children: [
                  _RoleHeroBanner(
                    title: loc.t('home_coach_reviews_title'),
                    subtitle: loc.t('home_coach_reviews_subtitle'),
                    actionLabel: loc.t('home_coach_reviews_action'),
                    icon: Icons.play_circle_outline,
                    accentColor: const Color(0xFF213B8F),
                    gradient: const [Color(0xFF0F1E44), Color(0xFF2B4AB3)],
                    onAction: () => UiFeedback.showSnack(context, loc.t('home_coach_reviews_feedback')),
                  ),
                  const SizedBox(height: 28),
                  _BrowseHeading(
                    title: loc.t('home_coach_reviews_title'),
                    subtitle: loc.t('home_coach_reviews_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _CoachReviewList(
                    tickets: tickets,
                    onTap: (ticket) => _handleCoachReviewTap(context, ticket),
                  ),
                  const SizedBox(height: 32),
                  _BrowseHeading(
                    title: loc.t('home_coach_sessions_title'),
                    subtitle: loc.t('home_coach_sessions_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _CoachSessionSchedule(
                    sessions: sessions,
                    onTap: (session) => _handleCoachSessionTap(context, session),
                  ),
                  const SizedBox(height: 32),
                  _BrowseHeading(
                    title: loc.t('home_coach_insights_title'),
                    subtitle: loc.t('home_coach_insights_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _CoachInsightGrid(
                    insights: insights,
                    onTap: (insight) => _handleCoachInsightTap(context, insight),
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

  Widget _buildSupervisorBrowse(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final metrics = _buildSupervisorMetrics(loc);
    final alerts = _buildSupervisorAlerts(loc);
    final programs = _buildSupervisorPrograms(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverList.list(
                children: [
                  _RoleHeroBanner(
                    title: loc.t('home_supervisor_metrics_title'),
                    subtitle: loc.t('home_supervisor_metrics_subtitle'),
                    actionLabel: loc.t('home_supervisor_alert_action'),
                    icon: Icons.task_alt_outlined,
                    accentColor: const Color(0xFF145C51),
                    gradient: const [Color(0xFF083931), Color(0xFF1A7C6F)],
                    onAction: () => UiFeedback.showSnack(context, loc.t('home_supervisor_alert_feedback')),
                  ),
                  const SizedBox(height: 28),
                  _BrowseHeading(
                    title: loc.t('home_supervisor_metrics_title'),
                    subtitle: loc.t('home_supervisor_metrics_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _SupervisorMetricGrid(metrics: metrics),
                  const SizedBox(height: 32),
                  _BrowseHeading(
                    title: loc.t('home_supervisor_alerts_title'),
                    subtitle: loc.t('home_supervisor_alerts_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _SupervisorAlertCards(
                    alerts: alerts,
                    onTap: (alert) => _handleSupervisorAlertTap(context, alert),
                  ),
                  const SizedBox(height: 32),
                  _BrowseHeading(
                    title: loc.t('home_supervisor_programs_title'),
                    subtitle: loc.t('home_supervisor_programs_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _SupervisorProgramDeck(
                    programs: programs,
                    onTap: (program) => _handleSupervisorProgramTap(context, program),
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

class _HeaderFilters extends StatelessWidget {
  const _HeaderFilters({
    required this.onFilterTap,
    required this.onMatrixTap,
    required this.onIntroCall,
  });

  final ValueChanged<String> onFilterTap;
  final VoidCallback onMatrixTap;
  final VoidCallback onIntroCall;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    final filters = [
      (label: loc.t('browse_filter_finance'), icon: Icons.account_balance_outlined),
      (label: loc.t('browse_filter_under_500'), icon: Icons.groups_2_outlined),
      (label: loc.t('browse_filter_ai_readiness'), icon: Icons.auto_awesome_outlined),
      (label: loc.t('browse_filter_hybrid'), icon: Icons.workspaces_outlined),
    ];
    final surface = theme.cardColor;
    final shadowColor =
      Colors.black.withValues(alpha: theme.brightness == Brightness.dark ? 0.35 : 0.08);
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.65);
    return Material(
      color: surface,
      borderRadius: BorderRadius.circular(28),
      elevation: 6,
      shadowColor: shadowColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.t('browse_filters_title'), style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(
              loc.t('browse_filters_description'),
              style: theme.textTheme.bodyMedium?.copyWith(color: muted),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: filters
                  .map(
                    (option) => _FilterChip(
                      label: option.label,
                      icon: option.icon,
                      onTap: () => onFilterTap(option.label),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onMatrixTap,
                    icon: Icon(Icons.tune, color: theme.colorScheme.primary),
                    label: Text(loc.t('browse_filters_matrix_button')),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onIntroCall,
                    icon: const Icon(Icons.play_circle_outline),
                    label: Text(loc.t('browse_filters_intro_button')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseManagementCallout extends StatelessWidget {
  const _CourseManagementCallout({required this.onOpen});

  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C2F55), Color(0xFF454B89)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 10), blurRadius: 26)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.t('browse_callout_title'),
            style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            loc.t('browse_callout_description'),
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onOpen,
            icon: const Icon(Icons.playlist_play_rounded),
            label: Text(loc.t('browse_callout_button')),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF2C2F55),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackDeck extends StatelessWidget {
  const _TrackDeck({required this.items, required this.onDetails});

  final List<_TrackData> items;
  final ValueChanged<_TrackData> onDetails;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final track = items[index];
          return Container(
            width: 260,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: track.color,
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                colors: [track.color, track.color.withValues(alpha: 0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(track.level, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Text(
                  track.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Text(track.outcome, style: const TextStyle(color: Colors.white70, height: 1.4)),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => onDetails(track),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(loc.t('browse_track_action')),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CapabilityGrid extends StatelessWidget {
  const _CapabilityGrid({required this.items, required this.onSelect});

  final List<_CapabilityData> items;
  final ValueChanged<_CapabilityData> onSelect;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.7,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final capability = items[index];
        return Material(
          color: capability.color,
          borderRadius: BorderRadius.circular(22),
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () => onSelect(capability),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(capability.icon, color: const Color(0xFF362A65)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      capability.label,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF362A65)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MentorCarousel extends StatelessWidget {
  const _MentorCarousel({required this.items, required this.onBook});

  final List<_MentorData> items;
  final ValueChanged<_MentorData> onBook;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    final surface = theme.cardColor;
    final shadowColor =
      Colors.black.withValues(alpha: theme.brightness == Brightness.dark ? 0.35 : 0.08);
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.6);
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final mentor = items[index];
          return Container(
            width: 240,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(26),
              boxShadow: [
                BoxShadow(color: shadowColor, offset: const Offset(0, 12), blurRadius: 32),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
                      child: Text(mentor.name.characters.first, style: TextStyle(color: theme.colorScheme.primary)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(mentor.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                          Text(mentor.company, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: muted)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Text(
                    mentor.expertise,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.4),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(onPressed: () => onBook(mentor), child: Text(loc.t('browse_mentor_button'))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LabsColumn extends StatelessWidget {
  const _LabsColumn({required this.items, required this.onRequest});

  final List<_LabData> items;
  final ValueChanged<_LabData> onRequest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    final surface = theme.cardColor;
    final borderColor = theme.brightness == Brightness.dark
      ? Colors.white.withValues(alpha: 0.12)
      : const Color(0xFFE4E1FB);
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.65);
    return Column(
      children: items
          .map(
            (lab) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lab.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(lab.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: muted)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => onRequest(lab),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.tertiary,
                      foregroundColor: theme.colorScheme.onTertiary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    child: Text(loc.t('browse_labs_button')),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.icon, required this.onTap});

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = theme.colorScheme.primaryContainer
      .withValues(alpha: theme.brightness == Brightness.dark ? 0.25 : 0.6);
    final primary = theme.colorScheme.primary;
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: primary),
              const SizedBox(width: 6),
              Text(label, style: TextStyle(color: primary, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title, this.subtitle);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.65);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
      ],
    );
  }
}

class _TrackData {
  const _TrackData({required this.title, required this.outcome, required this.level, required this.color});

  final String title;
  final String outcome;
  final String level;
  final Color color;
}

class _CapabilityData {
  const _CapabilityData(this.label, this.icon, this.color);

  final String label;
  final IconData icon;
  final Color color;
}

class _MentorData {
  const _MentorData(this.name, this.expertise, this.company);

  final String name;
  final String expertise;
  final String company;
}

class _LabData {
  const _LabData(this.title, this.description);

  final String title;
  final String description;
}

class _IndividualFilterPanel extends StatefulWidget {
  const _IndividualFilterPanel({required this.filters, required this.onTap});

  final List<_IndividualFilterData> filters;
  final ValueChanged<_IndividualFilterData> onTap;

  @override
  State<_IndividualFilterPanel> createState() => _IndividualFilterPanelState();
}

class _IndividualFilterPanelState extends State<_IndividualFilterPanel> {
  final Set<int> _selected = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.cardColor,
      elevation: 6,
      borderRadius: BorderRadius.circular(28),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: widget.filters
              .asMap()
              .entries
              .map(
                (entry) => ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(entry.value.icon, size: 16),
                      const SizedBox(width: 6),
                      Text(entry.value.label),
                    ],
                  ),
                  selected: _selected.contains(entry.key),
                  onSelected: (_) {
                    setState(() {
                      if (_selected.contains(entry.key)) {
                        _selected.remove(entry.key);
                      } else {
                        _selected.add(entry.key);
                      }
                    });
                    widget.onTap(entry.value);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _ShortCourseGrid extends StatelessWidget {
  const _ShortCourseGrid({required this.courses, required this.onTap});

  final List<_ShortCourseData> courses;
  final ValueChanged<_ShortCourseData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 1100
            ? 3
            : constraints.maxWidth >= 640
                ? 2
                : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: crossAxisCount == 1 ? 1.4 : 1.1,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return GestureDetector(
              onTap: () => onTap(course),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: course.accent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.category, style: theme.textTheme.labelMedium),
                    const SizedBox(height: 6),
                    Text(course.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      loc.t('home_vocational_duration_template', params: {'weeks': course.durationWeeks.toString()}),
                      style: theme.textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(Icons.videocam_outlined, size: 16, color: theme.colorScheme.primary),
                        const SizedBox(width: 4),
                        Text(loc.t(course.formatKey), style: theme.textTheme.labelSmall),
                        const Spacer(),
                        Text(
                          loc.t('home_vocational_price_template', params: {'amount': course.priceAmount}),
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(loc.t(course.assessmentKey), style: theme.textTheme.labelSmall),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _ProjectShowcase extends StatelessWidget {
  const _ProjectShowcase({required this.projects, required this.onTap});

  final List<_ProjectBriefData> projects;
  final ValueChanged<_ProjectBriefData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: projects
          .map(
            (brief) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.12)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(brief.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(brief.description, style: theme.textTheme.bodySmall?.copyWith(height: 1.4)),
                        const SizedBox(height: 6),
                        Text(brief.submission, style: theme.textTheme.labelSmall),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () => onTap(brief), icon: const Icon(Icons.cloud_upload_outlined)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _TrainerSpotlightList extends StatelessWidget {
  const _TrainerSpotlightList({required this.trainers, required this.onTap});

  final List<_TrainerSpotlightData> trainers;
  final ValueChanged<_TrainerSpotlightData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final trainer = trainers[index];
          return Container(
            width: 200,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.08),
                  offset: const Offset(0, 10),
                  blurRadius: 24,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(child: Text(trainer.name.characters.first)),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(trainer.name, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                        Text(trainer.city, style: theme.textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(child: Text(trainer.specialty, style: theme.textTheme.bodySmall?.copyWith(height: 1.4))),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(trainer.ratingLabel, style: theme.textTheme.labelMedium),
                    const Spacer(),
                    IconButton(onPressed: () => onTap(trainer), icon: const Icon(Icons.message_outlined)),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemCount: trainers.length,
      ),
    );
  }
}

class _JobLeadBanner extends StatelessWidget {
  const _JobLeadBanner({required this.onOpen});

  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF102347), Color(0xFF20498A)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(loc.t('browse_individual_jobs_banner_title'), style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(loc.t('browse_individual_jobs_banner_subtitle'), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70, height: 1.4)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: onOpen,
            icon: const Icon(Icons.work_outline),
            label: Text(loc.t('browse_individual_jobs_banner_action')),
          ),
        ],
      ),
    );
  }
}

class _RoleHeroBanner extends StatelessWidget {
  const _RoleHeroBanner({
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.icon,
    required this.onAction,
    required this.gradient,
    required this.accentColor,
  });

  final String title;
  final String subtitle;
  final String actionLabel;
  final IconData icon;
  final VoidCallback onAction;
  final List<Color> gradient;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            offset: Offset(0, 14),
            blurRadius: 32,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.85)),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onAction,
            icon: Icon(icon),
            label: Text(actionLabel),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: accentColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CoachReviewList extends StatelessWidget {
  const _CoachReviewList({required this.tickets, required this.onTap});

  final List<_CoachReviewTicketData> tickets;
  final ValueChanged<_CoachReviewTicketData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final border = theme.colorScheme.primary.withValues(alpha: 0.12);
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.65);
    return Column(
      children: tickets
          .map(
            (ticket) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: border),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
                    child: Text(ticket.learnerName.characters.first, style: TextStyle(color: theme.colorScheme.primary)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ticket.learnerName, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(ticket.track, style: theme.textTheme.bodySmall?.copyWith(color: muted)),
                        const SizedBox(height: 6),
                        Text('${ticket.dueLabel} · ${ticket.status}', style: theme.textTheme.labelSmall),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () => onTap(ticket),
                    icon: const Icon(Icons.play_circle_outline),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CoachSessionSchedule extends StatelessWidget {
  const _CoachSessionSchedule({required this.sessions, required this.onTap});

  final List<_CoachSessionData> sessions;
  final ValueChanged<_CoachSessionData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.cardColor;
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.6);
    return Column(
      children: sessions
          .map(
            (session) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, 10),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today_outlined, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(session.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(session.slot, style: theme.textTheme.bodySmall?.copyWith(color: muted)),
                        const SizedBox(height: 4),
                        Text('${session.location} · ${session.typeLabel}', style: theme.textTheme.labelSmall),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () => onTap(session),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    child: Text(AppLocalizations.of(context).t('home_coach_sessions_action')),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CoachInsightGrid extends StatelessWidget {
  const _CoachInsightGrid({required this.insights, required this.onTap});

  final List<_CoachInsightData> insights;
  final ValueChanged<_CoachInsightData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = theme.colorScheme.secondaryContainer;
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: insights
          .map(
            (insight) => Material(
              color: cardColor,
              borderRadius: BorderRadius.circular(22),
              child: InkWell(
                borderRadius: BorderRadius.circular(22),
                onTap: () => onTap(insight),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        insight.metricValue,
                        style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(insight.title, style: theme.textTheme.titleSmall),
                      const SizedBox(height: 6),
                      Text(
                        insight.description,
                        style: theme.textTheme.bodySmall?.copyWith(height: 1.3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SupervisorMetricGrid extends StatelessWidget {
  const _SupervisorMetricGrid({required this.metrics});

  final List<_SupervisorMetricData> metrics;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.cardColor;
    final muted = theme.colorScheme.onSurface.withValues(alpha: 0.6);
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 900
            ? 3
            : constraints.maxWidth >= 600
                ? 2
                : 1;
        const spacing = 14.0;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: crossAxisCount == 1 ? 3.4 : 2.2,
          ),
          itemCount: metrics.length,
          itemBuilder: (context, index) {
            final metric = metrics[index];
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: theme.colorScheme.secondary.withValues(alpha: 0.15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(metric.label, style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
                  const Spacer(),
                  Text(metric.value, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(metric.trendLabel, style: theme.textTheme.labelMedium),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _SupervisorAlertCards extends StatelessWidget {
  const _SupervisorAlertCards({required this.alerts, required this.onTap});

  final List<_SupervisorAlertData> alerts;
  final ValueChanged<_SupervisorAlertData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: alerts
          .map(
            (alert) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, 8),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: theme.colorScheme.tertiary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(alert.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(alert.detail, style: theme.textTheme.bodySmall?.copyWith(height: 1.4)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () => onTap(alert),
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SupervisorProgramDeck extends StatelessWidget {
  const _SupervisorProgramDeck({required this.programs, required this.onTap});

  final List<_SupervisorProgramData> programs;
  final ValueChanged<_SupervisorProgramData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.cardColor;
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return Container(
            width: 260,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(program.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(program.regionLabel, style: theme.textTheme.bodySmall),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(program.statusLabel, style: TextStyle(color: theme.colorScheme.primary)),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => onTap(program),
                  child: Text(AppLocalizations.of(context).t('home_supervisor_program_action')),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BrowseHeading extends StatelessWidget {
  const _BrowseHeading({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
          ),
        ),
      ],
    );
  }
}

class _IndividualFilterData {
  const _IndividualFilterData(this.label, this.icon);

  final String label;
  final IconData icon;
}

class _ShortCourseData {
  const _ShortCourseData({required this.title, required this.category, required this.durationWeeks, required this.priceAmount, required this.formatKey, required this.assessmentKey, this.accent = Colors.white});

  final String title;
  final String category;
  final int durationWeeks;
  final String priceAmount;
  final String formatKey;
  final String assessmentKey;
  final Color accent;
}

class _TrainerSpotlightData {
  const _TrainerSpotlightData({required this.name, required this.specialty, required this.city, required this.ratingLabel});

  final String name;
  final String specialty;
  final String city;
  final String ratingLabel;
}

class _ProjectBriefData {
  const _ProjectBriefData({required this.title, required this.description, required this.submission});

  final String title;
  final String description;
  final String submission;
}

class _CoachReviewTicketData {
  const _CoachReviewTicketData({required this.learnerName, required this.track, required this.dueLabel, required this.status});

  final String learnerName;
  final String track;
  final String dueLabel;
  final String status;
}

class _CoachSessionData {
  const _CoachSessionData({required this.title, required this.slot, required this.location, required this.typeLabel});

  final String title;
  final String slot;
  final String location;
  final String typeLabel;
}

class _CoachInsightData {
  const _CoachInsightData({required this.title, required this.metricValue, required this.description});

  final String title;
  final String metricValue;
  final String description;
}

class _SupervisorMetricData {
  const _SupervisorMetricData({required this.label, required this.value, required this.trendLabel});

  final String label;
  final String value;
  final String trendLabel;
}

class _SupervisorAlertData {
  const _SupervisorAlertData({required this.title, required this.detail});

  final String title;
  final String detail;
}

class _SupervisorProgramData {
  const _SupervisorProgramData({required this.title, required this.regionLabel, required this.statusLabel});

  final String title;
  final String regionLabel;
  final String statusLabel;
}
