import 'package:flutter/material.dart';
import 'package:skillup_libya/core/models/course.dart';
import 'package:skillup_libya/core/ui_feedback.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.course});

  final Course course;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  final List<String> _qualityOptions = const ['Auto', '1080p', '720p', '480p'];
  String _selectedQuality = 'Auto';
  bool _autoDownload = false;
  bool _progressNotifications = true;
  double _userRating = 4.6;
  late List<_LessonState> _lessonStates;
  final Map<String, List<LessonComment>> _commentsByLesson = {
    'ai-1': const [
      LessonComment(author: 'ليلى', message: 'شرح واضح، هل يمكن مشاركة نموذج قياس الجاهزية؟', timeAgo: 'منذ ساعتين'),
    ],
    'data-1': const [
      LessonComment(author: 'سالم', message: 'ملف الـ Notebook مفيد جداً، شكراً!', timeAgo: 'منذ يوم'),
    ],
  };

  @override
  void initState() {
    super.initState();
    _lessonStates = widget.course.lessons.map((lesson) => _LessonState(lesson: lesson)).toList();
    if (_lessonStates.isNotEmpty) {
      _lessonStates.first.isUnlocked = true;
    }
  }

  double get _progress {
    if (_lessonStates.isEmpty) return 0;
    final completed = _lessonStates.where((lesson) => lesson.isCompleted).length;
    return completed / _lessonStates.length;
  }

  void _handleEnroll() {
    if (widget.course.priceType == CoursePrice.free) {
      UiFeedback.showSnack(context, 'تم الاشتراك في الدورة مجاناً.');
    } else {
      UiFeedback.showActionSheet(
        context,
        title: 'الدفع الآمن',
        description: 'سعر الدورة ${widget.course.priceLabel}. اختر وسيلة الدفع المناسبة.',
        actions: [
          SheetAction(
            label: 'الدفع عبر البطاقات الدولية',
            icon: Icons.credit_card,
            onSelected: () => UiFeedback.showSnack(context, 'تم إرسال رابط الدفع.'),
          ),
          SheetAction(
            label: 'تحويل مصرفي للشركات',
            icon: Icons.account_balance,
            onSelected: () => UiFeedback.showSnack(context, 'سيتم التواصل لتأكيد التحويل.'),
          ),
        ],
      );
    }
  }

  void _handleOfflineToggle(bool value) {
    setState(() {
      _autoDownload = value;
      if (_autoDownload) {
        for (final lesson in _lessonStates) {
          if (lesson.lesson.supportsOffline) {
            lesson.isDownloaded = true;
          }
        }
      }
    });
    UiFeedback.showSnack(context, value ? 'سيتم تنزيل الفيديوهات تلقائياً عند ضعف الإنترنت.' : 'تم إيقاف وضع عدم الاتصال.');
  }

  void _toggleDownload(_LessonState state) {
    if (!state.lesson.supportsOffline) {
      UiFeedback.showSnack(context, 'هذا الدرس غير متاح للتنزيل.');
      return;
    }
    setState(() => state.isDownloaded = !state.isDownloaded);
    UiFeedback.showSnack(context, state.isDownloaded ? 'تم تنزيل الفيديو.' : 'تم حذف النسخة المحملة.');
  }

  void _completeLesson(int index) {
    final state = _lessonStates[index];
    if (!state.isUnlocked) {
      UiFeedback.showSnack(context, 'أكمل الدرس السابق لفتح هذا المحتوى (Auto Unlock).');
      return;
    }
    if (state.isCompleted) {
      UiFeedback.showSnack(context, 'تم احتساب هذا الدرس مسبقاً.');
      return;
    }
    setState(() {
      state.isCompleted = true;
      if (index + 1 < _lessonStates.length) {
        _lessonStates[index + 1].isUnlocked = true;
      }
    });
    UiFeedback.showSnack(context, 'تم تحديث تقدمك تلقائياً.');
  }

  void _handleResourceTap(CourseResource resource) {
    UiFeedback.showSnack(context, 'تم فتح ${resource.title}.');
  }

  void _openLessonComments(_LessonState state) {
    final comments = _commentsByLesson[state.lesson.id] ?? const [];
    final controller = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20 + MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('تعليقات الدرس: ${state.lesson.title}', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              if (comments.isEmpty)
                const Text('لا توجد تعليقات بعد، كن أول من يشارك ملاحظته.'),
              ...comments.map((comment) => ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person_outline)),
                    title: Text(comment.author),
                    subtitle: Text('${comment.message}\n${comment.timeAgo}'),
                  )),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'أضف تعليقك',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send_outlined),
                    onPressed: () {
                      Navigator.of(sheetContext).pop();
                      UiFeedback.showSnack(context, 'تم إرسال تعليقك (محاكاة).');
                    },
                  ),
                ),
                maxLines: null,
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitRating() {
    UiFeedback.showSnack(context, 'تم تسجيل تقييمك ${_userRating.toStringAsFixed(1)} للدورة والمدرب.');
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 32),
          children: [
            _VideoHero(
              course: course,
              selectedQuality: _selectedQuality,
              qualityOptions: _qualityOptions,
              onQualityChanged: (value) => setState(() => _selectedQuality = value),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(course.title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      _PricePill(label: course.priceLabel),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('${course.instructor} · ${course.instructorTitle}'),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: LinearProgressIndicator(
                      value: _progress,
                      minHeight: 10,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation(Color(0xFF4B2FB9)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('تم إنجاز ${(100 * _progress).toStringAsFixed(0)}% · يتم فتح الدرس التالي تلقائياً بعد إكمال الحالي (Auto Unlock).'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _handleEnroll,
                          icon: const Icon(Icons.check_circle_outline),
                          label: Text(course.priceType == CoursePrice.free ? 'اشترك مجاناً' : 'اطلب الاشتراك المدفوع'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () => UiFeedback.showSnack(context, 'تمت إضافة الدورة للمفضلة (محاكاة).'),
                        icon: const Icon(Icons.bookmark_add_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text('أهداف التعلم', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: course.objectives
                        .map((objective) => Chip(label: Text(objective)))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('قيّم تجربتك', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.star_rate_rounded, color: Colors.amber),
                              Expanded(
                                child: Slider(
                                  value: _userRating,
                                  onChanged: (value) => setState(() => _userRating = value),
                                  divisions: 10,
                                  min: 1,
                                  max: 5,
                                  label: _userRating.toStringAsFixed(1),
                                ),
                              ),
                              Text(_userRating.toStringAsFixed(1)),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: ElevatedButton(
                              onPressed: _submitRating,
                              child: const Text('إرسال التقييم'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(course.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5)),
                  const SizedBox(height: 24),
                  SwitchListTile.adaptive(
                    value: _autoDownload,
                    onChanged: _handleOfflineToggle,
                    title: const Text('وضع عدم الاتصال'),
                    subtitle: const Text('سيتم تنزيل الفيديوهات تلقائياً عند ضعف الإنترنت ليدرس المتعلم دون انقطاع.'),
                    secondary: const Icon(Icons.download_for_offline_outlined),
                  ),
                  SwitchListTile.adaptive(
                    value: _progressNotifications,
                    onChanged: (value) {
                      setState(() => _progressNotifications = value);
                      UiFeedback.showSnack(context, value ? 'ستصلك تنبيهات التقدم والدروس الجديدة.' : 'تم إيقاف الإشعارات لهذه الدورة.');
                    },
                    title: const Text('تنبيهات التقدم والدروس'),
                    subtitle: const Text('نرسل لك تنبيهات عند فتح درس جديد أو صدور ملاحظات المدرّب.'),
                    secondary: const Icon(Icons.notifications_active_outlined),
                  ),
                ],
              ),
            ),
            _LessonList(
              lessons: _lessonStates,
              onPlay: _completeLesson,
              onDownload: _toggleDownload,
              onComments: _openLessonComments,
              selectedQuality: _selectedQuality,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('مواد إضافية (PDF · اختبارات · أنشطة)', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  ...course.resources.map(
                    (resource) => Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: Icon(resource.icon, color: const Color(0xFF4B2FB9)),
                        title: Text(resource.title),
                        subtitle: Text('${resource.description} · ${resource.sizeLabel}'),
                        trailing: const Icon(Icons.chevron_left),
                        onTap: () => _handleResourceTap(resource),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    color: const Color(0xFF101726),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Icon(Icons.shield_outlined, color: Colors.white),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'حماية المحتوى: جميع الفيديوهات مشفرة ويتم منع النسخ أو التحميل غير المصرح به (DRM).',
                              style: TextStyle(color: Colors.white, height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LessonState {
  _LessonState({required this.lesson});

  final CourseLesson lesson;
  bool isUnlocked = false;
  bool isCompleted = false;
  bool isDownloaded = false;
}

class _VideoHero extends StatelessWidget {
  const _VideoHero({
    required this.course,
    required this.selectedQuality,
    required this.qualityOptions,
    required this.onQualityChanged,
  });

  final Course course;
  final String selectedQuality;
  final List<String> qualityOptions;
  final ValueChanged<String> onQualityChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(course.coverImage, fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.65), Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: ElevatedButton.icon(
              onPressed: () => UiFeedback.showSnack(context, 'تشغيل الفيديو بجودة $selectedQuality (محاكاة).'),
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('تشغيل المقدمة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedQuality,
                  dropdownColor: Colors.black87,
                  iconEnabledColor: Colors.white,
                  items: qualityOptions
                      .map(
                        (quality) => DropdownMenuItem<String>(
                          value: quality,
                          child: Text(quality, style: const TextStyle(color: Colors.white)),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      onQualityChanged(value);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LessonList extends StatelessWidget {
  const _LessonList({
    required this.lessons,
    required this.onPlay,
    required this.onDownload,
    required this.onComments,
    required this.selectedQuality,
  });

  final List<_LessonState> lessons;
  final void Function(int index) onPlay;
  final void Function(_LessonState state) onDownload;
  final void Function(_LessonState state) onComments;
  final String selectedQuality;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('محتوى الدورة (Auto Unlock)', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        ...List.generate(lessons.length, (index) {
          final lessonState = lessons[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: lessonState.isCompleted ? const Color(0xFF4B2FB9) : Colors.grey[200],
                child: Icon(
                  lessonState.isCompleted ? Icons.check : Icons.play_arrow_rounded,
                  color: lessonState.isCompleted ? Colors.white : Colors.black54,
                ),
              ),
              title: Text(lessonState.lesson.title),
              subtitle: Text('${lessonState.lesson.durationMinutes} دقيقة · جودة $selectedQuality'),
              trailing: Wrap(
                spacing: 8,
                children: [
                  IconButton(
                    onPressed: lessonState.isUnlocked ? () => onPlay(index) : null,
                    icon: Icon(
                      lessonState.isUnlocked ? Icons.play_circle_outline : Icons.lock_outline,
                      color: lessonState.isUnlocked ? const Color(0xFF4B2FB9) : Colors.grey,
                    ),
                    tooltip: lessonState.isUnlocked ? 'ابدأ الدرس' : 'مغلق',
                  ),
                  IconButton(
                    onPressed: () => onDownload(lessonState),
                    icon: Icon(
                      lessonState.isDownloaded ? Icons.check_circle : Icons.download_outlined,
                      color: lessonState.isDownloaded ? Colors.green : Colors.grey,
                    ),
                    tooltip: lessonState.isDownloaded ? 'تم التنزيل' : 'تنزيل مسبق',
                  ),
                  IconButton(
                    onPressed: () => onComments(lessonState),
                    icon: const Icon(Icons.mode_comment_outlined),
                    tooltip: 'التعليقات',
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class LessonComment {
  const LessonComment({required this.author, required this.message, required this.timeAgo});

  final String author;
  final String message;
  final String timeAgo;
}

class _PricePill extends StatelessWidget {
  const _PricePill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE6FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: const TextStyle(color: Color(0xFF4B2FB9), fontWeight: FontWeight.bold)),
    );
  }
}
