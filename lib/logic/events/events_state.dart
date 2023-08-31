part of 'events_bloc.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class EventsInitial extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  const EventsLoaded(this.events);
  final List<Event> events;
}

class EventsError extends EventsState {
  const EventsError(this.message);
  final String? message;
}
