import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:real_estate_marketplace/bloc/auth_bloc/auth_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';

import 'package:lucide_icons/lucide_icons.dart';
import 'package:real_estate_marketplace/pages/faq_page.dart';
import 'package:real_estate_marketplace/widgets/account_button.dart';

import 'package:real_estate_marketplace/widgets/custom_textfield.dart';
import 'package:real_estate_marketplace/widgets/custom_textfield_forget.dart';
import 'package:real_estate_marketplace/widgets/social_buttons.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  // final TextEditingController controller = TextEditingController();
  String initialCountry = 'ET';
  PhoneNumber number = PhoneNumber(isoCode: 'ET');

  bool _obscureText = true;
  bool _obscureConfirmationText = true;
  String _password = '';
  late String name;
  late String email;
  late String password;
  late String passwordConfirmation;
  late var errorCode = 0;

  bool isConnectedToInternet = false;
  StreamSubscription? _internetConnectionStreamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      Logger().i(event);
      switch (event) {
        case InternetStatus.connected:
          setState(() {
            isConnectedToInternet = true;
          });
          ScaffoldMessenger.of(context).clearSnackBars();
          break;
        case InternetStatus.disconnected:
          setState(() {
            isConnectedToInternet = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Internet Connection Lost'),
              behavior: SnackBarBehavior.floating,
              // elevation: 3,
              backgroundColor: Colors.red,
              duration: Duration(days: 1),
            ),
          );
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('There Is No Internet Connection'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              duration: Duration(days: 1),
            ),
          );
          setState(() {
            isConnectedToInternet = false;
          });

          break;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _internetConnectionStreamSubscription?.cancel();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthCreateAccountFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is AuthCreateAccountSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('success'),
              ),
            );

            @override
            void dispose() {
              super.dispose();
              _internetConnectionStreamSubscription?.cancel();
            }

            context.go('/home');
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const FaqPage(),
            //   ),
            // );
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
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        "Email Confirmed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Set a new Password to access your account on your device.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text("Password"),
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormFieldForget(
                        labelText: '',
                        obscureText: _obscureText,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.remove_red_eye_rounded
                              : LucideIcons.eye),
                          onPressed: () =>
                              setState(() => _obscureText = !_obscureText),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length <= 7 ||
                              value.trim().length > 50) {
                            return 'Must be between 8 and 50 characters.';
                          } else if (!RegExp(
                                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#]).*$')
                              .hasMatch(value)) {
                            return 'Password must have:\n'
                                '- At least one uppercase letter\n'
                                '- At least one lowercase letter\n'
                                '- At least one number\n'
                                '- At least one special character (@, \$, !, %, *, ?, & or #)';
                          }

                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                            password = value;
                          });
                        }),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text("Confirm Password"),
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormFieldForget(
                      labelText: '',
                      obscureText: _obscureConfirmationText,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmationText
                            ? Icons.remove_red_eye_rounded
                            : LucideIcons.eye),
                        onPressed: () => setState(() =>
                            _obscureConfirmationText =
                                !_obscureConfirmationText),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length <= 1 ||
                            value.trim().length > 50) {
                          return 'Must be between 1 and 50 characters.';
                        } else if (value != _password) {
                          return 'Passwords do not match';
                        }

                        return null;
                      },
                      onChanged: (value) => passwordConfirmation = value,
                    ),
                    const SizedBox(height: 25),
                    // SignUpButton(onPressed: () => _submitForm()),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // context.read<AuthBloc>().add(AuthC(
                          //       pass: email,
                          //       password: password,
                          //     ));
                          context.push('/home');
                        }
                      },
                      child: Center(
                        child: Text(
                          'Submit',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 173, 157, 247),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
