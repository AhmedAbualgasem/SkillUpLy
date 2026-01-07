import 'package:flutter/material.dart';
import 'package:skillup_libya/core/models/account_type.dart';
import 'package:skillup_libya/core/ui_feedback.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({
    super.key,
    required this.initialName,
    required this.initialPhone,
    required this.initialEmail,
    required this.initialAccountType,
    required this.initialAvatarColor,
  });

  final String initialName;
  final String initialPhone;
  final String initialEmail;
  final AccountType initialAccountType;
  final Color initialAvatarColor;

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController = TextEditingController(text: widget.initialName);
  late final TextEditingController _phoneController = TextEditingController(text: widget.initialPhone);
  late final TextEditingController _emailController = TextEditingController(text: widget.initialEmail);
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  late AccountType _accountType = widget.initialAccountType;

  static const _avatarPalette = <Color>[
    Color(0xFF4B2FB9),
    Color(0xFF0F3B65),
    Color(0xFFB9314F),
    Color(0xFF00695C),
    Color(0xFF6A1B9A),
  ];
  late int _avatarIndex = _avatarPalette.indexOf(widget.initialAvatarColor);

  @override
  void initState() {
    super.initState();
    if (_avatarIndex == -1) {
      _avatarIndex = 0;
    }
  }

  Color get _currentAvatarColor {
    if (_avatarIndex < 0 || _avatarIndex >= _avatarPalette.length) {
      return _avatarPalette.first;
    }
    return _avatarPalette[_avatarIndex];
  }

  void _cycleAvatar() {
    setState(() => _avatarIndex = (_avatarIndex + 1) % _avatarPalette.length);
    UiFeedback.showSnack(context, 'تم تحديث الصورة (محاكاة).');
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    if (newPassword.isNotEmpty) {
      if (newPassword.length < 6) {
        UiFeedback.showSnack(context, 'كلمة المرور الجديدة قصيرة جداً.');
        return;
      }
      if (newPassword != confirmPassword) {
        UiFeedback.showSnack(context, 'تأكيد كلمة المرور غير متطابق.');
        return;
      }
    }

    Navigator.of(context).pop(
      ProfileUpdateResult(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        accountType: _accountType,
        avatarColor: _currentAvatarColor,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحديث الملف الشخصي'),
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('حفظ', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: _currentAvatarColor,
                        child: const Icon(Icons.person_outline, size: 40, color: Colors.white),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: _cycleAvatar,
                          icon: const Icon(Icons.camera_alt_outlined),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
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
                  controller: _emailController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'البريد المهني',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                ),
                const SizedBox(height: 24),
                Text('نوع الحساب', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
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
                Text('تحديث كلمة المرور', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور الجديدة',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'تأكيد كلمة المرور',
                    prefixIcon: Icon(Icons.lock_reset_outlined),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _save,
                    icon: const Icon(Icons.save_outlined),
                    label: const Text('حفظ التغييرات'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileUpdateResult {
  const ProfileUpdateResult({
    required this.name,
    required this.phone,
    required this.accountType,
    required this.avatarColor,
  });

  final String name;
  final String phone;
  final AccountType accountType;
  final Color avatarColor;
}
