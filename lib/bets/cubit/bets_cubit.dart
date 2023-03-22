import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:betchya/models/Bet.dart';
import 'package:bloc/bloc.dart';

part 'bets_state.dart';

class BetsCubit extends Cubit<BetsState> {
  BetsCubit() : super(const BetsInitial()) {
    queryListItems();
  }

  Future<void> addBet(String id, int amount, String description) async {
    try {
      final bet = Bet(
        amount: amount,
        isPlaced: true,
        description: description.isEmpty ? null : description,
      );

      final request = ModelMutations.create(bet);
      final response = await Amplify.API.mutate(request: request).response;

      final createdBet = response.data;
      if (createdBet == null) {
        emit(BetsFailed('errors: ${response.errors}'));
      }
      await queryListItems();
    } on ApiException catch (e) {
      emit(BetsFailed('Mutation failed: $e'));
    }
  }

  Future<void> queryListItems() async {
    try {
      emit(const BetsLoading());
      final request = ModelQueries.list(Bet.classType);
      final response = await Amplify.API.query(request: request).response;

      final bets =
          response.data?.items.whereType<Bet>().toList(growable: false);
      if (bets != null) {
        emit(BetsLoaded(bets));
      } else {
        emit(BetsFailed('Bets are empty: ${response.errors}'));
      }
    } on ApiException catch (e) {
      emit(BetsFailed('Query failed: $e'));
    }
  }
}
