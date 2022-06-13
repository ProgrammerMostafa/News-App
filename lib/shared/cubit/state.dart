abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeBottonNavBarState extends NewsStates {}

//////////////////// Business News /////////////////////////////////////////////
class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  String error;
  NewsGetBusinessErrorState({
    required this.error,
  });
}

//////////////////// Sports News ///////////////////////////////////////////////
class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  String error;
  NewsGetSportsErrorState({
    required this.error,
  });
}

//////////////////// Science News //////////////////////////////////////////////
class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  String error;
  NewsGetScienceErrorState({
    required this.error,
  });
}

//////////////////// Technology News ///////////////////////////////////////////
class NewsGetTechnologyLoadingState extends NewsStates {}

class NewsGetTechnologySuccessState extends NewsStates {}

class NewsGetTechnologyErrorState extends NewsStates {
  String error;
  NewsGetTechnologyErrorState({
    required this.error,
  });
}

///////////////////// Health News //////////////////////////////////////////////
class NewsGetHealthLoadingState extends NewsStates {}

class NewsGetHealthSuccessState extends NewsStates {}

class NewsGetHealthErrorState extends NewsStates {
  String error;
  NewsGetHealthErrorState({
    required this.error,
  });
}

//////////////////// Entertainment News ////////////////////////////////////////
class NewsGetEntertainmentLoadingState extends NewsStates {}

class NewsGetEntertainmentSuccessState extends NewsStates {}

class NewsGetEntertainmentErrorState extends NewsStates {
  String error;
  NewsGetEntertainmentErrorState({
    required this.error,
  });
}

//////////////////// ChangeAPIKeyValue ////////////////////////////////////////
class NewsChangeAPIKeyValueState extends NewsStates {}

////////////////////////////////////////////////////////////////////////////////
class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchSuccessNoDataState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  String error;
  NewsGetSearchErrorState({
    required this.error,
  });
}

////////////////////////////////////////////////////////////////////////////////
class NewsChangeAppModeState extends NewsStates {}
