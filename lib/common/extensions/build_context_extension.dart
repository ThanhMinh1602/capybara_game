import 'package:capybara_game/common/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BuildContextExtension on BuildContext {
  T getBloc<T extends Bloc>() => BlocProvider.of<T>(this);

  AppNavigator getNavigator() => AppNavigator.fromContext(this);
}
