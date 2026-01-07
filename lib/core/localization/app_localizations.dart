import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  static const List<Locale> supportedLocales = [Locale('ar', 'LY'), Locale('en', 'US')];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ?? AppLocalizations(const Locale('ar', 'LY'));
  }

  String t(String key, {Map<String, String> params = const {}}) {
    final translations = _localizedValues[key];
    var value = translations?[locale.languageCode] ?? translations?['ar'] ?? key;
    if (params.isNotEmpty) {
      params.forEach((placeholder, substitution) {
        value = value.replaceAll('{{$placeholder}}', substitution);
      });
    }
    return value;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.map((e) => e.languageCode).contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

const Map<String, Map<String, String>> _localizedValues = {
  'app_name': {
    'ar': 'SkillUp Libya',
    'en': 'SkillUp Libya',
  },
  'action_close': {
    'ar': 'إغلاق',
    'en': 'Close',
  },
  'nav_home': {
    'ar': 'الرئيسية',
    'en': 'Home',
  },
  'nav_browse': {
    'ar': 'تصفح',
    'en': 'Browse',
  },
  'nav_learning': {
    'ar': 'تعليمي',
    'en': 'Learning',
  },
  'nav_profile': {
    'ar': 'حسابي',
    'en': 'Profile',
  },
  'language_arabic': {
    'ar': 'العربية',
    'en': 'Arabic',
  },
  'language_english': {
    'ar': 'الإنجليزية',
    'en': 'English',
  },
  'home_hero_title': {
    'ar': 'ارفع جاهزية فرقك الرقمية',
    'en': "Elevate your teams' digital readiness",
  },
  'home_hero_description': {
    'ar': 'منصّة تعليمية عربية تربط شركتك بخبرات عالمية ومسارات عملية في الذكاء الاصطناعي، البيانات، والقيادة الحديثة.',
    'en': 'An Arabic learning platform that connects your company with global experts and hands-on tracks in AI, data, and modern leadership.',
  },
  'home_hero_chip_exec': {
    'ar': 'معسكرات تنفيذية للشركات',
    'en': 'Executive bootcamps for companies',
  },
  'home_hero_chip_experts': {
    'ar': 'خبراء عالميون',
    'en': 'Global experts',
  },
  'home_hero_chip_projects': {
    'ar': 'مشاريع واقعية',
    'en': 'Real-world projects',
  },
  'home_hero_primary_cta': {
    'ar': 'ابدأ التقييم المجاني',
    'en': 'Start free assessment',
  },
  'home_hero_secondary_cta': {
    'ar': 'تحدث مع خبير',
    'en': 'Talk to an expert',
  },
  'home_search_hint': {
    'ar': 'ابحث عن مسار، مهارة، أو شركة...',
    'en': 'Search for a track, skill, or company...',
  },
  'home_smart_label': {
    'ar': 'توصيات ذكية',
    'en': 'Smart picks',
  },
  'home_lead_description': {
    'ar': 'سنرتب اتصالاً مع مستشارينا خلال 24 ساعة لتفصيل الخيارات الأنسب لفريقك.',
    'en': 'We will arrange a call with our advisors within 24 hours to tailor the best options for your team.',
  },
  'home_lead_schedule_action': {
    'ar': 'جدولة مكالمة عبر Teams',
    'en': 'Schedule a Teams call',
  },
  'home_lead_schedule_feedback': {
    'ar': 'تم إرسال رابط الجدولة إلى بريدك.',
    'en': 'We sent the scheduling link to your email.',
  },
  'home_lead_email_action': {
    'ar': 'تواصل عبر البريد الآن',
    'en': 'Email me the details now',
  },
  'home_lead_email_feedback': {
    'ar': 'أرسلنا لك بريداً يحتوي على جميع التفاصيل.',
    'en': 'We just emailed every detail to you.',
  },
  'home_search_empty': {
    'ar': 'أدخل عبارة للبحث أولاً.',
    'en': 'Enter a search phrase first.',
  },
  'home_smart_description': {
    'ar': 'اخترنا لك 3 مسارات مبنية على الأهداف التي حدّدتها سابقاً. يمكنك تعديل التفضيلات في أي وقت.',
    'en': 'We curated three tracks based on the goals you set earlier. You can adjust preferences anytime.',
  },
  'home_smart_action': {
    'ar': 'تحديث البيانات الأساسية',
    'en': 'Update profile inputs',
  },
  'home_smart_action_feedback': {
    'ar': 'يمكنك تعديل تفضيلاتك من صفحة الحساب.',
    'en': 'You can adjust your preferences from the account page.',
  },
  'home_category_sheet_description': {
    'ar': 'سنقترح عليك ورش عمل ومسارات مرتبطة بهذه الفئة مع إمكانية تخصيص محتوى لكل فريق.',
    'en': 'We will suggest workshops and tracks tied to this category with per-team customization.',
  },
  'home_category_sheet_action': {
    'ar': 'طلب جلسة تصميم',
    'en': 'Request design session',
  },
  'home_category_sheet_success': {
    'ar': 'تم حجز جلسة تصميم لمسار {{category}}.',
    'en': 'Booked a design session for the {{category}} track.',
  },
  'home_course_sheet_description': {
    'ar': 'مقدم من {{provider}} · المدة {{duration}}. يمكننا فتح مقعد تجريبي لثلاثة أعضاء من فريقك.',
    'en': 'Hosted by {{provider}} · Duration {{duration}}. We can unlock a trial seat for three teammates.',
  },
  'home_course_sheet_primary_action': {
    'ar': 'طلب مقعد تجريبي',
    'en': 'Request trial seat',
  },
  'home_course_sheet_primary_success': {
    'ar': 'سيتم تفعيل المقعد خلال 12 ساعة.',
    'en': 'The trial seat activates within 12 hours.',
  },
  'home_course_sheet_secondary_action': {
    'ar': 'إضافة لقائمة الاهتمام',
    'en': 'Add to watchlist',
  },
  'home_course_sheet_secondary_success': {
    'ar': 'أضفنا الدورة إلى مفضلتك.',
    'en': 'Added the course to your favorites.',
  },
  'home_program_sheet_primary_action': {
    'ar': 'حجز مقاعد للفريق',
    'en': 'Reserve seats for the team',
  },
  'home_program_sheet_primary_success': {
    'ar': 'سيتم التواصل لتأكيد عدد المقاعد.',
    'en': 'We will reach out to confirm the seat count.',
  },
  'home_program_sheet_secondary_action': {
    'ar': 'تحميل المنهج التفصيلي',
    'en': 'Download detailed syllabus',
  },
  'home_program_sheet_secondary_success': {
    'ar': 'أرسلنا نسخة من المنهج إلى بريدك.',
    'en': 'Sent the syllabus to your email.',
  },
  'home_testimonial_sheet_title': {
    'ar': 'قصص النجاح',
    'en': 'Success stories',
  },
  'home_testimonial_sheet_description': {
    'ar': 'اطلع على حالات الاستخدام التفصيلية للشركات الليبية التي تعاونت معنا خلال 2025.',
    'en': 'Browse detailed case studies for Libyan companies that worked with us in 2025.',
  },
  'home_testimonial_sheet_action': {
    'ar': 'عرض ملف قصص النجاح',
    'en': 'Open success stories file',
  },
  'home_testimonial_sheet_success': {
    'ar': 'تم فتح ملف قصص النجاح.',
    'en': 'Opened the success stories dossier.',
  },
  'home_blog_sheet_description': {
    'ar': 'وسم: {{tag}} · قراءة في {{time}}. سنرسل لك الملخص التنفيذي وروابط التسجيل في الندوة القادمة.',
    'en': 'Tag: {{tag}} · Reading time {{time}}. We will send the executive brief and webinar links.',
  },
  'home_blog_sheet_primary_action': {
    'ar': 'اقرأ الملخص الآن',
    'en': 'Read the brief now',
  },
  'home_blog_sheet_primary_success': {
    'ar': 'فتحنا لك الملخص داخل التطبيق.',
    'en': 'Opened the brief inside the app.',
  },
  'home_blog_sheet_secondary_action': {
    'ar': 'شارك مع فريقي',
    'en': 'Share with my team',
  },
  'home_blog_sheet_secondary_success': {
    'ar': 'أرسلنا الرابط إلى مساحة الفريق.',
    'en': 'Shared the link with your team space.',
  },
  'home_brochure_snack': {
    'ar': 'جارٍ تجهيز نسخة PDF محدثة بالكتيّب التنفيذي.',
    'en': 'Preparing the latest executive brochure PDF.',
  },
  'home_section_featured_courses': {
    'ar': 'أبرز الدورات',
    'en': 'Featured courses',
  },
  'home_section_all_courses': {
    'ar': 'استعرض كل الدورات',
    'en': 'Browse all courses',
  },
  'home_section_exec_programs': {
    'ar': 'برامج تنفيذية للقادة',
    'en': 'Executive programs for leaders',
  },
  'home_section_discover_programs': {
    'ar': 'اكتشف البرامج',
    'en': 'Discover programs',
  },
  'home_section_testimonials': {
    'ar': 'شهادات عملائنا',
    'en': 'Client testimonials',
  },
  'home_section_success': {
    'ar': 'قصص النجاح',
    'en': 'Success stories',
  },
  'home_section_blog': {
    'ar': 'من مدونتنا',
    'en': 'From our blog',
  },
  'home_section_read_more': {
    'ar': 'قراءة المزيد',
    'en': 'Read more',
  },
  'home_program_details_button': {
    'ar': 'تفاصيل البرنامج',
    'en': 'Program details',
  },
  'home_cta_title': {
    'ar': 'ماذا عن خارطة مهارات شركتك؟',
    'en': "What about your company's skills map?",
  },
  'home_cta_description': {
    'ar': 'نصمّم لكم تجربة تعلم مخصصة مع قياس العائد على الاستثمار خلال 90 يوماً.',
    'en': 'We design a tailored learning experience and measure ROI within 90 days.',
  },
  'home_cta_book_demo': {
    'ar': 'احجز عرضاً مباشراً',
    'en': 'Book a live demo',
  },
  'home_cta_download_brochure': {
    'ar': 'تحميل الكتيّب التنفيذي',
    'en': 'Download executive brochure',
  },
  'home_cta_view_learning': {
    'ar': 'استعرض لوحة التعلم',
    'en': 'Open learning dashboard',
  },
  'home_exec_program_entry': {
    'ar': 'طلب برنامج تنفيذي',
    'en': 'Request executive program',
  },
  'category_ai': {
    'ar': 'الذكاء الاصطناعي',
    'en': 'Artificial intelligence',
  },
  'category_data': {
    'ar': 'تحليل البيانات',
    'en': 'Data analytics',
  },
  'category_cyber': {
    'ar': 'الأمن السيبراني',
    'en': 'Cybersecurity',
  },
  'category_product': {
    'ar': 'إدارة المنتجات',
    'en': 'Product management',
  },
  'category_ux': {
    'ar': 'تجربة المستخدم',
    'en': 'User experience',
  },
  'category_leadership': {
    'ar': 'القيادة الرقمية',
    'en': 'Digital leadership',
  },
  'home_course1_title': {
    'ar': 'أساسيات الذكاء الاصطناعي التطبيقي',
    'en': 'Applied AI fundamentals',
  },
  'home_course1_duration': {
    'ar': '6 أسابيع',
    'en': '6 weeks',
  },
  'home_course1_badge': {
    'ar': 'مستوى متقدم',
    'en': 'Advanced level',
  },
  'home_course2_title': {
    'ar': 'تصميم المنتجات الرقمية باستخدام التفكير التصميمي',
    'en': 'Design thinking for digital products',
  },
  'home_course2_duration': {
    'ar': '4 أسابيع',
    'en': '4 weeks',
  },
  'home_course2_badge': {
    'ar': 'أكثر طلباً',
    'en': 'Most in demand',
  },
  'home_course3_title': {
    'ar': 'تحليلات الأعمال باستخدام بايثون وPower BI',
    'en': 'Business analytics with Python & Power BI',
  },
  'home_course3_duration': {
    'ar': '8 أسابيع',
    'en': '8 weeks',
  },
  'home_course3_badge': {
    'ar': 'شهادة احترافية',
    'en': 'Professional certificate',
  },
  'home_program1_title': {
    'ar': 'برنامج القادة الرقميين',
    'en': 'Digital leaders program',
  },
  'home_program1_description': {
    'ar': 'رحلة مكثفة لمديري المنتجات وقادة التحول الرقمي.',
    'en': 'An intensive journey for product leads and digital transformation heads.',
  },
  'home_program1_cohort': {
    'ar': 'المجموعة القادمة: مارس 2026',
    'en': 'Next cohort: March 2026',
  },
  'home_program1_seats': {
    'ar': '30 مقعداً فقط',
    'en': 'Only 30 seats',
  },
  'home_program2_title': {
    'ar': 'أكاديمية علم البيانات',
    'en': 'Data science academy',
  },
  'home_program2_description': {
    'ar': 'من الإحصاء حتى نشر النماذج عبر مشاريع واقعية.',
    'en': 'From statistics to deployment through real projects.',
  },
  'home_program2_cohort': {
    'ar': 'بدء يونيو 2026',
    'en': 'Starts June 2026',
  },
  'home_program2_seats': {
    'ar': 'نظام هجين',
    'en': 'Hybrid delivery',
  },
  'home_program3_title': {
    'ar': 'معسكر الأمن السيبراني',
    'en': 'Cybersecurity camp',
  },
  'home_program3_description': {
    'ar': 'تدريب عملي على الحماية والهجمات ونظم الاستجابة.',
    'en': 'Hands-on defense, attack simulations, and incident response.',
  },
  'home_program3_cohort': {
    'ar': 'طلب الآن',
    'en': 'Apply now',
  },
  'home_program3_seats': {
    'ar': 'معدل قبول 18%',
    'en': '18% acceptance rate',
  },
  'home_stat_learners': {
    'ar': 'متعلّم نشط',
    'en': 'Active learners',
  },
  'home_stat_partners': {
    'ar': 'شريك عالمي',
    'en': 'Global partners',
  },
  'home_stat_satisfaction': {
    'ar': 'رضا الشركات',
    'en': 'Enterprise satisfaction',
  },
  'home_stat_tracks': {
    'ar': 'مساراً احترافياً',
    'en': 'Career tracks',
  },
  'home_testimonial1_quote': {
    'ar': 'البرنامج المسرِّع للذكاء الاصطناعي غيّر طريقة تفكير فريقنا خلال ثمانية أسابيع فقط.',
    'en': 'The AI accelerator reshaped how our team thinks in just eight weeks.',
  },
  'home_testimonial1_role': {
    'ar': 'مديرة التحول الرقمي - المصرف الليبي للتجارة',
    'en': 'Digital Transformation Director – Libyan Trade Bank',
  },
  'home_testimonial2_quote': {
    'ar': 'مزجٌ متقن بين الخبرة الدولية والسياق المحلي، وهو ما نحتاجه فعلاً لفرقنا.',
    'en': 'A precise mix of international expertise and local context—exactly what our teams need.',
  },
  'home_testimonial2_role': {
    'ar': 'رئيس المنتجات - مجموعة المدار',
    'en': 'Head of Product – Almadar Group',
  },
  'home_blog1_title': {
    'ar': 'كيف تعيد الشركات الليبية رسم خارطة المهارات الرقمية؟',
    'en': 'How Libyan companies redraw their digital skills map',
  },
  'home_blog1_tag': {
    'ar': 'رؤى قيادية',
    'en': 'Leadership insights',
  },
  'home_blog1_time': {
    'ar': '7 دقائق',
    'en': '7 min read',
  },
  'home_blog2_title': {
    'ar': 'مسارات سريعة لدخول قطاع الذكاء الاصطناعي في 2026',
    'en': 'Fast tracks to enter the AI sector in 2026',
  },
  'home_blog2_tag': {
    'ar': 'تقارير مستقبلية',
    'en': 'Future reports',
  },
  'home_blog2_time': {
    'ar': '5 دقائق',
    'en': '5 min read',
  },
  'profile_snack_updated': {
    'ar': 'تم تحديث الملف الشخصي.',
    'en': 'Profile updated successfully.',
  },
  'profile_pref_toggle_on': {
    'ar': 'فعّلنا {{item}}.',
    'en': 'Enabled {{item}}.',
  },
  'profile_pref_toggle_off': {
    'ar': 'أوقفنا {{item}}.',
    'en': 'Disabled {{item}}.',
  },
  'profile_support_description': {
    'ar': 'سيتم تحويل طلبك للفريق المختص خلال 24 ساعة.',
    'en': 'We will route your request to the right team within 24 hours.',
  },
  'profile_support_action': {
    'ar': 'إرسال الطلب الآن',
    'en': 'Send request now',
  },
  'profile_support_success': {
    'ar': 'تم تسجيل الطلب بنجاح.',
    'en': 'Request logged successfully.',
  },
  'profile_account_plan': {
    'ar': 'خطة الشركات المستوى البلاتيني',
    'en': 'Platinum enterprise plan',
  },
  'profile_active_seats': {
    'ar': '24 مقعداً نشطاً',
    'en': '24 active seats',
  },
  'profile_account_type_label': {
    'ar': 'نوع الحساب: {{value}}',
    'en': 'Account type: {{value}}',
  },
  'account_type_student': {
    'ar': 'طالب',
    'en': 'Student',
  },
  'account_type_mentor': {
    'ar': 'مدرب',
    'en': 'Mentor',
  },
  'account_type_supervisor': {
    'ar': 'مشرف',
    'en': 'Supervisor',
  },
  'profile_payments_title': {
    'ar': 'لوحة المدفوعات',
    'en': 'Payments hub',
  },
  'profile_payments_subtitle': {
    'ar': 'سجل العمليات وقنوات الدفع',
    'en': 'Transactions and payment rails',
  },
  'profile_admin_title': {
    'ar': 'لوحة التحكم',
    'en': 'Admin console',
  },
  'profile_admin_subtitle': {
    'ar': 'إدارة الدورات والمستخدمين',
    'en': 'Manage courses and users',
  },
  'profile_experience_title': {
    'ar': 'تخصيص التجربة',
    'en': 'Personalize experience',
  },
  'profile_dark_mode_label': {
    'ar': 'الوضع الليلي (Dark Mode)',
    'en': 'Dark mode',
  },
  'profile_dark_mode_description': {
    'ar': 'يقوم بضبط السطوع لتجربة ملائمة للهواتف ليلاً وخفض استهلاك البطارية.',
    'en': 'Optimizes brightness for night use and lowers battery drain.',
  },
  'profile_language_label': {
    'ar': 'اللغة',
    'en': 'Language',
  },
  'profile_language_helper': {
    'ar': 'يتم حفظ اختياراتك فوراً وتطبيقها على بقية الصفحات لضمان تجربة متسقة عبر الأجهزة.',
    'en': 'Your choices apply instantly across pages and devices.',
  },
  'profile_section_company_data': {
    'ar': 'بيانات الشركة',
    'en': 'Organization data',
  },
  'profile_section_learning': {
    'ar': 'تفضيلات وتجربة التعلم',
    'en': 'Learning preferences',
  },
  'profile_section_support': {
    'ar': 'الدعم والتطوير',
    'en': 'Support & development',
  },
  'profile_preference_alerts_title': {
    'ar': 'تنبيهات جلسات مباشرة',
    'en': 'Live session alerts',
  },
  'profile_preference_alerts_subtitle': {
    'ar': 'إشعار فوري قبل 30 دقيقة',
    'en': 'Instant notification 30 minutes prior',
  },
  'profile_preference_share_title': {
    'ar': 'مشاركة التقدم مع مديري',
    'en': 'Share progress with my manager',
  },
  'profile_preference_share_subtitle': {
    'ar': 'يتم إرسال تقرير أسبوعي آلياً',
    'en': 'Weekly automated report is sent',
  },
  'profile_preference_research_title': {
    'ar': 'تلقي أبحاث وتقارير خاصة',
    'en': 'Receive curated research',
  },
  'profile_preference_research_subtitle': {
    'ar': 'رسالة شهرية مختارة حسب مسارك',
    'en': 'Monthly brief tailored to your track',
  },
  'profile_org_tile_active_teams_title': {
    'ar': 'عدد الفرق النشطة',
    'en': 'Active teams',
  },
  'profile_org_tile_active_teams_value': {
    'ar': '7 فرق',
    'en': '7 teams',
  },
  'profile_org_tile_active_teams_description': {
    'ar': 'تحليل البيانات، المنتج، الأمن، التسويق',
    'en': 'Data, product, security, marketing',
  },
  'profile_org_tile_budget_title': {
    'ar': 'الميزانية المتبقية',
    'en': 'Remaining budget',
  },
  'profile_org_tile_budget_value': {
    'ar': '42,000 LYD',
    'en': '42,000 LYD',
  },
  'profile_org_tile_budget_description': {
    'ar': 'صالحة حتى يونيو 2026',
    'en': 'Valid through June 2026',
  },
  'profile_org_tile_roi_title': {
    'ar': 'مؤشر العائد على التعلم',
    'en': 'Learning ROI index',
  },
  'profile_org_tile_roi_value': {
    'ar': '120%',
    'en': '120%',
  },
  'profile_org_tile_roi_description': {
    'ar': 'وفق منهجية SkillUp Impact',
    'en': 'Based on the SkillUp Impact method',
  },
  'profile_org_tile_sessions_title': {
    'ar': 'جلسات استشارية متاحة',
    'en': 'Advisory sessions available',
  },
  'profile_org_tile_sessions_value': {
    'ar': '3 جلسات',
    'en': '3 sessions',
  },
  'profile_org_tile_sessions_description': {
    'ar': 'يمكن حجزها خلال هذا الشهر',
    'en': 'Bookable this month',
  },
  'profile_support_button': {
    'ar': 'ابدأ الطلب',
    'en': 'Start request',
  },
  'profile_support_request_coach': {
    'ar': 'طلب مدرب شخصي',
    'en': 'Request personal coach',
  },
  'profile_support_request_billing': {
    'ar': 'رفع استفسار مالي',
    'en': 'Submit billing inquiry',
  },
  'profile_support_request_agreement': {
    'ar': 'تحديث اتفاقية الشركة',
    'en': 'Update company agreement',
  },
  'profile_short_note': {
    'ar': 'يتم حفظ اختياراتك فوراً وتطبيقها على بقية الصفحات لضمان تجربة متسقة عبر الأجهزة.',
    'en': 'Your selections save instantly and apply across the experience.',
  },
  'learning_path1_title': {
    'ar': 'رحلة القيادة الرقمية',
    'en': 'Digital leadership journey',
  },
  'learning_path1_status': {
    'ar': 'جاهز للتقييم النهائي',
    'en': 'Ready for final assessment',
  },
  'learning_path1_partner': {
    'ar': 'الشريك: INSEAD',
    'en': 'Partner: INSEAD',
  },
  'learning_path2_title': {
    'ar': 'تصميم منتجات الذكاء الاصطناعي',
    'en': 'AI product design track',
  },
  'learning_path2_status': {
    'ar': 'مختبر عملي بعد أسبوع',
    'en': 'Hands-on lab in a week',
  },
  'learning_path2_partner': {
    'ar': 'الشريك: DeepLearning.ai',
    'en': 'Partner: DeepLearning.ai',
  },
  'learning_session1_title': {
    'ar': 'مختبر الذكاء الاصطناعي المتقدم',
    'en': 'Advanced AI lab',
  },
  'learning_session1_date': {
    'ar': 'الخميس، 14 يناير · 7:00 مساءً',
    'en': 'Thu, 14 Jan · 7:00 PM',
  },
  'learning_session1_description': {
    'ar': 'جلسة مباشرة مع خبراء MLOps.',
    'en': 'Live session with MLOps experts.',
  },
  'learning_session2_title': {
    'ar': 'اجتماع متابعة أداء المشاريع',
    'en': 'Project performance sync',
  },
  'learning_session2_date': {
    'ar': 'الإثنين، 19 يناير · 5:00 مساءً',
    'en': 'Mon, 19 Jan · 5:00 PM',
  },
  'learning_session2_description': {
    'ar': 'نراجع مبادرات القيادة الرقمية 2026.',
    'en': 'Reviewing the 2026 digital leadership initiatives.',
  },
  'learning_certificate1_title': {
    'ar': 'شهادة الذكاء الاصطناعي التطبيقي',
    'en': 'Applied AI certificate',
  },
  'learning_certificate1_issuer': {
    'ar': 'صادرة من Coursera',
    'en': 'Issued by Coursera',
  },
  'learning_certificate2_title': {
    'ar': 'شهادة قيادة المنتجات',
    'en': 'Product leadership certificate',
  },
  'learning_certificate2_issuer': {
    'ar': 'صادرة من Product School',
    'en': 'Issued by Product School',
  },
  'learning_paths_manage_title': {
    'ar': 'إدارة المسارات',
    'en': 'Manage learning paths',
  },
  'learning_paths_manage_description': {
    'ar': 'اختر المسارات التي ترغب بتعديلها أو إضافة أعضاء جدد إليها.',
    'en': 'Pick the paths you want to edit or assign to teammates.',
  },
  'learning_paths_add_member': {
    'ar': 'إضافة متعلّم جديد',
    'en': 'Add new learner',
  },
  'learning_paths_add_member_success': {
    'ar': 'أضفنا مقعداً جديداً للمسار المختار.',
    'en': 'Added a new seat to the selected path.',
  },
  'learning_sync_success': {
    'ar': 'تم ربط الجلسات مع تقويمك بنجاح.',
    'en': 'Sessions synced with your calendar successfully.',
  },
  'learning_share_success': {
    'ar': 'تم إرسال تقرير الإنجازات لفريق القيادة.',
    'en': 'Shared the achievements report with the leadership team.',
  },
  'learning_path_sheet_description': {
    'ar': 'التقدم الحالي {{progress}}% · {{status}}\nالشريك: {{partner}}',
    'en': 'Current progress {{progress}}% · {{status}}\nPartner: {{partner}}',
  },
  'learning_path_sheet_action': {
    'ar': 'استعراض المهام المتبقية',
    'en': 'View remaining tasks',
  },
  'learning_path_sheet_success': {
    'ar': 'عرضنا لك لوحة المهام.',
    'en': 'Opened the tasks board.',
  },
  'learning_session_sheet_description': {
    'ar': '{{date}}\n{{description}}',
    'en': '{{date}}\n{{description}}',
  },
  'learning_session_sheet_action': {
    'ar': 'إرسال تذكير',
    'en': 'Send reminder',
  },
  'learning_session_sheet_success': {
    'ar': 'سيصل التذكير إلى بريدك بعد قليل.',
    'en': 'Reminder will hit your inbox shortly.',
  },
  'learning_certificate_download': {
    'ar': 'جارٍ تنزيل {{title}}.',
    'en': 'Downloading {{title}} now.',
  },
  'learning_section_paths': {
    'ar': 'مساراتي الحالية',
    'en': 'My current paths',
  },
  'learning_paths_manage_button': {
    'ar': 'إدارة المسارات',
    'en': 'Manage paths',
  },
  'learning_section_sessions': {
    'ar': 'جلسات مباشرة قادمة',
    'en': 'Upcoming live sessions',
  },
  'learning_sync_button': {
    'ar': 'مزامنة التقويم',
    'en': 'Sync calendar',
  },
  'learning_section_certificates': {
    'ar': 'الإنجازات والشهادات',
    'en': 'Milestones & certificates',
  },
  'learning_share_button': {
    'ar': 'مشاركة مع الفريق',
    'en': 'Share with team',
  },
  'learning_overview_title': {
    'ar': 'لوحة المتعلم التنفيذي',
    'en': 'Executive learner dashboard',
  },
  'learning_overview_description': {
    'ar': 'تابع التقدم، قِس الأثر، واطلب دعم الخبراء متى شئت.',
    'en': 'Track progress, measure impact, and request expert support anytime.',
  },
  'learning_metric_progress': {
    'ar': 'متوسط التقدم',
    'en': 'Avg progress',
  },
  'learning_metric_sessions': {
    'ar': 'جلسات منجزة هذا الشهر',
    'en': 'Sessions completed this month',
  },
  'learning_metric_rating': {
    'ar': 'تقييم القادة',
    'en': 'Leadership rating',
  },
  'learning_path_view_button': {
    'ar': 'عرض لوحة المتابعة',
    'en': 'Open tracking board',
  },
  'learning_session_details_button': {
    'ar': 'تفاصيل',
    'en': 'Details',
  },
  'experience_mode_employee': {
    'ar': 'فرق الشركات',
    'en': 'Corporate teams',
  },
  'experience_mode_individual': {
    'ar': 'متعلمين أفراد',
    'en': 'Individual learners',
  },
  'profile_experience_mode_label': {
    'ar': 'نوع التجربة',
    'en': 'Experience mode',
  },
  'experience_mode_employee_subtitle': {
    'ar': 'فعّل لوحات الشركات والتقارير التنفيذية.',
    'en': 'Shows corporate dashboards and executive reports.',
  },
  'experience_mode_individual_subtitle': {
    'ar': 'يعرض الدورات المهنية القصيرة وفرص العمل.',
    'en': 'Surfaces short vocational sprints and job leads.',
  },
  'language_tamazight': {
    'ar': 'الأمازيغية',
    'en': 'Tamazight',
  },
  'feature_coming_soon': {
    'ar': 'قريباً',
    'en': 'Coming soon',
  },
  'profile_language_tamazight_note': {
    'ar': 'نعمل على توفير الواجهة الأمازيغية قريباً. شاركنا اقتراحاتك.',
    'en': 'Tamazight support is in development—stay tuned and share suggestions.',
  },
  'home_vocational_hero_title': {
    'ar': 'دورات مهنية قصيرة للشباب الليبي',
    'en': 'Short vocational sprints for Libyan youth',
  },
  'home_vocational_hero_description': {
    'ar': 'تعلم مهارة عملية خلال أسابيع، اختبر مشروعك رقمياً، واحصل على شهادة QR تربطك بسوق العمل المحلي.',
    'en': 'Master a hands-on skill in weeks, submit a digital project, and unlock a QR certificate linked to local jobs.',
  },
  'home_vocational_hero_primary_cta': {
    'ar': 'استعرض الدورات العملية',
    'en': 'Browse practical sprints',
  },
  'home_vocational_hero_secondary_cta': {
    'ar': 'اطلع على لوحة الوظائف',
    'en': 'View job board',
  },
  'home_vocational_hero_highlight1': {
    'ar': 'مشاريع مصورة يقيّمها مدربون محليون خلال 48 ساعة.',
    'en': 'Video projects reviewed by local trainers within 48 hours.',
  },
  'home_vocational_hero_highlight2': {
    'ar': 'شهادات رقمية برمز QR يمكن مشاركتها مع أصحاب العمل.',
    'en': 'Digital QR certificates ready to share with employers.',
  },
  'home_vocational_hero_highlight3': {
    'ar': 'ربط فوري بلوحة وظائف مصنفة حسب المهارة.',
    'en': 'Instant matchmaking with a skill-based job board.',
  },
  'home_vocational_chip_short': {
    'ar': 'من أسبوعين إلى شهرين',
    'en': '2–8 weeks',
  },
  'home_vocational_chip_projects': {
    'ar': 'اختبارات عملية رقمية',
    'en': 'Digital practical exams',
  },
  'home_vocational_chip_qr': {
    'ar': 'شهادات QR موثقة',
    'en': 'QR-secured certificates',
  },
  'home_vocational_domains_title': {
    'ar': 'مسارات تخصصية جاهزة',
    'en': 'Ready-to-learn domains',
  },
  'home_vocational_domains_subtitle': {
    'ar': 'اختر مهارة تقنية أو عملية وابدأ مباشرة.',
    'en': 'Pick an applied or technical skill and start immediately.',
  },
  'home_vocational_domain_phone_title': {
    'ar': 'صيانة الهواتف والأجهزة',
    'en': 'Phone & device repair',
  },
  'home_vocational_domain_phone_desc': {
    'ar': 'تفكيك آمن، تشخيص أعطال، واستبدال مكونات.',
    'en': 'Safe teardown, fault diagnosis, and component swaps.',
  },
  'home_vocational_domain_electric_title': {
    'ar': 'الكهرباء المنزلية الذكية',
    'en': 'Smart home electricity',
  },
  'home_vocational_domain_electric_desc': {
    'ar': 'تمديدات، لوحات توزيع، وحلول ترشيد الطاقة.',
    'en': 'Wiring, breaker panels, and energy-saving retrofits.',
  },
  'home_vocational_domain_mechanics_title': {
    'ar': 'الميكانيكا وصيانة السيارات',
    'en': 'Auto service & mechanics',
  },
  'home_vocational_domain_mechanics_desc': {
    'ar': 'تشخيص إلكتروني، تبديل أنظمة، وضبط محركات.',
    'en': 'OBD diagnostics, system overhauls, and engine tuning.',
  },
  'home_vocational_domain_design_title': {
    'ar': 'التصميم الجرافيكي وتصميم المواقع',
    'en': 'Graphic & web design',
  },
  'home_vocational_domain_design_desc': {
    'ar': 'هوية بصرية، تصميم واجهات، ومشاريع للويب.',
    'en': 'Brand systems, UI layouts, and responsive web builds.',
  },
  'home_vocational_domain_hvac_title': {
    'ar': 'التبريد والتكييف',
    'en': 'Cooling & HVAC',
  },
  'home_vocational_domain_hvac_desc': {
    'ar': 'صيانة وحدات، تعبئة غاز، وضبط تحكم رقمي.',
    'en': 'Unit servicing, refrigerant charging, and smart controls.',
  },
  'home_vocational_domain_sales_title': {
    'ar': 'المبيعات وخدمة العملاء',
    'en': 'Sales & customer care',
  },
  'home_vocational_domain_sales_desc': {
    'ar': 'أساليب عرض، إدارة اعتراضات، وتجربة عملاء.',
    'en': 'Pitching, objection handling, and CX playbooks.',
  },
  'home_vocational_sprints_title': {
    'ar': 'دورات قصيرة مع مدربين محليين',
    'en': 'Short sprints with local coaches',
  },
  'home_vocational_sprints_subtitle': {
    'ar': 'مجموعات صغيرة، لقاءات مباشرة، ومهام أسبوعية قابلة للتسليم.',
    'en': 'Small cohorts, live touchpoints, and weekly deliverables.',
  },
  'home_vocational_sprint_phone_title': {
    'ar': 'Sprint صيانة الهاتف الاحترافية',
    'en': 'Pro phone repair sprint',
  },
  'home_vocational_sprint_phone_focus': {
    'ar': 'تدريب على تشخيص الأعطال ورفع تقارير فيديو.',
    'en': 'Learn diagnostics and submit narrated repair videos.',
  },
  'home_vocational_sprint_electric_title': {
    'ar': 'كهربائي المنزل الذكي',
    'en': 'Smart home electrician',
  },
  'home_vocational_sprint_electric_focus': {
    'ar': 'مشاريع تركيب حساسات وتحسين لوحات توزيع.',
    'en': 'Install sensors and upgrade breaker panels.',
  },
  'home_vocational_sprint_mechanics_title': {
    'ar': 'ميكانيكا السيارات الحديثة',
    'en': 'Modern auto service',
  },
  'home_vocational_sprint_mechanics_focus': {
    'ar': 'فحص أنظمة الوقود والتبريد باستخدام أدوات رقمية.',
    'en': 'Run digital diagnostics on fuel and cooling systems.',
  },
  'home_vocational_sprint_design_title': {
    'ar': 'تصميم مواقع وخدمات مصغرة',
    'en': 'Micro web & brand design',
  },
  'home_vocational_sprint_design_focus': {
    'ar': 'تصميم واجهات عربية وتصدير ملفات جاهزة للنشر.',
    'en': 'Craft Arabic-first UIs and ship publish-ready files.',
  },
  'home_vocational_sprint_hvac_title': {
    'ar': 'أساسيات التبريد والتكييف',
    'en': 'HVAC essentials',
  },
  'home_vocational_sprint_hvac_focus': {
    'ar': 'مخبر عملي لموازنة الضغوط وتوثيق الأداء.',
    'en': 'Hands-on lab to balance pressures and log performance.',
  },
  'home_vocational_sprint_sales_title': {
    'ar': 'مهارات المبيعات وخدمة العملاء',
    'en': 'Sales & service mastery',
  },
  'home_vocational_sprint_sales_focus': {
    'ar': 'سيناريوهات محادثة وفيديوهات لحل اعتراضات الزبائن.',
    'en': 'Record role-play videos tackling customer objections.',
  },
  'home_vocational_start_next_week': {
    'ar': 'يبدأ الأسبوع القادم',
    'en': 'Starts next week',
  },
  'home_vocational_start_mid_month': {
    'ar': 'بداية منتصف الشهر',
    'en': 'Mid-month kickoff',
  },
  'home_vocational_start_end_month': {
    'ar': 'بداية آخر الشهر',
    'en': 'End-of-month start',
  },
  'home_vocational_format_hybrid': {
    'ar': 'هجين',
    'en': 'Hybrid',
  },
  'home_vocational_format_onsite': {
    'ar': 'حضوري',
    'en': 'On-site',
  },
  'home_vocational_format_dual': {
    'ar': 'ورشة + تدريب ميداني',
    'en': 'Lab + field',
  },
  'home_vocational_format_online': {
    'ar': 'عن بُعد',
    'en': 'Online',
  },
  'home_vocational_duration_template': {
    'ar': '{{weeks}} أسابيع',
    'en': '{{weeks}} weeks',
  },
  'home_vocational_price_template': {
    'ar': '{{amount}} د.ل',
    'en': '{{amount}} LYD',
  },
  'home_vocational_start_template': {
    'ar': '{{date}}',
    'en': '{{date}}',
  },
  'home_vocational_domain_sheet': {
    'ar': '{{description}}\nالمدة المتوقعة: {{weeks}} أسابيع.',
    'en': '{{description}}\nEstimated duration: {{weeks}} weeks.',
  },
  'home_vocational_domain_action': {
    'ar': 'استعرض خطة المهارة',
    'en': 'View skill plan',
  },
  'home_vocational_domain_feedback': {
    'ar': 'أضفنا الخطة إلى لوحة مسارك.',
    'en': 'Added the plan to your dashboard.',
  },
  'home_vocational_sprint_sheet': {
    'ar': '{{focus}}\n{{duration}}',
    'en': '{{focus}}\n{{duration}}',
  },
  'home_vocational_sprint_primary_action': {
    'ar': 'احجز مقعدك الآن',
    'en': 'Reserve your seat',
  },
  'home_vocational_sprint_primary_feedback': {
    'ar': 'تم تأكيد المقعد وسنرسل التفاصيل عبر البريد.',
    'en': 'Seat confirmed—we emailed the details.',
  },
  'home_vocational_sprint_secondary_action': {
    'ar': 'حفظ في قائمتي',
    'en': 'Save to my list',
  },
  'home_vocational_sprint_secondary_feedback': {
    'ar': 'أضفنا الدورة إلى التذكيرات.',
    'en': 'Sprint saved to your reminders.',
  },
  'home_vocational_features_title': {
    'ar': 'مزايا المنصة للأفراد',
    'en': 'Platform perks for individuals',
  },
  'home_vocational_features_subtitle': {
    'ar': 'اختبارات عملية، شهادات موثقة، وربط مباشر بسوق العمل.',
    'en': 'Practical exams, verified certificates, and job exposure.',
  },
  'home_vocational_feature_projects_title': {
    'ar': 'اختبارات عملية رقمية',
    'en': 'Digital practical exams',
  },
  'home_vocational_feature_projects_desc': {
    'ar': 'ارفع صوراً أو فيديو لعملك لتحصل على تقييم واضح من مدرب محلي.',
    'en': 'Upload photo/video evidence for fast local coach reviews.',
  },
  'home_vocational_feature_certificate_title': {
    'ar': 'شهادات QR مؤمنة',
    'en': 'QR-secured certificates',
  },
  'home_vocational_feature_certificate_desc': {
    'ar': 'شهادتك تصدر برمز تحقق يمكن مسحه من قبل أصحاب العمل.',
    'en': 'Each certificate ships with a QR that employers can verify.',
  },
  'home_vocational_feature_trainers_title': {
    'ar': 'مدربون محليون موثوقون',
    'en': 'Trusted local trainers',
  },
  'home_vocational_feature_trainers_desc': {
    'ar': 'يعتمدون المشاريع النهائية ويشاركون فرصاً مدفوعة.',
    'en': 'They grade your finals and share paid gigs.',
  },
  'home_vocational_feature_jobs_title': {
    'ar': 'لوحة وظائف فورية',
    'en': 'Instant job board',
  },
  'home_vocational_feature_jobs_desc': {
    'ar': 'اعرض ملفك على مؤسسات تبحث عن نفس المهارة.',
    'en': 'Expose your profile to companies needing that skill.',
  },
  'home_vocational_feature_feedback': {
    'ar': 'تم تفعيل {{feature}} في حسابك.',
    'en': '{{feature}} is now highlighted in your account.',
  },
  'home_vocational_journey_title': {
    'ar': 'رحلة الاعتماد التفاعلية',
    'en': 'Interactive certification journey',
  },
  'home_vocational_journey_subtitle': {
    'ar': 'من الانضمام إلى رفع المشروع وحتى التوصية الوظيفية.',
    'en': 'From enrollment to project upload and job referrals.',
  },
  'home_vocational_journey_step1_title': {
    'ar': 'اختر المسار',
    'en': 'Pick your path',
  },
  'home_vocational_journey_step1_desc': {
    'ar': 'حدد تخصصك ووقت التفرغ لتخصيص الجدول.',
    'en': 'Share your specialty and availability to tailor the plan.',
  },
  'home_vocational_journey_step2_title': {
    'ar': 'تابع الدروس القصيرة',
    'en': 'Follow bite-sized lessons',
  },
  'home_vocational_journey_step2_desc': {
    'ar': 'جلسات مباشرة ومسجلة لا تتجاوز 40 دقيقة.',
    'en': 'Live + recorded sessions under 40 minutes.',
  },
  'home_vocational_journey_step3_title': {
    'ar': 'ارفع المشروع العملي',
    'en': 'Upload your project',
  },
  'home_vocational_journey_step3_desc': {
    'ar': 'صور أو فيديو أو ملف Figma حسب التخصص.',
    'en': 'Photos, video, or Figma files depending on track.',
  },
  'home_vocational_journey_step4_title': {
    'ar': 'احصل على الشهادة',
    'en': 'Earn the certificate',
  },
  'home_vocational_journey_step4_desc': {
    'ar': 'مدرب معتمد يقيّمك ويصدر شارة QR.',
    'en': 'A certified mentor reviews and issues a QR badge.',
  },
  'home_vocational_journey_step5_title': {
    'ar': 'انشر ملفك للوظائف',
    'en': 'Publish to job board',
  },
  'home_vocational_journey_step5_desc': {
    'ar': 'يتلقى أصحاب العمل إشعاراً بمهاراتك المحدثة.',
    'en': 'Employers get notified about your freshly verified skill.',
  },
  'home_vocational_certificate_title': {
    'ar': 'شهادة رقمية برابط تحقق',
    'en': 'Digital certificate with verification link',
  },
  'home_vocational_certificate_subtitle': {
    'ar': 'يمكن التحقق من الشهادة عبر رمز QR ومشاركتها على لينكدإن.',
    'en': 'Each certificate carries a QR link you can share on LinkedIn.',
  },
  'home_vocational_certificate_button': {
    'ar': 'مشاركة الشهادة',
    'en': 'Share certificate',
  },
  'home_vocational_certificate_share': {
    'ar': 'نسخنا رابط الشهادة وشاركناه مع بريدك.',
    'en': 'Copied the certificate link and emailed it to you.',
  },
  'home_vocational_jobs_title': {
    'ar': 'فرص عمل جاهزة',
    'en': 'Job leads waiting',
  },
  'home_vocational_jobs_subtitle': {
    'ar': 'عرض سريع للوظائف التي تطلب نفس المهارات.',
    'en': 'Quick view of openings requesting your skills.',
  },
  'home_vocational_job_phone_title': {
    'ar': 'فني صيانة هواتف معتمد',
    'en': 'Certified phone repair technician',
  },
  'home_vocational_job_hvac_title': {
    'ar': 'فني تبريد وتكييف',
    'en': 'HVAC technician',
  },
  'home_vocational_job_design_title': {
    'ar': 'مصمم واجهات ومحتوى بصري',
    'en': 'UI & visual designer',
  },
  'home_vocational_job_location_tripoli': {
    'ar': 'طرابلس',
    'en': 'Tripoli',
  },
  'home_vocational_job_location_sabha': {
    'ar': 'سبها',
    'en': 'Sabha',
  },
  'home_vocational_job_location_remote': {
    'ar': 'عن بعد داخل ليبيا',
    'en': 'Remote across Libya',
  },
  'home_vocational_job_type_full': {
    'ar': 'دوام كامل',
    'en': 'Full-time',
  },
  'home_vocational_job_type_contract': {
    'ar': 'عقد لمدة 3 أشهر',
    'en': '3-month contract',
  },
  'home_vocational_job_type_freelance': {
    'ar': 'عمل حر مدفوع بالساعة',
    'en': 'Hourly freelance',
  },
  'home_vocational_job_sheet': {
    'ar': 'الشركة: {{company}}\nالموقع: {{location}}\nالنمط: {{type}}',
    'en': 'Company: {{company}}\nLocation: {{location}}\nType: {{type}}',
  },
  'home_vocational_job_action': {
    'ar': 'إرسال ملفي',
    'en': 'Send my profile',
  },
  'home_vocational_job_feedback': {
    'ar': 'شاركنا ملفك مع فريق التوظيف.',
    'en': 'Shared your profile with the hiring team.',
  },
  'home_vocational_jobhub_title': {
    'ar': 'لوحة الوظائف والفرص المحلية',
    'en': 'Local job & gig hub',
  },
  'home_vocational_jobhub_description': {
    'ar': 'اعرض شهادتك الرقمية على مؤسسات تبحث عن نفس المهارات واحتفظ بتتبع الطلبات.',
    'en': 'Showcase your QR certificate to employers and track every lead.',
  },
  'home_vocational_jobhub_action': {
    'ar': 'فتح لوحة الوظائف',
    'en': 'Open job board',
  },
  'home_vocational_jobhub_feedback': {
    'ar': 'فتحنا لوحة الوظائف وأظهرنا أحدث الفرص.',
    'en': 'Opened the job hub with the latest leads.',
  },
  'browse_individual_filter_duration_2': {
    'ar': 'حتى 4 أسابيع',
    'en': 'Up to 4 weeks',
  },
  'browse_individual_filter_duration_8': {
    'ar': 'حتى شهرين',
    'en': 'Up to 2 months',
  },
  'browse_individual_filter_cost': {
    'ar': 'أقل من 500 د.ل',
    'en': 'Under 500 LYD',
  },
  'browse_individual_filter_blended': {
    'ar': 'تدريب هجين',
    'en': 'Blended delivery',
  },
  'browse_individual_filter_job': {
    'ar': 'يرتبط بوظائف',
    'en': 'Job-linked',
  },
  'browse_individual_filter_certificate': {
    'ar': 'شهادة QR',
    'en': 'QR certificate',
  },
  'browse_individual_filter_feedback': {
    'ar': 'تم تطبيق فلتر {{filter}} على النتائج.',
    'en': 'Applied the {{filter}} filter to the catalog.',
  },
  'browse_individual_courses_title': {
    'ar': 'دورات قصيرة حسب طلب السوق',
    'en': 'Short courses built with employers',
  },
  'browse_individual_courses_subtitle': {
    'ar': 'مدة مرنة، رسوم ثابتة، واختبار عملي يرفع لشهادتك.',
    'en': 'Flexible duration, flat pricing, and a practical upload for your badge.',
  },
  'browse_individual_course_phone_title': {
    'ar': 'تشخيص وصيانة هواتف احترافية',
    'en': 'Pro phone diagnostics & repair',
  },
  'browse_individual_course_phone_category': {
    'ar': 'صيانة الأجهزة',
    'en': 'Device repair',
  },
  'browse_individual_course_electric_title': {
    'ar': 'كهربائي المنازل الذكية',
    'en': 'Smart-home electrician',
  },
  'browse_individual_course_electric_category': {
    'ar': 'الكهرباء المنزلية',
    'en': 'Home electricity',
  },
  'browse_individual_course_mechanics_title': {
    'ar': 'ميكانيكا سيارات متقدمة',
    'en': 'Advanced auto mechanics',
  },
  'browse_individual_course_mechanics_category': {
    'ar': 'ميكانيكا',
    'en': 'Mechanics',
  },
  'browse_individual_course_design_title': {
    'ar': 'تصميم جرافيكي ومواقع عملية',
    'en': 'Applied graphic & web design',
  },
  'browse_individual_course_design_category': {
    'ar': 'التصميم',
    'en': 'Design',
  },
  'browse_individual_course_hvac_title': {
    'ar': 'أساسيات التبريد والتكييف',
    'en': 'Cooling & HVAC fundamentals',
  },
  'browse_individual_course_hvac_category': {
    'ar': 'التبريد والتكييف',
    'en': 'HVAC',
  },
  'browse_individual_course_sales_title': {
    'ar': 'مبيعات وخدمة عملاء ميدانية',
    'en': 'Field sales & service',
  },
  'browse_individual_course_sales_category': {
    'ar': 'مبيعات وخدمة',
    'en': 'Sales & service',
  },
  'browse_individual_course_assessment_lab': {
    'ar': 'اختبار نهائي داخل مختبر محلي',
    'en': 'Final lab test with a local partner',
  },
  'browse_individual_course_assessment_video': {
    'ar': 'رفع فيديو لمدة 3 دقائق يشرح الإصلاح',
    'en': 'Upload a 3-minute explainer video',
  },
  'browse_individual_course_assessment_project': {
    'ar': 'مشروع يتم تقييمه ميدانياً',
    'en': 'Field-evaluated project',
  },
  'browse_individual_course_assessment_portfolio': {
    'ar': 'تسليم ملف تصميم جاهز للنشر',
    'en': 'Submit a publish-ready design file',
  },
  'browse_individual_course_assessment_call': {
    'ar': 'مكالمة محاكاة مع مدرب معتمد',
    'en': 'Simulated call with a certified coach',
  },
  'browse_individual_course_sheet': {
    'ar': 'التخصص: {{category}}\nالمدة: {{duration}}',
    'en': 'Track: {{category}}\nDuration: {{duration}}',
  },
  'browse_individual_course_primary_action': {
    'ar': 'انضم الآن',
    'en': 'Join now',
  },
  'browse_individual_course_primary_feedback': {
    'ar': 'تم تأكيد انضمامك وإرسال التفاصيل.',
    'en': 'Enrollment confirmed—we shared the details.',
  },
  'browse_individual_course_secondary_action': {
    'ar': 'احجز تجربة مجانية',
    'en': 'Book a free try-out',
  },
  'browse_individual_course_secondary_feedback': {
    'ar': 'حجزنا تجربة مجانية وسنذكرك قبل الموعد.',
    'en': 'Free try-out scheduled; we will remind you beforehand.',
  },
  'browse_individual_projects_title': {
    'ar': 'اختبارات عملية رقمية',
    'en': 'Digital practical submissions',
  },
  'browse_individual_projects_subtitle': {
    'ar': 'طبّق ما تعلمته وارفع دليل العمل خلال 48 ساعة من آخر درس.',
    'en': 'Apply your skill and upload proof within 48 hours of the final lesson.',
  },
  'browse_individual_project_phone_title': {
    'ar': 'إصلاح شاشة ورفع تقرير فيديو',
    'en': 'Screen repair video report',
  },
  'browse_individual_project_phone_desc': {
    'ar': 'وثّق الخطوات من فك الجهاز وحتى اختبار الشاشة الجديدة.',
    'en': 'Capture the teardown and post-repair testing process.',
  },
  'browse_individual_project_design_title': {
    'ar': 'واجهة صفحة هبوط تفاعلية',
    'en': 'Interactive landing page',
  },
  'browse_individual_project_design_desc': {
    'ar': 'صمّم واجهة ثنائية اللغة مع حالة تمرير واضحة.',
    'en': 'Design a bilingual interface with a clear scroll story.',
  },
  'browse_individual_project_submission_video': {
    'ar': 'ارفع فيديو 1080p يوضح خطواتك.',
    'en': 'Upload a 1080p walkthrough video.',
  },
  'browse_individual_project_submission_portfolio': {
    'ar': 'قدّم رابط Figma أو ملف PDF نهائي.',
    'en': 'Submit a Figma link or final PDF.',
  },
  'browse_individual_project_action': {
    'ar': 'رفع مشروعي',
    'en': 'Upload my project',
  },
  'browse_individual_project_feedback': {
    'ar': 'استلمنا مشروعك وسنراجعه خلال 24 ساعة.',
    'en': 'Received your project; expect feedback within 24h.',
  },
  'browse_individual_trainers_title': {
    'ar': 'مدربون محليون معتمدون',
    'en': 'Certified local trainers',
  },
  'browse_individual_trainers_subtitle': {
    'ar': 'قيّم مشاريعك واطلب جلسة خاصة أو توصية.',
    'en': 'Let them grade your work or request a private session.',
  },
  'browse_individual_trainer_phone': {
    'ar': 'خبيرة صيانة أجهزة ميدانية',
    'en': 'Field device repair expert',
  },
  'browse_individual_trainer_design': {
    'ar': 'مصممة هويات وتجربة مستخدم',
    'en': 'Brand & UX designer',
  },
  'browse_individual_trainer_hvac': {
    'ar': 'مدربة وحدات تبريد تجارية',
    'en': 'Commercial HVAC coach',
  },
  'browse_individual_city_tripoli': {
    'ar': 'طرابلس',
    'en': 'Tripoli',
  },
  'browse_individual_city_misrata': {
    'ar': 'مصراتة',
    'en': 'Misrata',
  },
  'browse_individual_city_benghazi': {
    'ar': 'بنغازي',
    'en': 'Benghazi',
  },
  'browse_individual_trainer_sheet': {
    'ar': 'التخصص: {{specialty}}\nالمدينة: {{city}}',
    'en': 'Specialty: {{specialty}}\nCity: {{city}}',
  },
  'browse_individual_trainer_action': {
    'ar': 'طلب جلسة تقييم',
    'en': 'Request review session',
  },
  'browse_individual_trainer_feedback': {
    'ar': 'سيتم تنسيق جلسة مع المدرب المختار.',
    'en': 'We will schedule a session with the selected trainer.',
  },
  'browse_individual_jobs_banner_title': {
    'ar': 'اربط شهادتك بفرص عمل محلية',
    'en': 'Connect your badge with local opportunities',
  },
  'browse_individual_jobs_banner_subtitle': {
    'ar': 'شارك ملفك مع مؤسسات تبحث عن مهاراتك وراقب الردود في لوحة واحدة.',
    'en': 'Share your profile with employers and track replies in one place.',
  },
  'browse_individual_jobs_banner_action': {
    'ar': 'اعرض لوحة الوظائف',
    'en': 'Show job board',
  },
  'browse_track1_title': {
    'ar': 'برنامج جاهزية الذكاء الاصطناعي للشركات',
    'en': 'AI readiness for enterprises',
  },
  'browse_track1_outcome': {
    'ar': 'يبني خارطة طريق خلال 6 أسابيع',
    'en': 'Builds a roadmap in 6 weeks',
  },
  'browse_track1_level': {
    'ar': 'مستوى استراتيجي',
    'en': 'Strategic level',
  },
  'browse_track2_title': {
    'ar': 'أكاديمية منتجات البيانات',
    'en': 'Data product academy',
  },
  'browse_track2_outcome': {
    'ar': 'مشاريع واقعية مع خبراء عالميين',
    'en': 'Real projects with global experts',
  },
  'browse_track2_level': {
    'ar': 'مستوى متقدم',
    'en': 'Advanced level',
  },
  'browse_track3_title': {
    'ar': 'مختبر الأمن السيبراني التنفيذي',
    'en': 'Executive cybersecurity lab',
  },
  'browse_track3_outcome': {
    'ar': 'تمارين هجوم ودفاع مباشرة للفرق',
    'en': 'Live red and blue team drills',
  },
  'browse_track3_level': {
    'ar': 'مستوى تكتيكي',
    'en': 'Tactical level',
  },
  'browse_capability_ai_leadership': {
    'ar': 'قيادة الذكاء الاصطناعي',
    'en': 'AI leadership',
  },
  'browse_capability_data_science': {
    'ar': 'علم البيانات المؤسسي',
    'en': 'Enterprise data science',
  },
  'browse_capability_digital_products': {
    'ar': 'تصميم المنتجات الرقمية',
    'en': 'Digital product design',
  },
  'browse_capability_experience_innovation': {
    'ar': 'ابتكار تجربة العملاء',
    'en': 'Experience innovation',
  },
  'browse_capability_cybersecurity': {
    'ar': 'الأمن السيبراني',
    'en': 'Cybersecurity',
  },
  'browse_capability_cloud_architecture': {
    'ar': 'هندسة السحابة',
    'en': 'Cloud architecture',
  },
  'browse_mentor1_name': {
    'ar': 'د. ياسمين الكيلاني',
    'en': 'Dr. Yasmin Alkilani',
  },
  'browse_mentor1_expertise': {
    'ar': 'تقود مبادرات الذكاء الاصطناعي في القطاع المالي بسنغافورة',
    'en': 'Leads AI initiatives across financial services in Singapore',
  },
  'browse_mentor1_company': {
    'ar': 'شريكة سابقة في Microsoft MENA',
    'en': 'Former partner at Microsoft MENA',
  },
  'browse_mentor2_name': {
    'ar': 'عمر الديب',
    'en': 'Omar Aldeeb',
  },
  'browse_mentor2_expertise': {
    'ar': 'يصمم منتجات رقمية لأسواق ناشئة ويركز على النمو',
    'en': 'Designs growth-focused digital products for emerging markets',
  },
  'browse_mentor2_company': {
    'ar': 'رئيس التصميم في Instabug',
    'en': 'Head of Design at Instabug',
  },
  'browse_mentor3_name': {
    'ar': 'ليلى الشيباني',
    'en': 'Leila Aleshhibani',
  },
  'browse_mentor3_expertise': {
    'ar': 'تبني برامج قيادة للقطاعات الحكومية وشبه الحكومية',
    'en': 'Builds leadership programs for public and semi-public sectors',
  },
  'browse_mentor3_company': {
    'ar': 'مستشارة استراتيجية في BCG Digital',
    'en': 'Strategy advisor at BCG Digital',
  },
  'browse_lab1_title': {
    'ar': 'مختبر نماذج الذكاء التوليدي',
    'en': 'Generative AI build lab',
  },
  'browse_lab1_description': {
    'ar': 'وحدات مكثفة مع موجهين لتنفيذ حالات استخدام محلية.',
    'en': 'Intensive sprints with mentors to ship localized use cases.',
  },
  'browse_lab2_title': {
    'ar': 'مختبر توسيع الأمن السحابي',
    'en': 'Cloud security scale lab',
  },
  'browse_lab2_description': {
    'ar': 'نراجع بنية السحابة ونطبق سياسات الامتثال.',
    'en': 'We review your cloud stack and enforce compliance controls.',
  },
  'browse_filter_snack': {
    'ar': 'تم تحديث النتائج بناءً على فلتر {{filter}}.',
    'en': 'Updated results using the {{filter}} filter.',
  },
  'browse_matrix_title': {
    'ar': 'مصفوفة الشركاء التعليميين 2026',
    'en': '2026 learning partners matrix',
  },
  'browse_matrix_description': {
    'ar': 'ملف يحتوي الأسعار، مدد البرامج، ومستويات الاعتماد لكل مزود.',
    'en': 'A PDF detailing pricing, durations, and accreditation per provider.',
  },
  'browse_matrix_action': {
    'ar': 'تحميل المصفوفة الكاملة',
    'en': 'Download full matrix',
  },
  'browse_matrix_download_snack': {
    'ar': 'أرسلنا نسخة إلى بريدك مع رابط مباشر.',
    'en': 'Sent a copy to your email with a direct link.',
  },
  'browse_intro_title': {
    'ar': 'مكالمة تعارف مع مستشار البرنامج',
    'en': 'Intro call with a program advisor',
  },
  'browse_intro_description': {
    'ar': 'نراجع احتياجات فريقك ونحدد أفضل 3 خيارات خلال 20 دقيقة.',
    'en': 'We review your team goals and shortlist three tracks in 20 minutes.',
  },
  'browse_intro_action': {
    'ar': 'احجز مكالمة تعريفية',
    'en': 'Book intro call',
  },
  'browse_intro_schedule_snack': {
    'ar': 'تم حجز المكالمة وسنرسل دعوة Teams.',
    'en': 'Call booked; Teams invite is on the way.',
  },
  'browse_track_sheet_action': {
    'ar': 'عرض تفاصيل المسار',
    'en': 'View track details',
  },
  'browse_track_sheet_success': {
    'ar': 'فتحنا تفاصيل المسار وروابط المحتوى.',
    'en': 'Opened the track details and content links.',
  },
  'browse_capability_sheet_description': {
    'ar': 'نجهز خطة مصغرة من ورشتين ومسار مكثف لكل قدرة.',
    'en': 'We craft a mini-plan with two workshops and a sprint per capability.',
  },
  'browse_capability_sheet_action': {
    'ar': 'اطلب خطة مصغرة',
    'en': 'Request mini-plan',
  },
  'browse_capability_sheet_success': {
    'ar': 'ستصلك المسودة الأولى خلال ساعتين.',
    'en': 'First draft will arrive within two hours.',
  },
  'browse_mentor_sheet_title': {
    'ar': 'حجز جلسة مع {{name}}',
    'en': 'Book a session with {{name}}',
  },
  'browse_mentor_sheet_action': {
    'ar': 'تأكيد الجلسة',
    'en': 'Confirm session',
  },
  'browse_mentor_sheet_success': {
    'ar': 'تم تأكيد الجلسة وسيصلك رابط Zoom.',
    'en': 'Session confirmed; Zoom link incoming.',
  },
  'browse_lab_sheet_action': {
    'ar': 'اطلب صلاحية الدخول',
    'en': 'Request access',
  },
  'browse_lab_sheet_success': {
    'ar': 'تواصلنا مع فريقك التقني لتفعيل المختبر.',
    'en': 'Coordinated with your tech team to enable the lab.',
  },
  'browse_section_tracks_title': {
    'ar': 'مسارات جاهزة للتنفيذ',
    'en': 'Execution-ready tracks',
  },
  'browse_section_tracks_subtitle': {
    'ar': 'موجهة لفرق النمو، البيانات، والتحول.',
    'en': 'Built for growth, data, and transformation teams.',
  },
  'browse_section_capabilities_title': {
    'ar': 'بناء القدرات الحرجة',
    'en': 'Build critical capabilities',
  },
  'browse_section_capabilities_subtitle': {
    'ar': 'اختر المهارات التي تريد قياسها وتوسيعها.',
    'en': 'Choose the skills you need to scale and measure.',
  },
  'browse_section_mentors_title': {
    'ar': 'موجهون ومستشارون',
    'en': 'Mentors and advisors',
  },
  'browse_section_mentors_subtitle': {
    'ar': 'خصص جلسات خاصة مع قادة الصناعة.',
    'en': 'Schedule private sessions with industry leaders.',
  },
  'browse_section_labs_title': {
    'ar': 'مختبرات وتجارب عملية',
    'en': 'Hands-on labs and pilots',
  },
  'browse_section_labs_subtitle': {
    'ar': 'طبّق ما تعلمته مع فريقك خلال أسابيع.',
    'en': 'Apply learnings with your teams within weeks.',
  },
  'browse_track_action': {
    'ar': 'اكتشف المسار',
    'en': 'Explore track',
  },
  'browse_filter_finance': {
    'ar': 'فرق الخدمات المالية',
    'en': 'Financial services teams',
  },
  'browse_filter_under_500': {
    'ar': 'شركات أقل من 500 موظف',
    'en': 'Organizations under 500 employees',
  },
  'browse_filter_ai_readiness': {
    'ar': 'جاهزية الذكاء الاصطناعي',
    'en': 'AI readiness focus',
  },
  'browse_filter_hybrid': {
    'ar': 'تدريب هجين',
    'en': 'Hybrid delivery',
  },
  'browse_filters_title': {
    'ar': 'عدّل النتائج المتقدمة',
    'en': 'Fine-tune advanced results',
  },
  'browse_filters_description': {
    'ar': 'أضف عوامل تصفية حسب القطاع، الميزانية، وأسلوب التقديم.',
    'en': 'Layer filters by industry, budget, and delivery style.',
  },
  'browse_filters_matrix_button': {
    'ar': 'طلب مصفوفة مفصلة',
    'en': 'Request detailed matrix',
  },
  'browse_filters_intro_button': {
    'ar': 'مكالمة ترحيبية',
    'en': 'Intro call',
  },
  'browse_callout_title': {
    'ar': 'لوحة لإدارة جميع برامجك',
    'en': 'Manage every program from one hub',
  },
  'browse_callout_description': {
    'ar': 'اربط المنصات، راقب التقدم، وخصص المسارات لكل فريق.',
    'en': 'Connect platforms, monitor progress, and tailor tracks per team.',
  },
  'browse_callout_button': {
    'ar': 'فتح إدارة الدورات',
    'en': 'Open course management',
  },
  'browse_mentor_button': {
    'ar': 'احجز الآن',
    'en': 'Book now',
  },
  'browse_labs_button': {
    'ar': 'طلب الوصول',
    'en': 'Request access',
  },
};
