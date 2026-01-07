import 'package:flutter/material.dart';
import 'package:skillup_libya/core/ui_feedback.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static const _cashLocations = [
    _CashOffice('طرابلس - برج الشهداء', 'من الأحد إلى الخميس · 09:00 - 16:00'),
    _CashOffice('بنغازي - مركز وادي الصحراء', 'من السبت إلى الأربعاء · 10:00 - 15:00'),
  ];

  static const _bankAccounts = [
    _BankAccount('المصرف التجاري الوطني', 'IBAN: LY64 1234 5678 9123', 'الحساب: SkillUp Libya Training'),
    _BankAccount('مصرف الوحدة', 'IBAN: LY02 4321 8765 1234', 'الحساب: SkillUp Libya Corporate'),
  ];

  static final _history = [
    _PaymentRecord(date: '27 ديسمبر 2025', description: 'دورة قيادة الذكاء الاصطناعي', method: 'تحويل مصرفي', amount: 260, status: PaymentStatus.confirmed),
    _PaymentRecord(date: '10 ديسمبر 2025', description: 'اشتراك باقة الشركات', method: 'دفع نقدي', amount: 980, status: PaymentStatus.pending),
    _PaymentRecord(date: '21 نوفمبر 2025', description: 'مقعد إضافي لمسار الأمن السيبراني', method: 'تحويل مصرفي', amount: 310, status: PaymentStatus.reconciled),
  ];

  void _requestCashPayment(BuildContext context, _CashOffice office) {
    UiFeedback.showActionSheet(
      context,
      title: 'حجز دفع نقدي',
      description: '${office.name}\n${office.hours}',
      actions: [
        SheetAction(
          label: 'تأكيد الموعد',
          icon: Icons.event_available_outlined,
          onSelected: () => UiFeedback.showSnack(context, 'تم إشعار فريق المكتب لاستقبالك.'),
        ),
      ],
    );
  }

  void _requestBankTransfer(BuildContext context, _BankAccount account) {
    UiFeedback.showActionSheet(
      context,
      title: account.bank,
      description: '${account.iban}\n${account.holder}',
      actions: [
        SheetAction(
          label: 'إرسال إشعار التحويل',
          icon: Icons.send_outlined,
          onSelected: () => UiFeedback.showSnack(context, 'سيتم تفعيل الدورة فور مراجعة فريق المالية.'),
        ),
      ],
    );
  }

  void _contactFinance(BuildContext context) {
    UiFeedback.showSnack(context, 'تم فتح قناة دعم المالية (محاكاة).');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نظام الدفع والاشتراكات'),
        actions: [
          IconButton(onPressed: () => _contactFinance(context), icon: const Icon(Icons.support_agent_outlined)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('قنوات الدفع المتاحة', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: _cashLocations
                          .map(
                            (office) => _PaymentOptionCard(
                              title: office.name,
                              subtitle: office.hours,
                              icon: Icons.store_mall_directory_outlined,
                              actionLabel: 'حجز دفعة نقدية',
                              onPressed: () => _requestCashPayment(context, office),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: _bankAccounts
                          .map(
                            (account) => _PaymentOptionCard(
                              title: account.bank,
                              subtitle: '${account.iban}\n${account.holder}',
                              icon: Icons.account_balance_outlined,
                              actionLabel: 'إرسال إشعار التحويل',
                              onPressed: () => _requestBankTransfer(context, account),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('تفعيل تلقائي بعد المراجعة', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    _ActivationTimeline(steps: const [
                      _ActivationStep('استلام الدفع', 'يتم التحقق من الإيصال خلال 4 ساعات عمل'),
                      _ActivationStep('تأكيد الإدارة', 'تصلك رسالة عند اعتماد الطلب'),
                      _ActivationStep('فتح الدورة تلقائياً', 'يتم تفعيل المقاعد فوراً مع إشعار المتعلمين'),
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('سجل عمليات الدفع', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ..._history.map((record) => _PaymentRecordTile(record: record)).toList(),
          ],
        ),
      ),
    );
  }
}

class _PaymentOptionCard extends StatelessWidget {
  const _PaymentOptionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.actionLabel,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FE),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF4B2FB9)),
          const SizedBox(height: 12),
          Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: onPressed, child: Text(actionLabel)),
        ],
      ),
    );
  }
}

class _ActivationTimeline extends StatelessWidget {
  const _ActivationTimeline({required this.steps});

  final List<_ActivationStep> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < steps.length; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4B2FB9),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  if (i != steps.length - 1)
                    Container(
                      width: 2,
                      height: 40,
                      color: const Color(0xFF4B2FB9).withOpacity(0.3),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(steps[i].title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(steps[i].description, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class _PaymentRecordTile extends StatelessWidget {
  const _PaymentRecordTile({required this.record});

  final _PaymentRecord record;

  Color _statusColor(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.pending:
        return Colors.orange;
      case PaymentStatus.confirmed:
        return Colors.green;
      case PaymentStatus.reconciled:
        return Colors.blueGrey;
    }
  }

  String _statusLabel(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.pending:
        return 'بانتظار التأكيد';
      case PaymentStatus.confirmed:
        return 'مؤكد';
      case PaymentStatus.reconciled:
        return 'مغلق محاسبياً';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _statusColor(record.status).withOpacity(0.15),
          child: Icon(Icons.receipt_long_outlined, color: _statusColor(record.status)),
        ),
        title: Text(record.description),
        subtitle: Text('${record.method} · ${record.date}'),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${record.amount.toStringAsFixed(0)} LYD', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(_statusLabel(record.status), style: TextStyle(color: _statusColor(record.status))),
          ],
        ),
      ),
    );
  }
}

class _CashOffice {
  const _CashOffice(this.name, this.hours);
  final String name;
  final String hours;
}

class _BankAccount {
  const _BankAccount(this.bank, this.iban, this.holder);
  final String bank;
  final String iban;
  final String holder;
}

class _ActivationStep {
  const _ActivationStep(this.title, this.description);
  final String title;
  final String description;
}

enum PaymentStatus { pending, confirmed, reconciled }

class _PaymentRecord {
  const _PaymentRecord({
    required this.date,
    required this.description,
    required this.method,
    required this.amount,
    required this.status,
  });

  final String date;
  final String description;
  final String method;
  final double amount;
  final PaymentStatus status;
}
