import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_expence_event.dart';
part 'get_expence_state.dart';

class GetExpenceBlocDartBloc extends Bloc<GetExpenceBlocDartEvent, GetExpenceBlocDartState> {
  GetExpenceBlocDartBloc() : super(GetExpenceBlocDartInitial()) {
    on<GetExpenceBlocDartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
