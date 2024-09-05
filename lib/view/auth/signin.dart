import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_glow_test/utils/constants.dart';
import 'package:mind_glow_test/view%20model/auth_provider.dart';
import 'package:mind_glow_test/view/root/root_screen.dart';
import 'package:mind_glow_test/view/auth/signup.dart';
import 'package:mind_glow_test/view/widgets/custom_text_field.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';
import 'package:provider/provider.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // Track loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SubHeadings(title: 'Sign In'),
            kHeight20,
            TextFormFields(
              hintText: 'Email',
              filledColor: Colors.grey.shade200,
              obscure: false,
              padding: homeSymmetricPadding,
              controller: _emailController,
            ),
            kHeight10,
            TextFormFields(
              hintText: 'Password',
              filledColor: Colors.grey.shade200,
              obscure: true,
              padding: homeSymmetricPadding,
              controller: _passwordController,
            ),
            kHeight20,
            const SizedBox(height: 20),
            _isLoading // Show loading indicator if logging in
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blueGrey)),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true; // Set loading to true
                      });
                      try {
                        await Provider.of<AuthProvider>(context, listen: false)
                            .login(_emailController.text, _passwordController.text);
                        _emailController.clear();
                        _passwordController.clear();
                        Navigator.pushAndRemoveUntil(
                          // ignore: use_build_context_synchronously
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const RootScreen()),
                          (route) => false,
                        );
                      } catch (error) {
                        // ignore: use_build_context_synchronously
                        _showErrorDialog(context, error.toString());
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: const Text('Login', style: TextStyle(color: Colors.white)),
                  ),
            kHeight200,
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const SignUpScreen()),
                  (route) => false,
                );
              },
              child: const Text('Don’t have an account? Sign Up',
                  style: TextStyle(color: Colors.blueGrey)),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
