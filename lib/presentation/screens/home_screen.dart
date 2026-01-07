import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/app_settings_scope.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/models/user_role.dart';
import '../../core/ui_feedback.dart';
import 'browse_screen.dart';
import 'learning_screen.dart';
import 'smart_search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<_CategoryData> _buildCategories(AppLocalizations loc) {
    return [
      _CategoryData(loc.t('category_ai'), Icons.smart_toy_outlined, const Color(0xFFE8E1FF)),
      _CategoryData(loc.t('category_data'), Icons.bar_chart_outlined, const Color(0xFFD1F5FF)),
      _CategoryData(loc.t('category_cyber'), Icons.shield_outlined, const Color(0xFFFFE8D6)),
      _CategoryData(loc.t('category_product'), Icons.track_changes_outlined, const Color(0xFFFDE2FF)),
      _CategoryData(loc.t('category_ux'), Icons.design_services_outlined, const Color(0xFFE6FFF4)),
      _CategoryData(loc.t('category_leadership'), Icons.leaderboard_outlined, const Color(0xFFFFF3CC)),
    ];
  }

  List<_CourseCardData> _buildCourses(AppLocalizations loc) {
    return [
      _CourseCardData(
        title: loc.t('home_course1_title'),
        provider: 'SkillUp Global',
        duration: loc.t('home_course1_duration'),
        badge: loc.t('home_course1_badge'),
        image:
            'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?auto=format&fit=crop&w=800&q=60',
      ),
      _CourseCardData(
        title: loc.t('home_course2_title'),
        provider: 'Stanford d.school',
        duration: loc.t('home_course2_duration'),
        badge: loc.t('home_course2_badge'),
        image:
            'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?auto=format&fit=crop&w=800&q=60',
      ),
      _CourseCardData(
        title: loc.t('home_course3_title'),
        provider: 'Microsoft',
        duration: loc.t('home_course3_duration'),
        badge: loc.t('home_course3_badge'),
        image:
            'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=800&q=60',
      ),
    ];
  }

  List<_ProgramCardData> _buildPrograms(AppLocalizations loc) {
    return [
      _ProgramCardData(
        title: loc.t('home_program1_title'),
        description: loc.t('home_program1_description'),
        cohort: loc.t('home_program1_cohort'),
        seats: loc.t('home_program1_seats'),
      ),
      _ProgramCardData(
        title: loc.t('home_program2_title'),
        description: loc.t('home_program2_description'),
        cohort: loc.t('home_program2_cohort'),
        seats: loc.t('home_program2_seats'),
      ),
      _ProgramCardData(
        title: loc.t('home_program3_title'),
        description: loc.t('home_program3_description'),
        cohort: loc.t('home_program3_cohort'),
        seats: loc.t('home_program3_seats'),
      ),
    ];
  }

  List<_StatData> _buildStats(AppLocalizations loc) {
    return [
      _StatData('52K+', loc.t('home_stat_learners')),
      _StatData('180+', loc.t('home_stat_partners')),
      _StatData('94%', loc.t('home_stat_satisfaction')),
      _StatData('35', loc.t('home_stat_tracks')),
    ];
  }

  List<_TestimonialData> _buildTestimonials(AppLocalizations loc) {
    return [
      _TestimonialData(
        quote: loc.t('home_testimonial1_quote'),
        author: 'ليلى الورفلي',
        role: loc.t('home_testimonial1_role'),
      ),
      _TestimonialData(
        quote: loc.t('home_testimonial2_quote'),
        author: 'سالم كشلاف',
        role: loc.t('home_testimonial2_role'),
      ),
    ];
  }

  List<_BlogPostData> _buildBlogPosts(AppLocalizations loc) {
    return [
      _BlogPostData(
        title: loc.t('home_blog1_title'),
        tag: loc.t('home_blog1_tag'),
        readingTime: loc.t('home_blog1_time'),
      ),
      _BlogPostData(
        title: loc.t('home_blog2_title'),
        tag: loc.t('home_blog2_tag'),
        readingTime: loc.t('home_blog2_time'),
      ),
    ];
  }

  List<_VocationalDomainData> _buildVocationalDomains(AppLocalizations loc) {
    return [
      _VocationalDomainData(
        title: loc.t('home_vocational_domain_phone_title'),
        description: loc.t('home_vocational_domain_phone_desc'),
        icon: Icons.build_circle_outlined,
        color: const Color(0xFFE8F3FF),
        weeks: 4,
      ),
      _VocationalDomainData(
        title: loc.t('home_vocational_domain_electric_title'),
        description: loc.t('home_vocational_domain_electric_desc'),
        icon: Icons.electrical_services_outlined,
        color: const Color(0xFFFFF4E2),
        weeks: 6,
      ),
      _VocationalDomainData(
        title: loc.t('home_vocational_domain_mechanics_title'),
        description: loc.t('home_vocational_domain_mechanics_desc'),
        icon: Icons.handyman_outlined,
        color: const Color(0xFFEFF7F1),
        weeks: 8,
      ),
      _VocationalDomainData(
        title: loc.t('home_vocational_domain_design_title'),
        description: loc.t('home_vocational_domain_design_desc'),
        icon: Icons.palette_outlined,
        color: const Color(0xFFF8E8FF),
        weeks: 5,
      ),
      _VocationalDomainData(
        title: loc.t('home_vocational_domain_hvac_title'),
        description: loc.t('home_vocational_domain_hvac_desc'),
        icon: Icons.ac_unit_outlined,
        color: const Color(0xFFE4F8FF),
        weeks: 7,
      ),
      _VocationalDomainData(
        title: loc.t('home_vocational_domain_sales_title'),
        description: loc.t('home_vocational_domain_sales_desc'),
        icon: Icons.headset_mic_outlined,
        color: const Color(0xFFFFEAF2),
        weeks: 3,
      ),
    ];
  }

  List<_SprintCourseData> _buildSprintCourses(AppLocalizations loc) {
    return [
      _SprintCourseData(
        title: loc.t('home_vocational_sprint_phone_title'),
        focus: loc.t('home_vocational_sprint_phone_focus'),
        durationWeeks: 4,
        startLabel: loc.t('home_vocational_start_next_week'),
        priceAmount: '420',
        formatKey: 'home_vocational_format_hybrid',
      ),
      _SprintCourseData(
        title: loc.t('home_vocational_sprint_electric_title'),
        focus: loc.t('home_vocational_sprint_electric_focus'),
        durationWeeks: 6,
        startLabel: loc.t('home_vocational_start_mid_month'),
        priceAmount: '380',
        formatKey: 'home_vocational_format_onsite',
      ),
      _SprintCourseData(
        title: loc.t('home_vocational_sprint_mechanics_title'),
        focus: loc.t('home_vocational_sprint_mechanics_focus'),
        durationWeeks: 8,
        startLabel: loc.t('home_vocational_start_end_month'),
        priceAmount: '520',
        formatKey: 'home_vocational_format_dual',
      ),
      _SprintCourseData(
        title: loc.t('home_vocational_sprint_design_title'),
        focus: loc.t('home_vocational_sprint_design_focus'),
        durationWeeks: 5,
        startLabel: loc.t('home_vocational_start_next_week'),
        priceAmount: '310',
        formatKey: 'home_vocational_format_online',
      ),
      _SprintCourseData(
        title: loc.t('home_vocational_sprint_hvac_title'),
        focus: loc.t('home_vocational_sprint_hvac_focus'),
        durationWeeks: 7,
        startLabel: loc.t('home_vocational_start_mid_month'),
        priceAmount: '450',
        formatKey: 'home_vocational_format_onsite',
      ),
      _SprintCourseData(
        title: loc.t('home_vocational_sprint_sales_title'),
        focus: loc.t('home_vocational_sprint_sales_focus'),
        durationWeeks: 3,
        startLabel: loc.t('home_vocational_start_end_month'),
        priceAmount: '260',
        formatKey: 'home_vocational_format_online',
      ),
    ];
  }

  List<_PlatformFeatureData> _buildPlatformFeatures(AppLocalizations loc) {
    return [
      _PlatformFeatureData(
        title: loc.t('home_vocational_feature_projects_title'),
        description: loc.t('home_vocational_feature_projects_desc'),
        icon: Icons.cloud_upload_outlined,
      ),
      _PlatformFeatureData(
        title: loc.t('home_vocational_feature_certificate_title'),
        description: loc.t('home_vocational_feature_certificate_desc'),
        icon: Icons.qr_code_2_outlined,
      ),
      _PlatformFeatureData(
        title: loc.t('home_vocational_feature_trainers_title'),
        description: loc.t('home_vocational_feature_trainers_desc'),
        icon: Icons.wallet_travel_outlined,
      ),
      _PlatformFeatureData(
        title: loc.t('home_vocational_feature_jobs_title'),
        description: loc.t('home_vocational_feature_jobs_desc'),
        icon: Icons.work_outline,
      ),
    ];
  }

  List<_JourneyStepData> _buildJourneySteps(AppLocalizations loc) {
    return [
      _JourneyStepData(
        title: loc.t('home_vocational_journey_step1_title'),
        description: loc.t('home_vocational_journey_step1_desc'),
        icon: Icons.app_registration_outlined,
      ),
      _JourneyStepData(
        title: loc.t('home_vocational_journey_step2_title'),
        description: loc.t('home_vocational_journey_step2_desc'),
        icon: Icons.play_circle_outline,
      ),
      _JourneyStepData(
        title: loc.t('home_vocational_journey_step3_title'),
        description: loc.t('home_vocational_journey_step3_desc'),
        icon: Icons.camera_alt_outlined,
      ),
      _JourneyStepData(
        title: loc.t('home_vocational_journey_step4_title'),
        description: loc.t('home_vocational_journey_step4_desc'),
        icon: Icons.verified_outlined,
      ),
      _JourneyStepData(
        title: loc.t('home_vocational_journey_step5_title'),
        description: loc.t('home_vocational_journey_step5_desc'),
        icon: Icons.auto_awesome_mosaic,
      ),
    ];
  }

  List<_JobListingData> _buildJobListings(AppLocalizations loc) {
    return [
      _JobListingData(
        title: loc.t('home_vocational_job_phone_title'),
        company: 'Tripoli Gadgets Lab',
        location: loc.t('home_vocational_job_location_tripoli'),
        type: loc.t('home_vocational_job_type_full'),
      ),
      _JobListingData(
        title: loc.t('home_vocational_job_hvac_title'),
        company: 'Sabha Cooling Co.',
        location: loc.t('home_vocational_job_location_sabha'),
        type: loc.t('home_vocational_job_type_contract'),
      ),
      _JobListingData(
        title: loc.t('home_vocational_job_design_title'),
        company: 'Amal Studio',
        location: loc.t('home_vocational_job_location_remote'),
        type: loc.t('home_vocational_job_type_freelance'),
      ),
    ];
  }

  List<String> _buildHeroHighlights(AppLocalizations loc) {
    return [
      loc.t('home_vocational_hero_highlight1'),
      loc.t('home_vocational_hero_highlight2'),
      loc.t('home_vocational_hero_highlight3'),
    ];
  }

  List<_CoachReviewTicket> _buildCoachReviewTickets(AppLocalizations loc) {
    return [
      _CoachReviewTicket(
        learnerName: 'فرح المجبري',
        track: loc.t('home_vocational_domain_phone_title'),
        dueLabel: loc.t('home_coach_due_hours', params: {'hours': '6'}),
        status: loc.t('home_coach_status_video'),
      ),
      _CoachReviewTicket(
        learnerName: 'أيمن قرقوم',
        track: loc.t('home_vocational_domain_design_title'),
        dueLabel: loc.t('home_coach_due_tomorrow'),
        status: loc.t('home_coach_status_photos'),
      ),
      _CoachReviewTicket(
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

  void _handleLeadRequest(BuildContext context, String entryPoint) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: entryPoint,
      description: loc.t('home_lead_description'),
      actions: [
        SheetAction(
          label: loc.t('home_lead_schedule_action'),
          icon: Icons.video_call_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_lead_schedule_feedback')),
        ),
        SheetAction(
          label: loc.t('home_lead_email_action'),
          icon: Icons.mail_outline,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_lead_email_feedback')),
        ),
      ],
    );
  }

  void _handleSearch(BuildContext context, String query) {
    final loc = AppLocalizations.of(context);
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      UiFeedback.showSnack(context, loc.t('home_search_empty'));
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SmartSearchScreen(initialQuery: trimmed)),
    );
  }

  void _handleSmartRecommendations(BuildContext context) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: loc.t('home_smart_label'),
      description: loc.t('home_smart_description'),
      actions: [
        SheetAction(
          label: loc.t('home_smart_action'),
          icon: Icons.settings_suggest_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_smart_action_feedback')),
        ),
      ],
    );
  }

  void _handleCategorySelection(BuildContext context, _CategoryData category) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: category.label,
      description: loc.t('home_category_sheet_description'),
      actions: [
        SheetAction(
          label: loc.t('home_category_sheet_action'),
          icon: Icons.design_services_outlined,
          onSelected: () => UiFeedback.showSnack(
            context,
            loc.t('home_category_sheet_success', params: {'category': category.label}),
          ),
        ),
      ],
    );
  }

  void _showCourseDetails(BuildContext context, _CourseCardData course) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: course.title,
      description: loc.t(
        'home_course_sheet_description',
        params: {'provider': course.provider, 'duration': course.duration},
      ),
      actions: [
        SheetAction(
          label: loc.t('home_course_sheet_primary_action'),
          icon: Icons.key_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_course_sheet_primary_success')),
        ),
        SheetAction(
          label: loc.t('home_course_sheet_secondary_action'),
          icon: Icons.bookmark_add_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_course_sheet_secondary_success')),
        ),
      ],
    );
  }

  void _showProgramDetails(BuildContext context, _ProgramCardData program) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: program.title,
      description: '${program.description}\n${program.cohort} · ${program.seats}',
      actions: [
        SheetAction(
          label: loc.t('home_program_sheet_primary_action'),
          icon: Icons.event_seat_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_program_sheet_primary_success')),
        ),
        SheetAction(
          label: loc.t('home_program_sheet_secondary_action'),
          icon: Icons.description_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_program_sheet_secondary_success')),
        ),
      ],
    );
  }

  void _openTestimonials(BuildContext context) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: loc.t('home_testimonial_sheet_title'),
      description: loc.t('home_testimonial_sheet_description'),
      actions: [
        SheetAction(
          label: loc.t('home_testimonial_sheet_action'),
          icon: Icons.menu_book_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_testimonial_sheet_success')),
        ),
      ],
    );
  }

  void _openBlogPost(BuildContext context, _BlogPostData post) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: post.title,
      description: loc.t(
        'home_blog_sheet_description',
        params: {'tag': post.tag, 'time': post.readingTime},
      ),
      actions: [
        SheetAction(
          label: loc.t('home_blog_sheet_primary_action'),
          icon: Icons.chrome_reader_mode_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_blog_sheet_primary_success')),
        ),
        SheetAction(
          label: loc.t('home_blog_sheet_secondary_action'),
          icon: Icons.share_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_blog_sheet_secondary_success')),
        ),
      ],
    );
  }

  void _openCatalog(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const BrowseScreen()),
    );
  }

  void _openLearningDashboard(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LearningScreen()),
    );
  }

  void _handleBrochureDownload(BuildContext context) {
    UiFeedback.showSnack(context, AppLocalizations.of(context).t('home_brochure_snack'));
  }

  void _handleDomainTap(BuildContext context, _VocationalDomainData domain) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: domain.title,
      description: loc.t(
        'home_vocational_domain_sheet',
        params: {
          'description': domain.description,
          'weeks': domain.weeks.toString(),
        },
      ),
      actions: [
        SheetAction(
          label: loc.t('home_vocational_domain_action'),
          icon: Icons.lightbulb_outline,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_vocational_domain_feedback')),
        ),
      ],
    );
  }

  void _handleSprintDetails(BuildContext context, _SprintCourseData sprint) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: sprint.title,
      description: loc.t(
        'home_vocational_sprint_sheet',
        params: {
          'focus': sprint.focus,
          'duration': loc.t('home_vocational_duration_template', params: {'weeks': sprint.durationWeeks.toString()}),
        },
      ),
      actions: [
        SheetAction(
          label: loc.t('home_vocational_sprint_primary_action'),
          icon: Icons.school_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_vocational_sprint_primary_feedback')),
        ),
        SheetAction(
          label: loc.t('home_vocational_sprint_secondary_action'),
          icon: Icons.save_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_vocational_sprint_secondary_feedback')),
        ),
      ],
    );
  }

  void _handleFeatureTap(BuildContext context, _PlatformFeatureData feature) {
    UiFeedback.showSnack(context, AppLocalizations.of(context).t('home_vocational_feature_feedback', params: {'feature': feature.title}));
  }

  void _openJobDetails(BuildContext context, _JobListingData job) {
    final loc = AppLocalizations.of(context);
    UiFeedback.showActionSheet(
      context,
      title: job.title,
      description: loc.t(
        'home_vocational_job_sheet',
        params: {
          'company': job.company,
          'location': job.location,
          'type': job.type,
        },
      ),
      actions: [
        SheetAction(
          label: loc.t('home_vocational_job_action'),
          icon: Icons.send_outlined,
          onSelected: () => UiFeedback.showSnack(context, loc.t('home_vocational_job_feedback')),
        ),
      ],
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

  void _handleCoachTicket(BuildContext context, _CoachReviewTicket ticket) {
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

  void _handleCoachSession(BuildContext context, _CoachSessionData session) {
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

  void _handleCoachInsight(BuildContext context, _CoachInsightData insight) {
    UiFeedback.showSnack(context, insight.description);
  }

  void _handleSupervisorAlert(BuildContext context, _SupervisorAlertData alert) {
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

  void _handleSupervisorProgram(BuildContext context, _SupervisorProgramData program) {
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
        return _buildStudentExperience(context);
      case UserRole.coach:
        return _buildCoachExperience(context);
      case UserRole.supervisor:
        return _buildSupervisorExperience(context);
      case UserRole.employee:
        return _buildEmployeeExperience(context);
    }
  }

  Widget _buildEmployeeExperience(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final categories = _buildCategories(loc);
    final courses = _buildCourses(loc);
    final programs = _buildPrograms(loc);
    final stats = _buildStats(loc);
    final testimonials = _buildTestimonials(loc);
    final blogs = _buildBlogPosts(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              sliver: SliverList.list(
                children: [
                  _HeroSection(
                    onPrimaryTap: () => _handleLeadRequest(context, loc.t('home_hero_primary_cta')),
                    onSecondaryTap: () => _handleLeadRequest(context, loc.t('home_hero_secondary_cta')),
                  ),
                  const SizedBox(height: 32),
                  _SearchSection(
                    onSubmit: (value) => _handleSearch(context, value),
                    onSmartTap: () => _handleSmartRecommendations(context),
                  ),
                  const SizedBox(height: 24),
                  _CategorySection(
                    categories: categories,
                    onSelect: (category) => _handleCategorySelection(context, category),
                  ),
                  const SizedBox(height: 32),
                  _SectionHeader(
                    title: loc.t('home_section_featured_courses'),
                    actionLabel: loc.t('home_section_all_courses'),
                    onAction: () => _openCatalog(context),
                  ),
                  const SizedBox(height: 12),
                  _CourseCarousel(
                    courses: courses,
                    onSelect: (course) => _showCourseDetails(context, course),
                  ),
                  const SizedBox(height: 32),
                  _SectionHeader(
                    title: loc.t('home_section_exec_programs'),
                    actionLabel: loc.t('home_section_discover_programs'),
                    onAction: () => _handleLeadRequest(context, loc.t('home_exec_program_entry')),
                  ),
                  const SizedBox(height: 12),
                  _ProgramGrid(
                    programs: programs,
                    onDetails: (program) => _showProgramDetails(context, program),
                  ),
                  const SizedBox(height: 32),
                  _StatsStrip(stats: stats),
                  const SizedBox(height: 32),
                  _SectionHeader(
                    title: loc.t('home_section_testimonials'),
                    actionLabel: loc.t('home_section_success'),
                    onAction: () => _openTestimonials(context),
                  ),
                  const SizedBox(height: 12),
                  _TestimonialCards(items: testimonials),
                  const SizedBox(height: 32),
                  _SectionHeader(
                    title: loc.t('home_section_blog'),
                    actionLabel: loc.t('home_section_read_more'),
                    onAction: () => _openCatalog(context),
                  ),
                  const SizedBox(height: 12),
                  _BlogHighlights(
                    posts: blogs,
                    onTap: (post) => _openBlogPost(context, post),
                  ),
                  const SizedBox(height: 48),
                  _CTASection(
                    onBookDemo: () => _handleLeadRequest(context, loc.t('home_cta_book_demo')),
                    onDownloadBrochure: () => _handleBrochureDownload(context),
                    onViewLearning: () => _openLearningDashboard(context),
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

  Widget _buildStudentExperience(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final domains = _buildVocationalDomains(loc);
    final sprints = _buildSprintCourses(loc);
    final features = _buildPlatformFeatures(loc);
    final journeySteps = _buildJourneySteps(loc);
    final jobs = _buildJobListings(loc);
    final highlights = _buildHeroHighlights(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              sliver: SliverList.list(
                children: [
                  _VocationalHero(
                    highlights: highlights,
                    onBrowseCourses: () => _openCatalog(context),
                    onJobHub: () => _openJobHub(context),
                  ),
                  const SizedBox(height: 28),
                  _InlineHeading(
                    title: loc.t('home_vocational_domains_title'),
                    subtitle: loc.t('home_vocational_domains_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _VocationalDomainGrid(domains: domains, onSelect: (domain) => _handleDomainTap(context, domain)),
                  const SizedBox(height: 28),
                  _InlineHeading(
                    title: loc.t('home_vocational_sprints_title'),
                    subtitle: loc.t('home_vocational_sprints_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _SprintCourseCarousel(
                    sprints: sprints,
                    onSelect: (sprint) => _handleSprintDetails(context, sprint),
                  ),
                  const SizedBox(height: 28),
                  _InlineHeading(
                    title: loc.t('home_vocational_journey_title'),
                    subtitle: loc.t('home_vocational_journey_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _SkillJourney(steps: journeySteps),
                  const SizedBox(height: 28),
                  _InlineHeading(
                    title: loc.t('home_vocational_features_title'),
                    subtitle: loc.t('home_vocational_features_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _PlatformFeatureWrap(features: features, onTap: (feature) => _handleFeatureTap(context, feature)),
                  const SizedBox(height: 28),
                  _DigitalCertificatePanel(
                    onShare: () => UiFeedback.showSnack(context, loc.t('home_vocational_certificate_share')),
                  ),
                  const SizedBox(height: 28),
                  _InlineHeading(
                    title: loc.t('home_vocational_jobs_title'),
                    subtitle: loc.t('home_vocational_jobs_subtitle'),
                  ),
                  const SizedBox(height: 12),
                  _JobBoardPreview(jobs: jobs, onTap: (job) => _openJobDetails(context, job)),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoachExperience(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final tickets = _buildCoachReviewTickets(loc);
    final sessions = _buildCoachSessions(loc);
    final insights = _buildCoachInsights(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              sliver: SliverList.list(
                children: [
                  _CoachQueueSection(
                    tickets: tickets,
                    onTap: (ticket) => _handleCoachTicket(context, ticket),
                    title: loc.t('home_coach_reviews_title'),
                    subtitle: loc.t('home_coach_reviews_subtitle'),
                  ),
                  const SizedBox(height: 28),
                  _CoachSessionList(
                    sessions: sessions,
                    title: loc.t('home_coach_sessions_title'),
                    subtitle: loc.t('home_coach_sessions_subtitle'),
                    onTap: (session) => _handleCoachSession(context, session),
                  ),
                  const SizedBox(height: 28),
                  _CoachInsightStrip(
                    insights: insights,
                    title: loc.t('home_coach_insights_title'),
                    subtitle: loc.t('home_coach_insights_subtitle'),
                    onTap: (insight) => _handleCoachInsight(context, insight),
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

  Widget _buildSupervisorExperience(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final metrics = _buildSupervisorMetrics(loc);
    final alerts = _buildSupervisorAlerts(loc);
    final programs = _buildSupervisorPrograms(loc);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              sliver: SliverList.list(
                children: [
                  _SupervisorMetricPanel(
                    title: loc.t('home_supervisor_metrics_title'),
                    subtitle: loc.t('home_supervisor_metrics_subtitle'),
                    metrics: metrics,
                  ),
                  const SizedBox(height: 24),
                  _SupervisorAlertList(
                    title: loc.t('home_supervisor_alerts_title'),
                    subtitle: loc.t('home_supervisor_alerts_subtitle'),
                    alerts: alerts,
                    onTap: (alert) => _handleSupervisorAlert(context, alert),
                  ),
                  const SizedBox(height: 24),
                  _SupervisorProgramGrid(
                    title: loc.t('home_supervisor_programs_title'),
                    subtitle: loc.t('home_supervisor_programs_subtitle'),
                    programs: programs,
                    onTap: (program) => _handleSupervisorProgram(context, program),
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

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.onPrimaryTap, required this.onSecondaryTap});

  final VoidCallback onPrimaryTap;
  final VoidCallback onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    final chips = [
      loc.t('home_hero_chip_exec'),
      loc.t('home_hero_chip_experts'),
      loc.t('home_hero_chip_projects'),
    ];
    final headline = theme.textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.w700,
      height: 1.3,
      color: Colors.white,
    );
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4B2FB9), Color(0xFF8F5CF8)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            left: -50,
            child: _HeroOrb(color: Colors.white.withOpacity(0.08), size: 160),
          ),
          Positioned(
            bottom: -30,
            right: -30,
            child: _HeroOrb(color: Colors.white.withOpacity(0.12), size: 120),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(loc.t('home_hero_title'), style: headline),
              const SizedBox(height: 12),
              Text(
                loc.t('home_hero_description'),
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white.withOpacity(0.9)),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: chips.map((label) => _HeroChip(label: label)).toList(),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4B2FB9),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: onPrimaryTap,
                    child: Text(loc.t('home_hero_primary_cta')),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white.withOpacity(0.4)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: onSecondaryTap,
                    child: Text(loc.t('home_hero_secondary_cta')),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchSection extends StatelessWidget {
  const _SearchSection({
    required this.onSubmit,
    required this.onSmartTap,
  });
  final ValueChanged<String> onSubmit;
  final VoidCallback onSmartTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    final accent = theme.colorScheme.primary;
    final surface = theme.cardColor ?? theme.colorScheme.surface;
    final highlight = theme.colorScheme.primaryContainer.withOpacity(theme.brightness == Brightness.dark ? 0.2 : 0.6);
    final hintColor = theme.colorScheme.onSurface.withOpacity(0.5);
    return Material(
      color: surface,
      elevation: 8,
      shadowColor: Colors.black12,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.search, color: accent),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: onSubmit,
                decoration: InputDecoration(
                  hintText: loc.t('home_search_hint'),
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(color: hintColor),
                  border: InputBorder.none,
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onSmartTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: highlight,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.auto_awesome_outlined, size: 16, color: accent),
                    const SizedBox(width: 6),
                    Text(loc.t('home_smart_label')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({required this.categories, required this.onSelect});

  final List<_CategoryData> categories;
  final ValueChanged<_CategoryData> onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: categories
          .map(
            (data) => Material(
              color: data.color,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => onSelect(data),
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(data.icon, color: const Color(0xFF2D1A75)),
                      const SizedBox(height: 12),
                      Text(
                        data.label,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
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

class _CourseCarousel extends StatelessWidget {
  const _CourseCarousel({required this.courses, required this.onSelect});

  final List<_CourseCardData> courses;
  final ValueChanged<_CourseCardData> onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return SizedBox(
            width: 280,
            child: Material(
              borderRadius: BorderRadius.circular(24),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => onSelect(course),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(course.image, fit: BoxFit.cover),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.75), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(course.badge, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.domain, size: 16, color: Colors.white70),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  course.provider,
                                  style: const TextStyle(color: Colors.white70),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.schedule, size: 16, color: Colors.white70),
                              const SizedBox(width: 6),
                              Text(course.duration, style: const TextStyle(color: Colors.white70)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProgramGrid extends StatelessWidget {
  const _ProgramGrid({required this.programs, required this.onDetails});

  final List<_ProgramCardData> programs;
  final ValueChanged<_ProgramCardData> onDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = width >= 1000
            ? 3
            : width >= 680
                ? 2
                : 1;
        const spacing = 16.0;
        final totalSpacing = spacing * (crossAxisCount - 1);
        final itemWidth = (width - totalSpacing) / crossAxisCount;
        final desiredHeight = crossAxisCount == 1
            ? 220.0
            : crossAxisCount == 2
                ? 260.0
                : 240.0;
        final childAspectRatio = itemWidth / desiredHeight;

        return GridView.builder(
          itemCount: programs.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
          ),
          itemBuilder: (context, index) {
            final program = programs[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.cardColor ?? theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(theme.brightness == Brightness.dark ? 0.35 : 0.08),
                    offset: const Offset(0, 12),
                    blurRadius: 32,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.rocket_launch_outlined, color: Colors.deepPurple[300]),
                      const Spacer(),
                      Text(
                        program.seats,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.deepPurple),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    program.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      program.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[600], height: 1.4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(program.cohort, style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => onDetails(program),
                    child: Text(loc.t('home_program_details_button')),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _StatsStrip extends StatelessWidget {
  const _StatsStrip({required this.stats});

  final List<_StatData> stats;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final onInverse = colorScheme.onInverseSurface;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: stats
            .map(
              (item) => Expanded(
                child: Column(
                  children: [
                    Text(
                      item.value,
                      style: TextStyle(color: onInverse, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(item.label, style: TextStyle(color: onInverse.withOpacity(0.75))),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TestimonialCards extends StatelessWidget {
  const _TestimonialCards({required this.items});

  final List<_TestimonialData> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.cardColor ?? theme.colorScheme.surface;
    final borderColor = theme.brightness == Brightness.dark ? Colors.white.withOpacity(0.08) : const Color(0xFFE7E4FB);
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            width: 260,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.format_quote, color: Colors.deepPurple[200]),
                const SizedBox(height: 12),
                Expanded(
                  child: Text(
                    item.quote,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),
                ),
                const SizedBox(height: 12),
                Text(item.author, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                Text(item.role, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BlogHighlights extends StatelessWidget {
  const _BlogHighlights({required this.posts, required this.onTap});

  final List<_BlogPostData> posts;
  final ValueChanged<_BlogPostData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.cardColor ?? theme.colorScheme.surface;
    final shadowColor = Colors.black.withOpacity(theme.brightness == Brightness.dark ? 0.35 : 0.08);
    final badgeColor = theme.colorScheme.primaryContainer.withOpacity(theme.brightness == Brightness.dark ? 0.25 : 0.5);
    final badgeTextColor = theme.colorScheme.primary;
    return Column(
      children: posts
          .map(
            (post) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: shadowColor, offset: const Offset(0, 10), blurRadius: 30),
                ],
              ),
              child: Material(
                color: surface,
                borderRadius: BorderRadius.circular(24),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () => onTap(post),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            post.tag,
                            style: TextStyle(color: badgeTextColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Text(post.readingTime, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => onTap(post),
                          icon: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CTASection extends StatelessWidget {
  const _CTASection({
    required this.onBookDemo,
    required this.onDownloadBrochure,
    required this.onViewLearning,
  });

  final VoidCallback onBookDemo;
  final VoidCallback onDownloadBrochure;
  final VoidCallback onViewLearning;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF101726), Color(0xFF283B60)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.t('home_cta_title'),
            style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            loc.t('home_cta_description'),
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF101726),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                ),
                onPressed: onBookDemo,
                child: Text(loc.t('home_cta_book_demo')),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white.withOpacity(0.4)),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                ),
                onPressed: onDownloadBrochure,
                child: Text(loc.t('home_cta_download_brochure')),
              ),
              TextButton(
                onPressed: onViewLearning,
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: Text(loc.t('home_cta_view_learning')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onAction,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        TextButton(onPressed: onAction, child: Text(actionLabel)),
      ],
    );
  }
}

class _HeroOrb extends StatelessWidget {
  const _HeroOrb({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 7,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(size)),
      ),
    );
  }
}

class _HeroChip extends StatelessWidget {
  const _HeroChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}

class _CategoryData {
  const _CategoryData(this.label, this.icon, this.color);

  final String label;
  final IconData icon;
  final Color color;
}

class _CourseCardData {
  const _CourseCardData({
    required this.title,
    required this.provider,
    required this.duration,
    required this.badge,
    required this.image,
  });

  final String title;
  final String provider;
  final String duration;
  final String badge;
  final String image;
}

class _ProgramCardData {
  const _ProgramCardData({
    required this.title,
    required this.description,
    required this.cohort,
    required this.seats,
  });

  final String title;
  final String description;
  final String cohort;
  final String seats;
}

class _StatData {
  const _StatData(this.value, this.label);

  final String value;
  final String label;
}

class _TestimonialData {
  const _TestimonialData({required this.quote, required this.author, required this.role});

  final String quote;
  final String author;
  final String role;
}

class _BlogPostData {
  const _BlogPostData({required this.title, required this.tag, required this.readingTime});

  final String title;
  final String tag;
  final String readingTime;
}

class _CoachReviewTicket {
  const _CoachReviewTicket({required this.learnerName, required this.track, required this.dueLabel, required this.status});

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

class _CoachQueueSection extends StatelessWidget {
  const _CoachQueueSection({required this.tickets, required this.onTap, required this.title, required this.subtitle});

  final List<_CoachReviewTicket> tickets;
  final ValueChanged<_CoachReviewTicket> onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurface.withOpacity(0.65);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
        const SizedBox(height: 16),
        ...tickets.map(
          (ticket) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: theme.colorScheme.primary.withOpacity(0.12)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ticket.learnerName, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(ticket.track, style: theme.textTheme.bodySmall),
                      const SizedBox(height: 6),
                      Text(ticket.dueLabel, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary)),
                      Text(ticket.status, style: theme.textTheme.labelSmall),
                    ],
                  ),
                ),
                IconButton(onPressed: () => onTap(ticket), icon: const Icon(Icons.open_in_new_outlined)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CoachSessionList extends StatelessWidget {
  const _CoachSessionList({required this.sessions, required this.title, required this.subtitle, required this.onTap});

  final List<_CoachSessionData> sessions;
  final String title;
  final String subtitle;
  final ValueChanged<_CoachSessionData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurface.withOpacity(0.65);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
        const SizedBox(height: 16),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              return Container(
                width: 240,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: theme.shadowColor.withOpacity(0.08), offset: const Offset(0, 10), blurRadius: 24)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(session.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(session.slot, style: theme.textTheme.bodySmall?.copyWith(color: muted)),
                    Text(session.location, style: theme.textTheme.bodySmall),
                    const Spacer(),
                    Row(
                      children: [
                        Chip(label: Text(session.typeLabel)),
                        const Spacer(),
                        IconButton(onPressed: () => onTap(session), icon: const Icon(Icons.play_arrow_rounded)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CoachInsightStrip extends StatelessWidget {
  const _CoachInsightStrip({required this.insights, required this.title, required this.subtitle, required this.onTap});

  final List<_CoachInsightData> insights;
  final String title;
  final String subtitle;
  final ValueChanged<_CoachInsightData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurface.withOpacity(0.65);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: insights
              .map(
                (insight) => GestureDetector(
                  onTap: () => onTap(insight),
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: theme.colorScheme.primary.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(insight.title, style: theme.textTheme.bodySmall?.copyWith(color: muted)),
                        const SizedBox(height: 8),
                        Text(insight.metricValue, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(insight.description, style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _SupervisorMetricPanel extends StatelessWidget {
  const _SupervisorMetricPanel({required this.title, required this.subtitle, required this.metrics});

  final String title;
  final String subtitle;
  final List<_SupervisorMetricData> metrics;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurface.withOpacity(0.65);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF101726), Color(0xFF1E3052)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70)),
          const SizedBox(height: 18),
          Row(
            children: metrics
                .map(
                  (metric) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(metric.label, style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70)),
                          const SizedBox(height: 6),
                          Text(metric.value, style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text(metric.trendLabel, style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SupervisorAlertList extends StatelessWidget {
  const _SupervisorAlertList({required this.title, required this.subtitle, required this.alerts, required this.onTap});

  final String title;
  final String subtitle;
  final List<_SupervisorAlertData> alerts;
  final ValueChanged<_SupervisorAlertData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurface.withOpacity(0.65);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
        const SizedBox(height: 16),
        ...alerts.map(
          (alert) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: theme.colorScheme.error.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(alert.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(alert.detail, style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
                IconButton(onPressed: () => onTap(alert), icon: const Icon(Icons.manage_history_outlined)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SupervisorProgramGrid extends StatelessWidget {
  const _SupervisorProgramGrid({required this.title, required this.subtitle, required this.programs, required this.onTap});

  final String title;
  final String subtitle;
  final List<_SupervisorProgramData> programs;
  final ValueChanged<_SupervisorProgramData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurface.withOpacity(0.65);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: programs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.4,
          ),
          itemBuilder: (context, index) {
            final program = programs[index];
            return Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: theme.colorScheme.primary.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(program.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(program.regionLabel, style: theme.textTheme.bodySmall),
                  const Spacer(),
                  Row(
                    children: [
                      Text(program.statusLabel, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary)),
                      const Spacer(),
                      IconButton(onPressed: () => onTap(program), icon: const Icon(Icons.visibility_outlined)),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _VocationalDomainData {
  const _VocationalDomainData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.weeks,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final int weeks;
}

class _SprintCourseData {
  const _SprintCourseData({
    required this.title,
    required this.focus,
    required this.durationWeeks,
    required this.startLabel,
    required this.priceAmount,
    required this.formatKey,
  });

  final String title;
  final String focus;
  final int durationWeeks;
  final String startLabel;
  final String priceAmount;
  final String formatKey;
}

class _PlatformFeatureData {
  const _PlatformFeatureData({required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final IconData icon;
}

class _JourneyStepData {
  const _JourneyStepData({required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final IconData icon;
}

class _JobListingData {
  const _JobListingData({required this.title, required this.company, required this.location, required this.type});

  final String title;
  final String company;
  final String location;
  final String type;
}

class _VocationalHero extends StatelessWidget {
  const _VocationalHero({required this.highlights, required this.onBrowseCourses, required this.onJobHub});

  final List<String> highlights;
  final VoidCallback onBrowseCourses;
  final VoidCallback onJobHub;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final badgeColor = Colors.white.withOpacity(0.15);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0A2F4F), Color(0xFF14507A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.t('home_vocational_hero_title'),
            style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, height: 1.3),
          ),
          const SizedBox(height: 10),
          Text(
            loc.t('home_vocational_hero_description'),
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70, height: 1.5),
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final chipMaxWidth = math.min(constraints.maxWidth, 360.0);
              return Wrap(
                spacing: 12,
                runSpacing: 8,
                children: highlights
                    .map(
                      (highlight) => ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: chipMaxWidth),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(20)),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: const Icon(Icons.check_circle_outline, size: 16, color: Colors.white),
                                  ),
                                ),
                                TextSpan(text: highlight, style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                            softWrap: true,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: onBrowseCourses,
                icon: const Icon(Icons.play_circle_outline),
                label: Text(loc.t('home_vocational_hero_primary_cta')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0A2F4F),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
              ),
              OutlinedButton.icon(
                onPressed: onJobHub,
                icon: const Icon(Icons.badge_outlined, color: Colors.white),
                label: Text(loc.t('home_vocational_hero_secondary_cta')),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white.withOpacity(0.4)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InlineHeading extends StatelessWidget {
  const _InlineHeading({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.65))),
      ],
    );
  }
}

class _VocationalDomainGrid extends StatelessWidget {
  const _VocationalDomainGrid({required this.domains, required this.onSelect});

  final List<_VocationalDomainData> domains;
  final ValueChanged<_VocationalDomainData> onSelect;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = width >= 1100
            ? 3
            : width >= 720
                ? 2
                : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: domains.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: crossAxisCount == 1 ? 1.7 : 1.4,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
          ),
          itemBuilder: (context, index) {
            final domain = domains[index];
            return Material(
              color: domain.color,
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => onSelect(domain),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(domain.icon, size: 32, color: Colors.black.withOpacity(0.5)),
                      const SizedBox(height: 10),
                      Text(domain.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Expanded(
                        child: Text(domain.description, style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.4)),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        loc.t('home_vocational_duration_template', params: {'weeks': domain.weeks.toString()}),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _SprintCourseCarousel extends StatelessWidget {
  const _SprintCourseCarousel({required this.sprints, required this.onSelect});

  final List<_SprintCourseData> sprints;
  final ValueChanged<_SprintCourseData> onSelect;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: sprints.length,
        itemBuilder: (context, index) {
          final sprint = sprints[index];
          return SizedBox(
            width: 280,
            child: Material(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).cardColor,
              elevation: 4,
              shadowColor: Colors.black12,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => onSelect(sprint),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sprint.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Expanded(
                        child: Text(sprint.focus, style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5)),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 16, color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 4),
                          Text(loc.t('home_vocational_duration_template', params: {'weeks': sprint.durationWeeks.toString()})),
                          const Spacer(),
                          Text(loc.t('home_vocational_price_template', params: {'amount': sprint.priceAmount}), style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.event_available_outlined, size: 16),
                          const SizedBox(width: 4),
                          Text(sprint.startLabel, style: Theme.of(context).textTheme.labelMedium),
                          const Spacer(),
                          Text(loc.t(sprint.formatKey), style: Theme.of(context).textTheme.labelSmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SkillJourney extends StatelessWidget {
  const _SkillJourney({required this.steps});

  final List<_JourneyStepData> steps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.colorScheme.primary.withOpacity(0.3);
    return Column(
      children: steps.asMap().entries.map((entry) {
        final isLast = entry.key == steps.length - 1;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.12),
                  child: Icon(entry.value.icon, color: theme.colorScheme.primary),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 32,
                    color: dividerColor,
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.value.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(entry.value.description, style: theme.textTheme.bodySmall?.copyWith(height: 1.4)),
                  if (!isLast) const SizedBox(height: 18),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _PlatformFeatureWrap extends StatelessWidget {
  const _PlatformFeatureWrap({required this.features, required this.onTap});

  final List<_PlatformFeatureData> features;
  final ValueChanged<_PlatformFeatureData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: features
          .map(
            (feature) => Material(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => onTap(feature),
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(feature.icon, color: theme.colorScheme.primary),
                      const SizedBox(height: 10),
                      Text(feature.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(feature.description, style: theme.textTheme.bodySmall?.copyWith(height: 1.4)),
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

class _DigitalCertificatePanel extends StatelessWidget {
  const _DigitalCertificatePanel({required this.onShare});

  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1F2A44), Color(0xFF344968)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.verified_outlined, color: Colors.white),
              const SizedBox(width: 8),
              Text(loc.t('home_vocational_certificate_title'), style: theme.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Text(loc.t('home_vocational_certificate_subtitle'), style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70, height: 1.4)),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onShare,
            icon: const Icon(Icons.share_outlined),
            label: Text(loc.t('home_vocational_certificate_button')),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF1F2A44),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _JobBoardPreview extends StatelessWidget {
  const _JobBoardPreview({required this.jobs, required this.onTap});

  final List<_JobListingData> jobs;
  final ValueChanged<_JobListingData> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: jobs
          .map(
            (job) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: theme.colorScheme.primary.withOpacity(0.12)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(job.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('${job.company} · ${job.location}', style: theme.textTheme.bodySmall?.copyWith(height: 1.4)),
                        const SizedBox(height: 6),
                        Text(job.type, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary)),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () => onTap(job), icon: const Icon(Icons.open_in_new_outlined)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
