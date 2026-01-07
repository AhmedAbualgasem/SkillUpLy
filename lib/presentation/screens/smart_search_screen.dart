import 'package:flutter/material.dart';
import 'package:skillup_libya/core/models/course.dart';
import 'courses/course_detail_screen.dart';

class SmartSearchScreen extends StatefulWidget {
  const SmartSearchScreen({super.key, this.initialQuery = ''});

  final String initialQuery;

  @override
  State<SmartSearchScreen> createState() => _SmartSearchScreenState();
}

class _SmartSearchScreenState extends State<SmartSearchScreen> {
  late final TextEditingController _controller = TextEditingController(text: widget.initialQuery);
  String _query = '';

  @override
  void initState() {
    super.initState();
    _query = widget.initialQuery;
  }

  List<Course> get _courseMatches {
    final lower = _query.toLowerCase();
    return CourseFixtures.sampleCourses.where((course) {
      if (lower.isEmpty) return true;
      return course.title.toLowerCase().contains(lower) ||
          course.description.toLowerCase().contains(lower) ||
          course.categoryLabel.toLowerCase().contains(lower) ||
          course.instructor.toLowerCase().contains(lower);
    }).toList();
  }

  List<String> get _instructorMatches {
    final lower = _query.toLowerCase();
    final names = CourseFixtures.sampleCourses.map((c) => c.instructor).toSet().toList();
    if (lower.isEmpty) return names;
    return names.where((name) => name.toLowerCase().contains(lower)).toList();
  }

  List<String> get _keywordMatches {
    final keywords = <String>{};
    for (final course in CourseFixtures.sampleCourses) {
      keywords.addAll(course.objectives);
      keywords.addAll(course.description.split(' '));
    }
    final lower = _query.toLowerCase();
    if (lower.isEmpty) {
      return keywords.take(6).toList();
    }
    return keywords.where((word) => word.toLowerCase().contains(lower)).take(10).toList();
  }

  List<Course> get _suggestedCourses {
    if (_courseMatches.isEmpty) {
      return CourseFixtures.sampleCourses.take(2).toList();
    }
    final primaryCategory = _courseMatches.first.category;
    return CourseFixtures.sampleCourses.where((course) => course.category == primaryCategory).take(3).toList();
  }

  void _openCourse(Course course) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CourseDetailScreen(course: course)),
    );
  }

  void _applyKeyword(String keyword) {
    setState(() {
      _query = keyword;
      _controller.text = keyword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('البحث الذكي')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                labelText: 'ابحث عن دورة، مدرب، أو كلمة مفتاحية',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() {
                          _controller.clear();
                          _query = '';
                        }),
                      ),
              ),
              onChanged: (value) => setState(() => _query = value.trim()),
            ),
            const SizedBox(height: 24),
            _SectionHeader(title: 'نتائج الدورات (${_courseMatches.length})'),
            const SizedBox(height: 12),
            if (_courseMatches.isEmpty)
              _EmptyState(onReset: () => setState(() {
                    _controller.clear();
                    _query = '';
                  }))
            else
              ..._courseMatches
                  .map(
                    (course) => Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(course.coverImage),
                        ),
                        title: Text(course.title),
                        subtitle: Text('${course.categoryLabel} · ${course.levelLabel}'),
                        trailing: const Icon(Icons.chevron_left),
                        onTap: () => _openCourse(course),
                      ),
                    ),
                  )
                  .toList(),
            const SizedBox(height: 24),
            _SectionHeader(title: 'المدربون'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _instructorMatches
                  .map(
                    (name) => ActionChip(
                      label: Text(name),
                      avatar: const Icon(Icons.record_voice_over_outlined, size: 16),
                      onPressed: () => setState(() => _query = name),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            _SectionHeader(title: 'الكلمات المفتاحية المقترحة'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _keywordMatches
                  .map(
                    (keyword) => FilterChip(
                      label: Text(keyword),
                      selected: _query == keyword,
                      onSelected: (_) => _applyKeyword(keyword),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            Card(
              color: const Color(0xFF101726),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('اقتراحات مشابهة', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ..._suggestedCourses.map(
                      (course) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(course.title, style: const TextStyle(color: Colors.white)),
                        subtitle: Text(course.categoryLabel, style: const TextStyle(color: Colors.white70)),
                        trailing: IconButton(
                          icon: const Icon(Icons.play_circle_outline, color: Colors.white),
                          onPressed: () => _openCourse(course),
                        ),
                      ),
                    ),
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

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold));
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onReset});

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('لا توجد نتائج مطابقة.'),
          const SizedBox(height: 8),
          TextButton.icon(onPressed: onReset, icon: const Icon(Icons.refresh), label: const Text('إعادة البحث')),
        ],
      ),
    );
  }
}
