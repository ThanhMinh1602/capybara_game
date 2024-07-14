import 'package:capybara_game/features/app/presentations/binding/app_binding.dart';
import 'package:capybara_game/features/splash/presentations/page/splash_page.dart';
import 'package:capybara_game/services/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        AudioService().playBgm();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: AppBinding.generateBloc,
      child: ScreenUtilInit(
        designSize: const Size(720, 1612),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const SafeArea(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
            ),
          );
        },
      ),
    );
  }
}
