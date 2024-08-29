// ignore_for_file: unused_field, unused_import

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SignInPage extends StatefulWidget {
  final TabController tabController;
  const SignInPage({super.key, required this.tabController});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureConfirmationText = true;

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Email Address"),
              ),
              const SizedBox(
                height: 15,
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  decoration: InputDecoration(
                    // hintText: 'Full Name',
                    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12),
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    filled: true,
                    // fillColor: Colors.grey[300],
                    labelText: "Email Address",
                    border: const OutlineInputBorder(
                      // borderSide: BorderSide.none,

                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be 1 and 50 characters.';
                    }
                    return null;
                  },
                  // onChanged: (value) => name = value,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //password
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Password"),
              ),
              const SizedBox(
                height: 15,
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      // icon: Icon(_obscureText
                      //     ? LucideIcons.eyeOff
                      //     : LucideIcons.eye),
                      icon: Icon(_obscureText
                          ? Icons.remove_red_eye_rounded
                          : LucideIcons.eye),
                      // tooltip: _obscureText ? 'Show password' : 'Hide password',
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                    ),
                    // hintText: 'Full Name',
                    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12),
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    filled: true,
                    // fillColor: Colors.grey[300],
                    // labelText: "Full Name",
                    border: const OutlineInputBorder(
                      // borderSide: BorderSide.none,

                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be 1 and 50 characters.';
                    }
                    return null;
                  },
                  // onChanged: (value) => name = value,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              //confirm password
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {},
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
              const SizedBox(
                height: 15,
              ),
              // const SizedBox(height: 5),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                    // fixedSize: MaterialStatePropertyAll(),

                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    // backgroundColor:
                    //     WidgetStatePropertyAll(Colors.blueAccent[700]),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Log in',
                      style: GoogleFonts.poppins(
                          // fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 173, 157, 247)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/images/google.png"),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0, // Set border width
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/images/apple.png",
                        fit: BoxFit.scaleDown,
                      ),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0, // Set border width
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/images/call.png",
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0, // Set border width
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  InkWell(
                    onTap: () {
                      widget.tabController
                          .animateTo(0); // Switch back to Sign In page
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.brown,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
