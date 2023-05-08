part of 'rewards_bloc.dart';

abstract class RewardsState extends Equatable {
  const RewardsState();

  @override
  List<Object> get props => [];
}

class RewardsInitial extends RewardsState {}

class RewardsLoading extends RewardsState {}

class RewardsLoaded extends RewardsState {
  final List<Reward> rewards;
  const RewardsLoaded(this.rewards);
}

class RewardsError extends RewardsState {
  final String? message;
  const RewardsError(this.message);
}
