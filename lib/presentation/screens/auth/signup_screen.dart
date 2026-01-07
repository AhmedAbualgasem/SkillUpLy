import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skillup_libya/core/models/account_type.dart';
import 'package:skillup_libya/core/security/password_hasher.dart';
import 'package:skillup_libya/core/ui_feedback.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSubmitting = false;
  bool _obscurePassword = true;
  AccountType _accountType = AccountType.student;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);
    await Future.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() => _isSubmitting = false);
    final passwordDigest = PasswordHasher.hash(_passwordController.text.trim());
    debugPrint('Password digest: $passwordDigest');
    UiFeedback.showSnack(
      context,
      'تم إنشاء الحساب (${_accountType.label}) (محاكاة) مع تشفير كلمة المرور.',
    );
    Navigator.of(context).pop();
  }

  void _handleSocialSignup(String provider) {
    UiFeedback.showSnack(context, 'جارٍ إنشاء الحساب عبر $provider (محاكاة).');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء حساب')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ابدأ رحلتك مع SkillUp Libya',
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'أنشئ حساب شركتك لتتابع المسارات وتضيف أعضاء فريقك.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'الاسم الكامل',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().length < 3) {
                      return 'أدخل الاسم الكامل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'البريد المهني',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'أدخل البريد المهني';
                    }
                    if (!value.contains('@')) {
                      return 'صيغة البريد غير صحيحة';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'رقم الهاتف',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'أدخل رقم الهاتف';
                    }
                    if (value.trim().length < 8) {
                      return 'رقم الهاتف غير مكتمل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Text('حدد نوع الحساب', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: AccountType.values
                      .map(
                        (type) => ChoiceChip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(type.icon, size: 16),
                              const SizedBox(width: 6),
                              Text(type.label),
                            ],
                          ),
                          selected: _accountType == type,
                          onSelected: (_) => setState(() => _accountType = type),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 24),
                CheckboxListTile(
                  value: true,
                  onChanged: (_) {},
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('أوافق على شروط الاستخدام وسياسة الخصوصية.'),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submit,
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                    child: _isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('إنشاء الحساب'),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('أو أنشئ حسابك عبر'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () => _handleSocialSignup('Google'),
                      icon: const Icon(Icons.g_mobiledata, size: 28),
                      label: const Text('Google'),
                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _handleSocialSignup('Facebook'),
                      icon: const Icon(Icons.facebook_outlined),
                      label: const Text('Facebook'),
                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
