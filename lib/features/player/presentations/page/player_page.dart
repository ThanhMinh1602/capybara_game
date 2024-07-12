import 'package:capybara_game/features/player/presentations/binding/player_binding.dart';
import 'package:capybara_game/features/player/presentations/widgets/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerPage extends StatelessWidget {
  final int level;
  const PlayerPage({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: PlayerBinding.generateBloc,
      child: PlayerWidget(
        level: level,
      ),
    );
  }
}
