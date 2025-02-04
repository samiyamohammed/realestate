import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:real_estate_marketplace/bloc/auth_bloc/auth_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';

import 'package:lucide_icons/lucide_icons.dart';
import 'package:real_estate_marketplace/pages/faq_page.dart';
import 'package:real_estate_marketplace/widgets/account_button.dart';

import 'package:real_estate_marketplace/widgets/custom_textfield.dart';
import 'package:real_estate_marketplace/widgets/social_buttons.dart';

class SignUpPage extends StatefulWidget {
  final TabController tabController;
  const SignUpPage({super.key, required this.tabController});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
    return BlocConsumer<AuthBloc, AuthState>(
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
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text("Full Name"),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    labelText: 'Full Name',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      } else if (value.trim().length < 2 ||
                          value.trim().length > 50) {
                        return 'Name must be between 2 and 50 characters';
                      } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                        return 'Name must contain only letters and spaces';
                      }
                      return null;
                    },
                    onChanged: (value) => name = value,
                  ),
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
                  // const Text(
                  //   'Phone Number',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // const SizedBox(height: 8),
                  // InternationalPhoneNumberInput(
                  //   initialValue: PhoneNumber(
                  //     dialCode: '+251',
                  //     phoneNumber: "",
                  //   ),
                  //   onInputChanged: (PhoneNumber number) {
                  //     _phoneNumberController.text =
                  //         number.phoneNumber ?? '';
                  //   },
                  //   selectorConfig: const SelectorConfig(
                  //     selectorType: PhoneInputSelectorType.DIALOG,
                  //     showFlags: true,
                  //   ),
                  //   ignoreBlank: false,
                  //   autoValidateMode: AutovalidateMode.disabled,
                  //   selectorTextStyle: const TextStyle(
                  //       color: Color.fromARGB(255, 255, 255, 255)),
                  //   textFieldController: TextEditingController(),
                  //     // ..text = state.phonenumber,
                  //   formatInput: true,
                  //   keyboardType:
                  //       const TextInputType.numberWithOptions(
                  //     signed: true,
                  //     decimal: true,
                  //   )
                  //   inputDecoration: const InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //   ),
                  //   inputBorder: const OutlineInputBorder(),
                  //   onSaved: (PhoneNumber number) {
                  //     // Handle phone number save
                  //   },
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Phone Number',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: InternationalPhoneNumberInput(
                      // spaceBetweenSelectorAndTextField: 0,

                      inputDecoration: const InputDecoration(
                        labelText: "Phone Number",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        // suffixIcon: suffixIcon,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),

                      onInputChanged: (PhoneNumber newNumber) {
                        // _phoneNumberController.text =
                        //     newNumber.phoneNumber ?? '';

                        number = newNumber;

                        Logger().i(number.phoneNumber);
                        Logger().i(number.isoCode);
                        Logger().i(_phoneNumberController.text);
                      },

                      onInputValidated: (bool value) {
                        print(value);
                      },

                      selectorConfig: const SelectorConfig(
                        useEmoji: true,
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                        setSelectorButtonAsPrefixIcon: true,
                        leadingPadding: 10,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: _phoneNumberController,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      // inputBorder: OutlineInputBorder(),
                      inputBorder: const OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     _formKey.currentState?.save();
                  //   },
                  //   child: Text('Save'),
                  // ),
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
                    padding: EdgeInsets.only(left: 30),
                    child: Text("Confirm Password"),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    labelText: 'Confirm Password',
                    obscureText: _obscureConfirmationText,
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirmationText
                          ? Icons.remove_red_eye_rounded
                          : LucideIcons.eye),
                      onPressed: () => setState(() =>
                          _obscureConfirmationText = !_obscureConfirmationText),
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
                  AccountButton(
                      title: "Register",
                      onPressed: () {
                        // Logger().i(number);
                        Logger().i(number.phoneNumber);
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                              AuthCreateAccountRequested(
                                  name: name,
                                  email: email,
                                  number: number.phoneNumber!,
                                  password: password,
                                  passwordConfirmation: passwordConfirmation));
                        }
                        Logger().i('this number${number.phoneNumber}');
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
                        const Text("Already have an account? "),
                        InkWell(
                          onTap: () => widget.tabController.animateTo(1),
                          child: const Text(
                            "Log in",
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
