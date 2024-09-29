import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_marketplace/services/auth.dart';

class SocialLoginButton extends StatelessWidget {
  final String imagePath;
  final String provider;
  final double size;
  final Auth auth = Auth();

   SocialLoginButton({
    super.key,
    required this.imagePath,
    required this.provider,
    this.size = 60,
  });

  void handleSocialLogin() async {
    // switch (provider) {
    //   case 'google':
    //     print('I am clicked');
    //     await Auth.googleAuth();
    //     break;
    //   case 'apple':
    //     break;
    //   default:
    //     break;m
    // }

    await auth.googleAuth();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleSocialLogin,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: size,
        width: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: SvgPicture.asset(imagePath),
      ),
    );
  }
}
