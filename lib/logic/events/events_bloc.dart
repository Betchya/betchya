import 'package:betchya/models/event.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitial()) {
    // final apiRepository = ApiRepository();

    on<EventsEvent>((event, emit) async {
      try {
        emit(EventsLoading());
        // final mList = await apiRepository.fetchEventList();
        // emit(EventsLoaded(mList));
        // if (mList.error != null) {
        //   emit(EventsError(mList.error));
        // }
      } catch (e) {
        emit(const EventsError('Failed to fetch data.'));
      }
    });
  }
}
