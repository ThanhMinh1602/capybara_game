import 'package:capybara_game/features/map/presentations/binding/map_binding.dart';
import 'package:capybara_game/features/map/presentations/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: MapBinding.generateBloc,
      child: MapWidget(),
    );
  }
}
