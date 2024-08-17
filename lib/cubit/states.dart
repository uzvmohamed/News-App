abstract class AppState {}

class InitState extends AppState {}

class ChangeBNBState extends AppState {}

class BusinessLoadingState extends AppState {}

class BusinessSuccessState extends AppState {}

class BusinessErrorState extends AppState {
  final String error;
  BusinessErrorState(this.error);
}

class SportsLoadingState extends AppState {}

class SportsSuccessState extends AppState {}

class SportsErrorState extends AppState {
  final String error;
  SportsErrorState(this.error);
}

class PoliticsLoadingState extends AppState {}

class PoliticsSuccessState extends AppState {}

class PoliticsErrorState extends AppState {
  final String error;
  PoliticsErrorState(this.error);
}

class SearchLoadingState extends AppState {}

class SearchSuccessState extends AppState {}

class SearchErrorState extends AppState {
  final String error;
  SearchErrorState(this.error);
}
