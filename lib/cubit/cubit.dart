import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:news/modules/business.dart';
import 'package:news/modules/politics.dart';
import 'package:news/modules/sports.dart';
import 'package:news/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<AppState> {
  NewsCubit() : super(InitState());
  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> screens = const [
    PoliticsScreen(),
    BusinessScreen(),
    SportsScreen(),
  ];
  List business = [];
  List sports = [];
  List politics = [];
  List search = [];
  int currentIndex = 0;

  void refresh() {
    emit(InitState());
  }

  void changeBNB(index) {
    currentIndex = index;
    emit(ChangeBNBState());
  }

  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apikey': 'API_KEY',
    }).then((value) {
      business = value.data['articles'];
      emit(BusinessSuccessState());
    }).catchError((error) {
      emit(BusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(SportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apikey': 'API_KEY',
    }).then((value) {
      sports = value.data['articles'];
      emit(SportsSuccessState());
    }).catchError((error) {
      emit(SportsErrorState(error.toString()));
    });
  }

  void getPolitics() {
    emit(PoliticsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'politics',
      'apikey': 'API_KEY',
    }).then((value) {
      politics = value.data['articles'];
      emit(PoliticsSuccessState());
    }).catchError((error) {
      emit(PoliticsErrorState(error.toString()));
    });
  }

  void getSearch(String q) {
    emit(SearchLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'q': q,
      'apikey': 'API_KEY',
    }).then((value) {
      search = value.data['articles'];
      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchErrorState(error.toString()));
    });
  }
}
