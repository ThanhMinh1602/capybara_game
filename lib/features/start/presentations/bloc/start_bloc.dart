import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_event.dart';
part 'start_state.dart';
part 'start_bloc.freezed.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(const StartState());
}
