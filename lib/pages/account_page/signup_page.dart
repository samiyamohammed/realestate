import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:real_estate_marketplace/pages/account_page/Signin_page.dart';

class SignUpPage1 extends StatefulWidget {
  final TabController tabController;
  const SignUpPage1({super.key, required this.tabController});

  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureConfirmationText = true;

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
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Full Name"),
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
                    labelText: "Full Name",
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
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Confirm Password"),
              ),
              const SizedBox(
                height: 15,
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  obscureText: _obscureConfirmationText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      // icon: Icon(_obscureText
                      //     ? LucideIcons.eyeOff
                      //     : LucideIcons.eye),
                      icon: Icon(_obscureConfirmationText
                          ? Icons.remove_red_eye_rounded
                          : LucideIcons.eye),
                      // tooltip: _obscureText ? 'Show password' : 'Hide password',
                      onPressed: () => setState(() =>
                          _obscureConfirmationText = !_obscureConfirmationText),
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
              // const SizedBox(
              //   height: 16,
              // ),

              const SizedBox(
                height: 25,
              ),
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
                    'Register',
                    style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 173, 157, 247)),
                  )),

                  // child: _isSending ? const SizedBox(
                  //         height: 16,
                  //         width: 16,
                  //         child: CircularProgressIndicator(),
                  //       )
                  //     : const Text('Add Item'),
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
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0, // Set border width
                        ),
                      ),
                      child: Image.asset("assets/images/google.png"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 60,
                      width: 60,
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
                      child: Image.asset(
                        "assets/images/apple.png",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0, // Set border width
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/call.png",
                      ),
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
                      onTap: () {
                        widget.tabController
                            .animateTo(1); // Switch back to Sign In page
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.brown,
                            decoration: TextDecoration.underline),
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
  }
}
