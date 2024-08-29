import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// ignore: unused_import
import 'package:real_estate_marketplace/pages/account_page/Signin_page.dart';

class SignUpPage extends StatefulWidget {
  final TabController tabController;
  const SignUpPage({super.key, required this.tabController});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureConfirmationText = true;
  final List<String> items = [
    'Buyer/Renter',
    'Agent',
    'Investor',
    'Seller/Renter',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Full Name"),
              ),
              SizedBox(
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
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Email Address"),
              ),
              SizedBox(
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
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Password"),
              ),
              SizedBox(
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
                padding: const EdgeInsets.only(left: 30),
                child: Text("Confirm Password"),
              ),
              SizedBox(
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
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Sign Up as"),
              ),
              SizedBox(
                height: 15,
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select Item',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map(
                          (String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      // height: 50,
                      // width: 200,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            // color: Colors.black26,
                            ),
                        // color: Colors.redAccent,
                      ),
                      // elevation: 3,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.grey,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      // maxHeight: 300,
                      // width: 300,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black,
                            width: 0,
                          )
                          // color: Colors.redAccent,
                          ),
                      offset: const Offset(0, -30),

                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: WidgetStateProperty.all<double>(6),
                        thumbVisibility: WidgetStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      // overlayColor: WidgetStatePropertyAll(Colors.red),

                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                    // fixedSize: MaterialStatePropertyAll(),

                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    // backgroundColor:
                    //     WidgetStatePropertyAll(Colors.blueAccent[700]),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
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
                        color: Color.fromARGB(255, 173, 157, 247)),
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
                      padding: EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/images/google.png"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Colors.black, // Set border color
                          width: 1.0, // Set border width
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/images/call.png",
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
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

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    InkWell(
                      onTap: () {
                        widget.tabController
                            .animateTo(1); // Switch back to Sign In page
                      },
                      child: Text(
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
