import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/web.dart';
import 'package:real_estate_marketplace/bloc/user_bloc/user_bloc.dart';
import 'package:real_estate_marketplace/bloc/user_bloc/user_event.dart';
import 'package:real_estate_marketplace/pages/search_filter_page.dart';
import 'package:real_estate_marketplace/services/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/utility/show_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final SharedPreferences prefs = await SharedPreferences.getInstance();


    // google auth
    res.fold((l) async {
      final res = await auth.loginWithGoogle(
        email: l.email,
        google_id: l.id,
        name: l.displayName,
        avatar: l.photoUrl,
      );
      //
      res.fold(
        (l) {
          // error
          Logger().e(l);
          showSnackBar(context, l, Colors.red);
        },
        (r) {
          // success
          Logger().i('Success');
          context.read<UserBloc>().add(UserIsLoggedIn(user: r));
          prefs.setString('token', r.token);
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
