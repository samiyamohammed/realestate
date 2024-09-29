import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/web.dart';
import 'package:real_estate_marketplace/services/auth.dart';
import 'package:go_router/go_router.dart';

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

  void handleSocialLogin(BuildContext context) async {
    final res = await auth.googleAuth();
    // google auth
    res.fold((l) async {
      final res = await auth.loginWithGoogle();
      //
      res.fold(
        (l) {
          // error
          Logger().e(l);
        },
        (r) {
          // success
          Logger().i('Success');
          context.go('/home');
        },
      );
    },
        // error occurred
        (r) {
               Logger().e(r);

    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handleSocialLogin(context);
      },
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
