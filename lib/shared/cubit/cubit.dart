import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/modules/entertainment/entertainment_screen.dart';
import '/modules/business/business_screen.dart';
import '/modules/health/health_screen.dart';
import '/modules/science/science_screen.dart';
import '/modules/sports/sports_screen.dart';
import '/modules/technology/technology_screen.dart';
import '/shared/cubit/state.dart';
import '/shared/network/local/cache_helper.dart';
import '/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  /////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  int currentIndex = 0;
  String currentNews = 'أخبار الأعمال التجارية';

  ///////////////////////////////////////////////////////////
  String apiKeyValue = '9b64c7a1e13549798391ace62e1a5ef8';
  void changeAPIKeyValue() {
    if (apiKeyValue == '9b64c7a1e13549798391ace62e1a5ef8') {
      apiKeyValue = '1367a17c58e446f294e5626e319488b4';
    } else {
      apiKeyValue = '9b64c7a1e13549798391ace62e1a5ef8';
    }
    emit(NewsChangeAPIKeyValueState());
  }
  ///////////////////////////////////////////////////////////

  final List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    TechnologyScreen(),
    HealthScreen(),
    EntertainmentScreen(),
  ];

  final List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_rounded),
      label: 'الأعمال التجارية',
    ),
    /////////////////
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'الرياضة',
    ),
    //////////////////
    BottomNavigationBarItem(
      icon: Icon(Icons.science_rounded),
      label: 'العلوم',
    ),
    //////////////////
    BottomNavigationBarItem(
      icon: Icon(Icons.computer_rounded),
      label: 'التكنولوجيا',
    ),
    //////////////////
    BottomNavigationBarItem(
      icon: Icon(Icons.health_and_safety_outlined),
      label: 'الصحة',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mood_outlined),
      label: 'الترفيهية',
    ),
    //////////////////
  ];

  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    emit(NewsChangeBottonNavBarState());

    ///////// To get news for selected item /////////
    switch (index) {
      case 1:
        getSportsNews();
        break;
      case 2:
        getScienceNews();
        break;
      case 3:
        getTechnologyNews();
        break;
      case 4:
        getHealthNews();
        break;
      case 5:
        getEntertainmentNews();
        break;
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////// Business ///////////////////////////////////////////////////////
  List<dynamic> business = [];
  void getBusinessNews() {
    currentNews = 'أخبار الأعمال التجارية';
    if (business.isEmpty) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getResponse(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': apiKeyValue,
        },
      ).then((response) {
        business = response.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((err) {
        emit(NewsGetBusinessErrorState(error: err.toString()));
        changeAPIKeyValue();
        getBusinessNews();
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////// Sports /////////////////////////////////////////////////////////
  List<dynamic> sports = [];
  void getSportsNews() {
    currentNews = 'أخبار الرياضة';
    if (sports.isEmpty) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getResponse(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': apiKeyValue,
        },
      ).then((response) {
        sports = response.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((err) {
        emit(NewsGetSportsErrorState(error: err.toString()));
        changeAPIKeyValue();
        getSportsNews();
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////// Science ////////////////////////////////////////////////////////
  List<dynamic> science = [];
  void getScienceNews() {
    currentNews = 'أخبار العلوم';
    if (science.isEmpty) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getResponse(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': apiKeyValue,
        },
      ).then((response) {
        science = response.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((err) {
        emit(NewsGetScienceErrorState(error: err.toString()));
        changeAPIKeyValue();
        getScienceNews();
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////// Technology /////////////////////////////////////////////////////
  List<dynamic> technology = [];
  void getTechnologyNews() {
    currentNews = 'أخبار التكنولوجيا';
    if (technology.isEmpty) {
      emit(NewsGetTechnologyLoadingState());
      DioHelper.getResponse(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'technology',
          'apiKey': apiKeyValue,
        },
      ).then((response) {
        technology = response.data['articles'];
        emit(NewsGetTechnologySuccessState());
      }).catchError((err) {
        emit(NewsGetTechnologyErrorState(error: err.toString()));
        changeAPIKeyValue();
        getTechnologyNews();
      });
    } else {
      emit(NewsGetTechnologySuccessState());
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////// Health ////////////////////////////////////////////////////////
  List<dynamic> health = [];
  void getHealthNews() {
    currentNews = 'أخبار الصحة';
    if (health.isEmpty) {
      emit(NewsGetHealthLoadingState());
      DioHelper.getResponse(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'health',
          'apiKey': apiKeyValue,
        },
      ).then((response) {
        health = response.data['articles'];
        emit(NewsGetHealthSuccessState());
      }).catchError((err) {
        emit(NewsGetHealthErrorState(error: err.toString()));
        changeAPIKeyValue();
        getHealthNews();
      });
    } else {
      emit(NewsGetHealthSuccessState());
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////// Entertainment //////////////////////////////////////////////////
  List<dynamic> entertainment = [];
  void getEntertainmentNews() {
    currentNews = 'الأخبار الترفيهية';
    if (entertainment.isEmpty) {
      emit(NewsGetEntertainmentLoadingState());
      DioHelper.getResponse(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'entertainment',
          'apiKey': apiKeyValue,
        },
      ).then((response) {
        entertainment = response.data['articles'];
        emit(NewsGetEntertainmentSuccessState());
      }).catchError((err) {
        emit(NewsGetEntertainmentErrorState(error: err.toString()));
        changeAPIKeyValue();
        getEntertainmentNews();
      });
    } else {
      emit(NewsGetEntertainmentSuccessState());
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  List<dynamic> search = [];
  void getSearchNews({required String searchValue}) {
    emit(NewsGetSearchLoadingState());
    if (searchValue.trim().isNotEmpty) {
      DioHelper.getResponse(
        url: 'v2/top-headlines',
        query: {
          'q': searchValue.trim(),
          'apiKey': apiKeyValue,
        },
      ).then((response) {
        search = response.data['articles'];
        if (search.isEmpty) {
          emit(NewsGetSearchSuccessNoDataState());
        } else {
          emit(NewsGetSearchSuccessState());
        }
      }).catchError((err) {
        emit(NewsGetSearchErrorState(error: err.toString()));
      });
    } else {
      search = [];
      emit(NewsGetSearchSuccessState());
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  bool isDark = false;
  void changeAppMode() {
    isDark = !isDark;
    CacheHelper.saveThemeMode(isDarkValue: isDark).then(
      (value) {
        emit(NewsChangeAppModeState());
      },
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  void getAppModeSharedPreferences() {
    isDark = CacheHelper.getThemeMode();
    emit(NewsChangeAppModeState());
  }
}
