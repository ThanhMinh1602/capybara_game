import 'package:capybara_game/features/app/presentations/binding/app_binding.dart';
import 'package:capybara_game/features/splash/presentations/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: AppBinding.generateBloc,
      child: ScreenUtilInit(
        designSize: const Size(720, 1612),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        },
      ),
    );
  }
}
