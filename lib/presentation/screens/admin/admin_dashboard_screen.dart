import 'package:flutter/material.dart';
import 'package:skillup_libya/core/models/course.dart';
import 'package:skillup_libya/core/ui_feedback.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  void _createCourse(BuildContext context) {
    UiFeedback.showSnack(context, 'واجهة إنشاء دورة ستفتح (محاكاة).');
  }

  void _manageUsers(BuildContext context) {
    UiFeedback.showSnack(context, 'تم فتح إدارة المستخدمين (محاكاة).');
  }

  void _verifyPayment(BuildContext context) {
    UiFeedback.showSnack(context, 'تم التحقق من التحويل وإرسال إشعار.');
  }

  void _sendNotification(BuildContext context) {
    UiFeedback.showActionSheet(
      context,
      title: 'إرسال إشعار',
      description: 'اختر نوع الإشعار الذي ترغب بإرساله للمتعلمين.',
      actions: [
        SheetAction(
          label: 'تنبيه تقدم الدروس',
          icon: Icons.timeline_outlined,
          onSelected: () => UiFeedback.showSnack(context, 'تم إرسال التنبيه.'),
        ),
        SheetAction(
          label: 'رسالة إدارية',
          icon: Icons.mail_outline,
          onSelected: () => UiFeedback.showSnack(context, 'وصلت الرسالة للمستخدمين المحددين.'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة التحكم الإدارية'),
        actions: [
          IconButton(onPressed: () => _sendNotification(context), icon: const Icon(Icons.notifications_active_outlined)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: const [
                _MetricTile(label: 'عدد المستخدمين', value: '52,430', trend: '+8% خلال شهر'),
                _MetricTile(label: 'الدورات النشطة', value: '135', trend: '+4 دورات'),
                _MetricTile(label: 'المبيعات هذا الربع', value: '1.2M LYD', trend: '+12%'),
                _MetricTile(label: 'مؤشر التفاعل', value: '87%', trend: 'ارتفاع 5 نقاط'),
              ],
            ),
            const SizedBox(height: 24),
            _SectionCard(
              title: 'إدارة الدورات',
              actionLabel: 'إضافة دورة',
              onAction: () => _createCourse(context),
              child: Column(
                children: CourseFixtures.sampleCourses
                    .map(
                      (course) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(course.title),
                        subtitle: Text('${course.categoryLabel} · ${course.levelLabel}'),
                        trailing: Wrap(
                          spacing: 4,
                          children: [
                            IconButton(onPressed: () => UiFeedback.showSnack(context, 'تم تعديل ${course.title} (محاكاة).'), icon: const Icon(Icons.edit_outlined)),
                            IconButton(onPressed: () => UiFeedback.showSnack(context, 'تمت أرشفة ${course.title} (محاكاة).'), icon: const Icon(Icons.delete_outline)),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            _SectionCard(
              title: 'إدارة المستخدمين والمدربين',
              actionLabel: 'فتح اللوحة',
              onAction: () => _manageUsers(context),
              child: Column(
                children: const [
                  _UserRow(name: 'ليلى الورفلي', role: 'مدربة رئيسية', status: 'نشط'),
                  _UserRow(name: 'سالم كشلاف', role: 'مشرف شركات', status: 'نشط'),
                  _UserRow(name: 'يوسف العريبي', role: 'طالب مميز', status: 'بانتظار التفعيل'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _SectionCard(
              title: 'المدفوعات والتحويلات',
              actionLabel: 'مراجعة',
              onAction: () => _verifyPayment(context),
              child: Column(
                children: const [
                  _PaymentRow(company: 'مصرف الأمان', amount: '4200 LYD', status: 'بانتظار المراجعة'),
                  _PaymentRow(company: 'المدار الجديد', amount: '980 LYD', status: 'تم الاعتماد'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _SectionCard(
              title: 'تقارير النشاط',
              actionLabel: 'تحميل PDF',
              onAction: () => UiFeedback.showSnack(context, 'تم تجهيز ملف التقارير (محاكاة).'),
              child: Column(
                children: [
                  _ReportRow(icon: Icons.people_outline, title: 'نشاط المستخدمين', description: 'متوسط جلسة التعلم 42 دقيقة'),
                  _ReportRow(icon: Icons.auto_graph_outlined, title: 'أداء الدورات', description: 'أعلى تقييم لدورة الأمن السيبراني'),
                  _ReportRow(icon: Icons.shopping_bag_outlined, title: 'المبيعات', description: 'ارتفاع الطلب على باقات الشركات'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value, required this.trend});

  final String label;
  final String value;
  final String trend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(0, 10), blurRadius: 24)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
          const SizedBox(height: 8),
          Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.trending_up, size: 16, color: Color(0xFF4B2FB9)),
              const SizedBox(width: 4),
              Text(trend, style: const TextStyle(color: Color(0xFF4B2FB9))),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.actionLabel, required this.onAction, required this.child});

  final String title;
  final String actionLabel;
  final VoidCallback onAction;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                ),
                TextButton(onPressed: onAction, child: Text(actionLabel)),
              ],
            ),
            const Divider(),
            child,
          ],
        ),
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow({required this.name, required this.role, required this.status});

  final String name;
  final String role;
  final String status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(name),
      subtitle: Text(role),
      trailing: Chip(label: Text(status)),
    );
  }
}

class _PaymentRow extends StatelessWidget {
  const _PaymentRow({required this.company, required this.amount, required this.status});

  final String company;
  final String amount;
  final String status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(company),
      subtitle: Text(status),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class _ReportRow extends StatelessWidget {
  const _ReportRow({required this.icon, required this.title, required this.description});

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFEDEBFF),
        child: Icon(icon, color: const Color(0xFF4B2FB9)),
      ),
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
