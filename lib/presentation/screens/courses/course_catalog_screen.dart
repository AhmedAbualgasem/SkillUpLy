import 'package:flutter/material.dart';
import 'package:skillup_libya/core/models/course.dart';
import 'package:skillup_libya/core/ui_feedback.dart';
import 'course_detail_screen.dart';

class CourseCatalogScreen extends StatefulWidget {
  const CourseCatalogScreen({super.key});

  @override
  State<CourseCatalogScreen> createState() => _CourseCatalogScreenState();
}

class _CourseCatalogScreenState extends State<CourseCatalogScreen> {
  CourseCategory? _selectedCategory;
  CourseLevel? _selectedLevel;
  CoursePrice? _selectedPrice;
  String? _selectedInstructor;

  List<Course> get _courses => CourseFixtures.sampleCourses;

  List<Course> get _filteredCourses {
    return _courses.where((course) {
      final matchesCategory = _selectedCategory == null || _selectedCategory == course.category;
      final matchesLevel = _selectedLevel == null || _selectedLevel == course.level;
      final matchesPrice = _selectedPrice == null || _selectedPrice == course.priceType;
      final matchesInstructor = _selectedInstructor == null || _selectedInstructor == course.instructor;
      return matchesCategory && matchesLevel && matchesPrice && matchesInstructor;
    }).toList();
  }

  List<String> get _instructors => _courses.map((c) => c.instructor).toSet().toList();

  void _clearFilters() {
    setState(() {
      _selectedCategory = null;
      _selectedLevel = null;
      _selectedPrice = null;
      _selectedInstructor = null;
    });
  }

  void _openCourse(Course course) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CourseDetailScreen(course: course)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasFilters = _selectedCategory != null || _selectedLevel != null || _selectedPrice != null || _selectedInstructor != null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة الدورات التعليمية'),
        actions: [
          if (hasFilters)
            TextButton(
              onPressed: _clearFilters,
              child: const Text('إعادة الضبط', style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
          children: [
            _FiltersPanel(
              selectedCategory: _selectedCategory,
              selectedLevel: _selectedLevel,
              selectedPrice: _selectedPrice,
              selectedInstructor: _selectedInstructor,
              instructors: _instructors,
              onCategoryChanged: (value) => setState(() => _selectedCategory = value),
              onLevelChanged: (value) => setState(() => _selectedLevel = value),
              onPriceChanged: (value) => setState(() => _selectedPrice = value),
              onInstructorChanged: (value) => setState(() => _selectedInstructor = value),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_filteredCourses.length} دورة متاحة', style: Theme.of(context).textTheme.titleMedium),
                IconButton(
                  onPressed: () => UiFeedback.showSnack(context, 'تم تصدير تقرير إدارة الدورات (محاكاة).'),
                  icon: const Icon(Icons.ios_share_outlined),
                  tooltip: 'تصدير تقرير',
                ),
              ],
            ),
            const SizedBox(height: 12),
            ..._filteredCourses.map((course) => _CourseCard(course: course, onOpen: _openCourse)).toList(),
            if (_filteredCourses.isEmpty)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: const [
                    Icon(Icons.info_outline),
                    SizedBox(height: 12),
                    Text('لا توجد دورات مطابقة لهذه المعايير، جرّب تغيير الفلاتر.'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FiltersPanel extends StatelessWidget {
  const _FiltersPanel({
    required this.selectedCategory,
    required this.selectedLevel,
    required this.selectedPrice,
    required this.selectedInstructor,
    required this.instructors,
    required this.onCategoryChanged,
    required this.onLevelChanged,
    required this.onPriceChanged,
    required this.onInstructorChanged,
  });

  final CourseCategory? selectedCategory;
  final CourseLevel? selectedLevel;
  final CoursePrice? selectedPrice;
  final String? selectedInstructor;
  final List<String> instructors;
  final ValueChanged<CourseCategory?> onCategoryChanged;
  final ValueChanged<CourseLevel?> onLevelChanged;
  final ValueChanged<CoursePrice?> onPriceChanged;
  final ValueChanged<String?> onInstructorChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(0, 12), blurRadius: 32)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('فلترة متقدمة', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text('التصنيف', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: CourseCategory.values
                .map(
                  (category) => ChoiceChip(
                    label: Text(category.label),
                    selected: selectedCategory == category,
                    onSelected: (value) => onCategoryChanged(value ? category : null),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          Text('المستوى', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: CourseLevel.values
                .map(
                  (level) => ChoiceChip(
                    label: Text(level.label),
                    selected: selectedLevel == level,
                    onSelected: (value) => onLevelChanged(value ? level : null),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          Text('نوع التسعير', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: CoursePrice.values
                .map(
                  (price) => FilterChip(
                    label: Text(price.label),
                    selected: selectedPrice == price,
                    onSelected: (value) => onPriceChanged(value ? price : null),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: selectedInstructor,
            decoration: const InputDecoration(
              labelText: 'المدرب',
              prefixIcon: Icon(Icons.record_voice_over_outlined),
            ),
            items: instructors
                .map(
                  (name) => DropdownMenuItem<String>(
                    value: name,
                    child: Text(name),
                  ),
                )
                .toList(),
            onChanged: onInstructorChanged,
          ),
        ],
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({required this.course, required this.onOpen});

  final Course course;
  final ValueChanged<Course> onOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(0, 12), blurRadius: 32)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            child: Image.network(course.coverImage, height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _InfoChip(label: course.categoryLabel, icon: Icons.category_outlined),
                    _InfoChip(label: course.levelLabel, icon: Icons.bar_chart_outlined),
                    _InfoChip(label: course.priceLabel, icon: Icons.payments_outlined),
                  ],
                ),
                const SizedBox(height: 12),
                Text(course.title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('${course.instructor} · ${course.instructorTitle}', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.star_rate_rounded, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(course.rating.toStringAsFixed(1)),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 18),
                    const SizedBox(width: 4),
                    Text('${course.totalHours} ساعة'),
                  ],
                ),
                const SizedBox(height: 16),
                Text(course.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => UiFeedback.showSnack(context, 'تمت إضافة الدورة إلى المسار (محاكاة).'),
                        child: const Text('إضافة للمسار'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => onOpen(course),
                        child: const Text('فتح لوحة الدورة'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF4B2FB9)),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Color(0xFF4B2FB9))),
        ],
      ),
    );
  }
}

extension on CourseCategory {
  String get label {
    switch (this) {
      case CourseCategory.ai:
        return 'الذكاء الاصطناعي';
      case CourseCategory.data:
        return 'علوم البيانات';
      case CourseCategory.security:
        return 'الأمن السيبراني';
      case CourseCategory.leadership:
        return 'قادة الأعمال';
      case CourseCategory.product:
        return 'المنتجات الرقمية';
    }
  }
}

extension on CourseLevel {
  String get label {
    switch (this) {
      case CourseLevel.beginner:
        return 'مبتدئ';
      case CourseLevel.intermediate:
        return 'متوسط';
      case CourseLevel.advanced:
        return 'متقدم';
    }
  }
}

extension on CoursePrice {
  String get label {
    switch (this) {
      case CoursePrice.free:
        return 'مجانية';
      case CoursePrice.paid:
        return 'مدفوعة';
    }
  }
}
