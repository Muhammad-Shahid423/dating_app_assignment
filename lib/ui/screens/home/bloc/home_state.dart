import 'package:dating_app_assignment/common/models/fruit_details.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<FruitDetails> listOfUserData;
  const HomeSuccessState(this.listOfUserData);

  @override
  List<Object?> get props => [listOfUserData];
}

class HomeErrorState extends HomeState {
  @override
  List<Object?> get props => [];
}