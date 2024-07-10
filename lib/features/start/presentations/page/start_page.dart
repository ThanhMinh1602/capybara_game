import 'package:capybara_game/features/start/presentations/binding/start_binding.dart';
import 'package:capybara_game/features/start/presentations/widgets/start_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: StartBinding.generateBloc,
      child: StartWidget(),
    );
  }
}
