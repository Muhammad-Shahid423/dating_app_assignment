import 'package:dating_app_assignment/common/models/fruit_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repository/db_repositry.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DbRepository _DbRepository;
  HomeBloc(this._DbRepository) : super(HomeInitialState()) {
    on<HomeDataFetched>(_fetchUserData);
  }

  _fetchUserData(HomeDataFetched event, Emitter<HomeState> emit) async {
    List<FruitDetails> listofUserData = await _DbRepository.retrieveData();
    emit(HomeSuccessState(listofUserData));
  }
}