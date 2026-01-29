import 'package:flutter/material.dart';
import 'package:urbleefront/features/home/screens/app_shell.dart';
import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/app_text_field.dart';
import '../../../core/constants/app_colors.dart';
import '../screens/register_screen.dart';
import '../screens/login_screen.dart';
import '../services/auth_service.dart';

class AuthForm extends StatefulWidget {
  final bool isLogin;

  const AuthForm({super.key, required this.isLogin});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  bool _loading = false;

  Future<void> _submit() async {
    setState(() => _loading = true);

    try {
      if (widget.isLogin) {
        await AuthService.login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        await AuthService.register(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AppShell()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isLogin ? 'Login failed' : 'Registration failed',
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Urblee',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              widget.isLogin ? 'Welcome back 👋' : 'Create your account',
              style: TextStyle(color: AppColors.textSecondary),
            ),

            const SizedBox(height: 20),

            if (!widget.isLogin) ...[
              AppTextField(
                hint: 'Name',
                icon: Icons.person,
                controller: _nameController,
              ),
              const SizedBox(height: 12),
            ],

            AppTextField(
              hint: 'Email',
              icon: Icons.email,
              controller: _emailController,
            ),

            const SizedBox(height: 12),

            AppTextField(
              hint: 'Password',
              icon: Icons.lock,
              obscure: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 20),

            AppButton(
              text: _loading
                  ? 'Please wait...'
                  : widget.isLogin
                  ? 'Login'
                  : 'Register',
              onPressed: _loading ? null : () => _submit(),
            ),


            const SizedBox(height: 12),

            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) =>
                    widget.isLogin
                        ? const RegisterScreen()
                        : const LoginScreen(),
                  ),
                );
              },
              child: Text(
                widget.isLogin
                    ? "Don't have an account? Register"
                    : "Already have an account? Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
