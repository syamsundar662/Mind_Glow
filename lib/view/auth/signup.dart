import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_glow_test/utils/constants.dart';
import 'package:mind_glow_test/view%20model/auth_provider.dart';
import 'package:mind_glow_test/view/auth/signin.dart';
import 'package:mind_glow_test/view/widgets/custom_text_field.dart';
import 'package:mind_glow_test/view/widgets/sub_heading.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SubHeadings(title: 'Sign Up'),
            kHeight20,
            TextFormFields(
              hintText: 'Name',
              filledColor: Colors.grey.shade200,
              obscure: false,
              padding: homeSymmetricPadding,
              controller: _nameController,
            ),
            kHeight10,
            TextFormFields(
              hintText: 'Age',
              filledColor: Colors.grey.shade200,
              obscure: false, 
              padding: homeSymmetricPadding,
              controller: _ageController,
            ),
            kHeight10,
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

           
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.blueGrey)),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true; 
                      });
                      final authProvider =
                          Provider.of<AuthProvider>(context, listen: false);
                      try {
                        await authProvider.signUp(
                          _nameController.text,
                          _ageController.text,
                          _emailController.text,
                          _passwordController.text,
                        );

                        _nameController.clear();
                        _ageController.clear();
                        _emailController.clear();
                        _passwordController.clear();

                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SignInScreen()),
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
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.white)),
                  ),
            kHeight60,
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white)),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => SignInScreen()), (route) => false,);
              },
              child: const Text('Already have an account? Login',
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
        title: const Text('Sign Up Failed'),
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
