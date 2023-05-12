import 'package:betchya/logic/api/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PointsCubit extends Cubit<int> {
  PointsCubit() : super(0);
  final ApiRepository apiRepository = ApiRepository();

  Future<void> update() async =>
      emit(await apiRepository.fetchRewardPoints() ?? 0);
}
