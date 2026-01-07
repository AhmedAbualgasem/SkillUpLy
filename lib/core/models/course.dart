import 'package:flutter/material.dart';

enum CourseCategory { ai, data, security, leadership, product }

enum CourseLevel { beginner, intermediate, advanced }

enum CoursePrice { free, paid }

enum CourseResourceType { video, pdf, quiz, activity }

class Course {
  const Course({
    required this.id,
    required this.title,
    required this.category,
    required this.level,
    required this.priceType,
    required this.price,
    required this.instructor,
    required this.instructorTitle,
    required this.rating,
    required this.totalHours,
    required this.coverImage,
    required this.introVideoUrl,
    required this.description,
    required this.objectives,
    required this.lessons,
    required this.resources,
  });

  final String id;
  final String title;
  final CourseCategory category;
  final CourseLevel level;
  final CoursePrice priceType;
  final double price;
  final String instructor;
  final String instructorTitle;
  final double rating;
  final double totalHours;
  final String coverImage;
  final String introVideoUrl;
  final String description;
  final List<String> objectives;
  final List<CourseLesson> lessons;
  final List<CourseResource> resources;

  String get levelLabel {
    switch (level) {
      case CourseLevel.beginner:
        return 'مبتدئ';
      case CourseLevel.intermediate:
        return 'متوسط';
      case CourseLevel.advanced:
        return 'متقدم';
    }
  }

  String get categoryLabel {
    switch (category) {
      case CourseCategory.ai:
        return 'الذكاء الاصطناعي';
      case CourseCategory.data:
        return 'علوم البيانات';
      case CourseCategory.security:
        return 'الأمن السيبراني';
      case CourseCategory.leadership:
        return 'قيادة الأعمال';
      case CourseCategory.product:
        return 'المنتجات الرقمية';
    }
  }

  String get priceLabel => priceType == CoursePrice.free ? 'مجانية' : '${price.toStringAsFixed(0)} LYD';
}

class CourseLesson {
  const CourseLesson({
    required this.id,
    required this.title,
    required this.durationMinutes,
    required this.videoUrl,
    this.supportsOffline = true,
    this.summary,
  });

  final String id;
  final String title;
  final int durationMinutes;
  final String videoUrl;
  final bool supportsOffline;
  final String? summary;
}

class CourseResource {
  const CourseResource({
    required this.type,
    required this.title,
    required this.description,
    required this.sizeLabel,
  });

  final CourseResourceType type;
  final String title;
  final String description;
  final String sizeLabel;

  IconData get icon {
    switch (type) {
      case CourseResourceType.video:
        return Icons.play_circle_outline;
      case CourseResourceType.pdf:
        return Icons.picture_as_pdf_outlined;
      case CourseResourceType.quiz:
        return Icons.help_center_outlined;
      case CourseResourceType.activity:
        return Icons.assignment_outlined;
    }
  }
}

class CourseFixtures {
  static List<Course> sampleCourses = [
    Course(
      id: 'ai-leadership',
      title: 'قيادة الذكاء الاصطناعي التطبيقي',
      category: CourseCategory.ai,
      level: CourseLevel.advanced,
      priceType: CoursePrice.paid,
      price: 260,
      instructor: 'د. سارة كوستي',
      instructorTitle: 'Head of AI Strategy · Microsoft',
      rating: 4.9,
      totalHours: 18,
      coverImage: 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?auto=format&fit=crop&w=900&q=60',
      introVideoUrl: 'https://cdn.skillup.ly/ai/intro.mp4',
      description:
          'مسار عملي يربط تطبيقات الذكاء الاصطناعي بالأهداف الاستراتيجية للشركات. يشمل ورش عمل، دراسات حالة ليبية، وأدوات جاهزة للتنفيذ.',
      objectives: [
        'بناء خارطة طريق للذكاء الاصطناعي المؤسسي خلال 60 يوماً',
        'اختيار حالات الاستخدام ذات العائد الأعلى',
        'تصميم حوكمة المسؤولية الرقمية والضوابط القانونية',
      ],
      lessons: [
        CourseLesson(
          id: 'ai-1',
          title: 'تحليل جاهزية المؤسسة',
          durationMinutes: 22,
          videoUrl: 'https://cdn.skillup.ly/ai/lesson1.mp4',
          summary: 'أداة قياس نضج الذكاء الاصطناعي من أربع مراحل.',
        ),
        CourseLesson(
          id: 'ai-2',
          title: 'تصميم حالات الاستخدام',
          durationMinutes: 28,
          videoUrl: 'https://cdn.skillup.ly/ai/lesson2.mp4',
          summary: 'مصفوفة تحديد الأثر مقابل الجهد للقطاعات الليبية.',
        ),
        CourseLesson(
          id: 'ai-3',
          title: 'حوكمة البيانات والمسؤولية',
          durationMinutes: 24,
          videoUrl: 'https://cdn.skillup.ly/ai/lesson3.mp4',
          summary: 'سياسات الخصوصية ومراقبة التحيز في خوارزميات التنبؤ.',
        ),
      ],
      resources: [
        CourseResource(
          type: CourseResourceType.pdf,
          title: 'دليل خارطة الطريق',
          description: 'ملف PDF يحتوي على قوالب جاهزة وخطوات التنفيذ.',
          sizeLabel: '12MB',
        ),
        CourseResource(
          type: CourseResourceType.quiz,
          title: 'اختبار تقييم الاستعداد',
          description: '20 سؤالاً لتحديد أولوياتك التدريبية.',
          sizeLabel: '15 دقيقة',
        ),
        CourseResource(
          type: CourseResourceType.activity,
          title: 'ورشة عمل افتراضية',
          description: 'نشاط جماعي لتصميم حالة استخدام لمصرف.',
          sizeLabel: '45 دقيقة',
        ),
      ],
    ),
    Course(
      id: 'data-foundations',
      title: 'تحليل البيانات باستخدام بايثون وPower BI',
      category: CourseCategory.data,
      level: CourseLevel.intermediate,
      priceType: CoursePrice.free,
      price: 0,
      instructor: 'خالد جبريل',
      instructorTitle: 'Lead Analytics Architect · EY-Parthenon',
      rating: 4.7,
      totalHours: 14,
      coverImage: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=900&q=60',
      introVideoUrl: 'https://cdn.skillup.ly/data/intro.mp4',
      description: 'دورة عملية تغطي بناء لوحات بيانات متقدمة وربطها بمصادر متعددة مع أتمتة التقارير.',
      objectives: [
        'تنظيف البيانات وبناء نماذج مع بايثون',
        'تصميم لوحات أعمال تفاعلية',
        'قياس الأثر المالي لكل مشروع بيانات',
      ],
      lessons: [
        CourseLesson(
          id: 'data-1',
          title: 'تنظيف البيانات مع Pandas',
          durationMinutes: 26,
          videoUrl: 'https://cdn.skillup.ly/data/lesson1.mp4',
        ),
        CourseLesson(
          id: 'data-2',
          title: 'تصميم لوحات Power BI',
          durationMinutes: 32,
          videoUrl: 'https://cdn.skillup.ly/data/lesson2.mp4',
        ),
        CourseLesson(
          id: 'data-3',
          title: 'نشر التقارير وأمن البيانات',
          durationMinutes: 25,
          videoUrl: 'https://cdn.skillup.ly/data/lesson3.mp4',
        ),
      ],
      resources: [
        CourseResource(
          type: CourseResourceType.pdf,
          title: 'دفتر تمارين بايثون',
          description: 'ملف Jupyter Notebook + تعليمات PDF.',
          sizeLabel: '8MB',
        ),
        CourseResource(
          type: CourseResourceType.video,
          title: 'جلسة دعم حي',
          description: 'تسجيل جلسة أسئلة وأجوبة.',
          sizeLabel: '35 دقيقة',
        ),
      ],
    ),
    Course(
      id: 'cyber-shield',
      title: 'دفاع سيبراني استباقي للمدن الذكية',
      category: CourseCategory.security,
      level: CourseLevel.advanced,
      priceType: CoursePrice.paid,
      price: 310,
      instructor: 'مها السنوسي',
      instructorTitle: 'CISO · FutureGrid',
      rating: 4.8,
      totalHours: 20,
      coverImage: 'https://images.unsplash.com/photo-1510511459019-5dda7724fd87?auto=format&fit=crop&w=900&q=60',
      introVideoUrl: 'https://cdn.skillup.ly/security/intro.mp4',
      description: 'برنامج مكثف يبني قدرات الفرق لحماية البنى التحتية والخدمات الحكومية المتصلة.',
      objectives: [
        'تصميم طبقات دفاع متعددة',
        'تشغيل مركز عمليات أمنية هجينة',
        'التعامل مع الحوادث وقياس زمن الاستجابة',
      ],
      lessons: [
        CourseLesson(
          id: 'sec-1',
          title: 'هندسة الشبكات الموثوقة',
          durationMinutes: 30,
          videoUrl: 'https://cdn.skillup.ly/security/lesson1.mp4',
        ),
        CourseLesson(
          id: 'sec-2',
          title: 'محاكاة الحوادث الحية',
          durationMinutes: 34,
          videoUrl: 'https://cdn.skillup.ly/security/lesson2.mp4',
        ),
        CourseLesson(
          id: 'sec-3',
          title: 'خطة الاستجابة والتحول',
          durationMinutes: 29,
          videoUrl: 'https://cdn.skillup.ly/security/lesson3.mp4',
        ),
      ],
      resources: [
        CourseResource(
          type: CourseResourceType.activity,
          title: 'مختبر الهجمات Red vs Blue',
          description: 'ملف تعليمات + بيئة افتراضية للتمارين.',
          sizeLabel: '90 دقيقة',
        ),
        CourseResource(
          type: CourseResourceType.pdf,
          title: 'قائمة التحقق للأحداث',
          description: 'خطوات عملية لتقليل زمن التعافي.',
          sizeLabel: '6MB',
        ),
      ],
    ),
  ];
}
