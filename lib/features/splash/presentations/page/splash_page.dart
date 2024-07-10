import 'package:capybara_game/features/splash/presentations/binding/splash_binding.dart';
import 'package:capybara_game/features/splash/presentations/widgets/splash_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: SplashBinding.generateBloc,
      child: SplashWidget(),
    );
  }
}
