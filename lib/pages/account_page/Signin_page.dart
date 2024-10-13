// ignore: unused_import
// ignore_for_file: file_names

// ignore: unused_import
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:real_estate_marketplace/bloc/auth_bloc/auth_bloc.dart';
import 'package:real_estate_marketplace/bloc/side_bar_bloc.dart';
import 'package:real_estate_marketplace/pages/faq_page.dart';
import 'package:real_estate_marketplace/widgets/account_button.dart';
import 'package:real_estate_marketplace/widgets/custom_textfield.dart';
import 'package:real_estate_marketplace/widgets/social_buttons.dart';

class SignInPage extends StatefulWidget {
  final TabController tabController;
  const SignInPage({super.key, required this.tabController});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  // ignore: prefer_final_fields, unused_field
  bool _obscureConfirmationText = true;

  String? selectedValue;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state is AuthLoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('success'),
            ),
          );

          // @override
          // void dispose() {
          //   super.dispose();
          //   _internetConnectionStreamSubscription?.cancel();
          // }
          context.go('/home');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FaqPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text("Email Address"),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    labelText: 'Email Address',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) => email = value,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text("Password"),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                      labelText: 'Password',
                      obscureText: _obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.remove_red_eye_rounded
                            : LucideIcons.eye),
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty
                            // value.trim().length <= 7 ||
                            // value.trim().length > 50
                            ) {
                          return 'Password is required.';
                        }
                        // else if (!RegExp(
                        //         r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#]).*$')
                        //     .hasMatch(value)) {
                        //   return 'Password must have:\n'
                        //       '- At least one uppercase letter\n'
                        //       '- At least one lowercase letter\n'
                        //       '- At least one number\n'
                        //       '- At least one special character (@, \$, !, %, *, ?, & or #)';
                        // }

                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      }),
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context.push(
                              '/forget_password',
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  // SignUpButton(onPressed: () => _submitForm()),
                  AccountButton(
                      title: "Log in",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthLoginRequested(
                                email: email,
                                password: password,
                              ));
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialLoginButton(
                          imagePath: "assets/social_media_icons/google.svg",
                          provider: 'google',
                        ),
                        SocialLoginButton(
                          imagePath: "assets/images/apple.png",
                          provider: 'apple',
                        ),
                        SocialLoginButton(
                          imagePath: "assets/images/call.png",
                          provider: 'call',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        InkWell(
                          onTap: () => widget.tabController.animateTo(1),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.brown,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
