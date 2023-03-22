import 'package:bloc/bloc.dart';

part 'bets_state.dart';

class BetsCubit extends Cubit<BetsState> {
  BetsCubit() : super(BetsInitial());
}
