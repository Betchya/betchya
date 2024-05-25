import 'package:betchya/models/reward.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rewards_event.dart';
part 'rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  RewardsBloc() : super(RewardsInitial()) {
    // final ApiRepository apiRepository = ApiRepository();

    on<RewardsEvent>((event, emit) async {
      try {
        emit(RewardsLoading());
        // final mList = await apiRepository.fetchRewardList();
        // emit(RewardsLoaded(mList));
        // if (mList.error != null) {
        //   emit(EventsError(mList.error));
        // }
        // } on NetworkError {
        //   emit(const RewardsError("Failed to fetch data."));
      } catch (e) {
        emit(RewardsError(e.toString()));
      }
    });
  }
}
