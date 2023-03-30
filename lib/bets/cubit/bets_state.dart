part of 'bets_cubit.dart';

abstract class BetsState {
  const BetsState();
}

class BetsInitial extends BetsState {
  const BetsInitial();
}

class BetsLoading extends BetsState {
  const BetsLoading();
}

class BetsFailed extends BetsState {
  const BetsFailed(this.errorMessage);

  final String errorMessage;
}

class BetsLoaded extends BetsState {
  const BetsLoaded(this.items);

  final List<Bet> items;
}
