part of 'rewards_bloc.dart';

abstract class RewardsState extends Equatable {
  const RewardsState();

  @override
  List<Object> get props => [];
}

class RewardsInitial extends RewardsState {}

class RewardsLoading extends RewardsState {}

class RewardsLoaded extends RewardsState {
  const RewardsLoaded(this.rewards);
  final List<Reward> rewards;
}

class RewardsError extends RewardsState {
  const RewardsError(this.message);
  final String? message;
}
