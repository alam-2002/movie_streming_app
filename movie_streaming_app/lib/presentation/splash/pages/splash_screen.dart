import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_streaming_app/core/configs/assets/app_images.dart';
import 'package:movie_streaming_app/core/configs/theme/app_colors.dart';
import 'package:movie_streaming_app/presentation/auth/page/sign_in.dart';
import 'package:movie_streaming_app/presentation/home/page/home_page.dart';
import 'package:movie_streaming_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:movie_streaming_app/presentation/splash/bloc/splash_states.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, SignInPage());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.sharkBlack.withOpacity(0.1),
                    AppColors.sharkBlack,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
